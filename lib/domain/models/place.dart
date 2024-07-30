
import 'package:test_part/domain/models/address.dart';
import 'package:test_part/domain/models/category.dart';

import '../../core/common_types/place_tag.dart';

enum PlaceWorkTime {
  day,
  morning,
  night;

  factory PlaceWorkTime.fromInt(int value) {
    switch (value) {
      case 1:
        return PlaceWorkTime.day;
      case 2:
        return PlaceWorkTime.morning;
      default:
        return PlaceWorkTime.night;
    }
  }
}

class PlaceModel {
  final int id;
  final String title;
  final String description;
  final String contacts;

  final PlaceWorkTime workTime;

  final List<PlaceTag>? tags;
  final String? imageUrl;

  final List<String>? images;

  final AddressModel? address;

  final CategoryModel? category;

  PlaceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.contacts,
    required this.workTime,
    required this.tags,
    this.imageUrl,
    required this.images,
    this.address,
    this.category,
  });

}
