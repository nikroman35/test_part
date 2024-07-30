import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_part/data/network/network_const.dart';

import '../models/data.dart';
import 'package:http/http.dart' as http;

abstract interface class PlaceService {
  Future<PlaceDto?> placeById(int id);
  Future<Uint8List?> imageData(String url);
}

@Injectable(as: PlaceService)
class PlaceServiceImpl implements PlaceService {
  final Dio _dio;

  PlaceServiceImpl(this._dio);

  @override
  Future<PlaceDto?> placeById(int id) async {
    var result = await _dio.get(
      '${NetworkConstants.places}/$id',
    );
    var post = PlaceDto.fromJson(json.decode(result.data));
    return post;
  }

  @override
  Future<Uint8List?> imageData(String url) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
    return null;
  }
}
