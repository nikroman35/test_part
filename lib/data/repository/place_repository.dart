import 'dart:typed_data';

import 'package:test_part/data/network/api/place.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/place.dart';

abstract class PlacesRepository {
  Future<PlaceModel?> getPlace(int id);
  Future<Uint8List?> imageData(String url);
}

@Injectable(as: PlacesRepository)
class PlacesRepositoryImpl implements PlacesRepository {
  final PlaceService _placesService;

  PlacesRepositoryImpl(this._placesService);

  @override
  Future<PlaceModel?> getPlace(int id) async {
    final placeData = await _placesService.placeById(id);
    return placeData?.convertToModel();
  }

  @override
  Future<Uint8List?> imageData(String url) async {
    final result = await _placesService.imageData(url);
    return result;
  }
}
