library detail_place_bloc;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/services/url_launcher.dart';
import '../../domain/usecases/places_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@Injectable()
class DetailPlaceBloc extends Bloc<DetailPlaceEvent, DetailPlaceState> {
  final PlaceUseCase useCase;
  final int placeId;

  DetailPlaceBloc(
    this.useCase,
    @factoryParam this.placeId,
  ) : super(DetailPlaceState(data: null, isLoading: false)) {
    on<_InitEvent>(_init);
    on<_OpenUrlEvent>(_openUrl);
  }

  Future<void> _init(
    _InitEvent event,
    Emitter<DetailPlaceState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    var place = await useCase.getPlace(placeId);
    emit(state.copyWith(data: place, isLoading: false));
  }

  Future<void> _openUrl(
    _OpenUrlEvent event,
    Emitter<DetailPlaceState> emit,
  ) async {
    bool canLaunch = await URLLauncher.canLaunchUrl(event.url);
    if (canLaunch) {
      URLLauncher.launchUrl(event.url);
    }
  }
}
