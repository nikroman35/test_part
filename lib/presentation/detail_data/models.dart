import '../../core/common_types/place_tag.dart';
import '../../domain/models/place.dart';

class PlaceScreenModel {
  final int id;
  final String title;
  final String description;
  final String contacts;
  final PlaceWorkTime workTime;
  final String? imageUrl;
  final List<String> images;
  final String? fullAddress;
  final ({double lat, double lon})? geoPoint;
  final List<PlaceTag> tags;

  const PlaceScreenModel({
    required this.id,
    required this.title,
    required this.description,
    required this.contacts,
    required this.workTime,
    this.imageUrl,
    required this.images,
    required this.fullAddress,
    required this.geoPoint,
    required this.tags,
  });
}

class PlaceMapViewData {
  final String title;
  final double lat;
  final double lon;

  final ({double lat, double lon})? userGeo;

  PlaceMapViewData({required this.title, required this.lat, required this.lon, required this.userGeo});
}
