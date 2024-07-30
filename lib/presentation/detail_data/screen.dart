import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:flutter_html/flutter_html.dart' as html;

import 'package:html/dom.dart' as dom;

import '../custom_views/loader.dart';
import '../custom_views/tag_view.dart';
import '../resources/images.dart';
import '../resources/text_styles.dart';
import '../resources/theme.dart';
import 'bloc.dart';

class DetailPlaceScreen extends StatefulWidget {
  const DetailPlaceScreen({super.key});

  @override
  State<DetailPlaceScreen> createState() => _DetailPlaceScreenState();
}

class _DetailPlaceScreenState extends State<DetailPlaceScreen> {
  final scrollController = ScrollController();
  final pageViewController = PageController();
  final iconColorTween = ColorTween(begin: AppColors.neutral, end: AppColors.charcoal);

  int _currentPageIndex = 0;

  Color get iconColor => iconColorTween.transform(lerp) ?? AppColors.neutral;
  double lerp = 0.0;
  List<String> _images = [];

  @override
  void initState() {
    scrollController.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(listener);
    super.dispose();
  }

  void listener() {
    var offset = scrollController.offset;
    setState(() => lerp =
        offset < MediaQuery.of(context).size.height * 0.34 ? offset / MediaQuery.of(context).size.height * 0.34 : 1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailPlaceBloc, DetailPlaceState>(listener: (context, state) {
      if (state.data != null) {
        _images = [];
        if (state.data!.imageUrl != null) {
          _images.add(state.data!.imageUrl!);
        }
        _images.addAll(state.data!.images);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.neutral,
        body: Stack(children: [
          if (state.data != null)
            CustomScrollView(controller: scrollController, slivers: [
              SliverAppBar(
                pinned: true,
                stretch: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                expandedHeight: MediaQuery.of(context).size.height * 0.34,
                toolbarHeight: 30,
                flexibleSpace: (_images.isNotEmpty) ? customFlexibleBar(state) : null,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: state.data!.tags.map((e) {
                            return TagView(e.name, e.id);
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: html.Html(
                          data: state.data!.description,
                          style: {
                            'p': html.Style.fromTextStyle(AppTextStyles.bodySmallRegular(color: AppColors.charcoal))
                          },
                          onLinkTap: (String? url, Map<String, String> attributes, dom.Element? element) async {
                            if (url != null && url.isNotEmpty) {
                              context.read<DetailPlaceBloc>().add(DetailPlaceEvent.openUrl(url));
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Text(
                          'Адрес: ${state.data!.fullAddress}',
                          style: AppTextStyles.bodySmallRegular(color: AppColors.charcoal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: 330,
                          child: YandexMap(
                            tiltGesturesEnabled: false,
                            zoomGesturesEnabled: false,
                            rotateGesturesEnabled: false,
                            scrollGesturesEnabled: false,
                            mapObjects: [
                              if (state.data!.geoPoint != null)
                                PlacemarkMapObject(
                                    mapId: MapObjectId(state.data!.title),
                                    opacity: 1,
                                    icon: PlacemarkIcon.single(
                                      PlacemarkIconStyle(
                                        image: BitmapDescriptor.fromAssetImage(
                                          AppAssets.userMapPin,
                                        ),
                                        scale: 2,
                                      ),
                                    ),
                                    point: Point(
                                        latitude: state.data!.geoPoint!.lat, longitude: state.data!.geoPoint!.lon))
                            ],
                            onMapCreated: (controller) async {
                              if (state.data!.geoPoint != null) {
                                await Future.delayed(const Duration(milliseconds: 100));
                                await controller.moveCamera(
                                  animation: const MapAnimation(type: MapAnimationType.linear, duration: 0.3),
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: Point(
                                        latitude: state.data!.geoPoint!.lat,
                                        longitude: state.data!.geoPoint!.lon,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ]),
          if (state.isLoading)
            const Padding(
              padding: EdgeInsets.only(top: 128, bottom: 250),
              child: Center(child: BaseLoadingIndicator(height: 52, width: 52)),
            ),
        ]),
      );
    });
  }

  Widget customFlexibleBar(DetailPlaceState state) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Stack(
        alignment: AlignmentDirectional.bottomStart,
        fit: StackFit.expand,
        children: [
          SizedBox(
              height: 277,
              width: double.infinity,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: pageViewController,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                children: _images.map((e) {
                  return FadeInImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(e),
                    placeholder: const AssetImage(AppAssets.appIcon),
                  );
                }).toList(),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: _images.length > 1 && _currentPageIndex > 0,
                  child: InkWell(
                    onTap: () {
                      if (_currentPageIndex > 0) {
                        pageViewController.animateToPage(
                          _currentPageIndex - 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: SizedBox(
                      height: double.infinity,
                      child: SvgPicture.asset(
                        AppAssets.arrowLeft,
                        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _images.length > 1 && _currentPageIndex < _images.length - 1,
                  child: InkWell(
                    onTap: () {
                      if (_currentPageIndex < _images.length - 1) {
                        pageViewController.animateToPage(
                          _currentPageIndex + 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: SizedBox(
                      height: double.infinity,
                      child: SvgPicture.asset(
                        AppAssets.arrowRight,
                        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (state.data?.title != null)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 57,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.charcoal.withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Text(
                    state.data!.title,
                    style: AppTextStyles.heading3(color: AppColors.white),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
