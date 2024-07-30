// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      id: (json['id'] as num).toInt(),
      fullAddress: json['full'] as String,
      country: json['country'] as String?,
      house: json['house'] as String?,
      region: json['region'] as String?,
      cityDistrict: json['city_district'] as String?,
      city: json['city'] as String,
      street: json['street'] as String,
      lat: AddressDto._intFromString(json['latitude'] as String),
      lon: AddressDto._intFromString(json['longitude'] as String),
    );

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

PlaceDto _$PlaceDtoFromJson(Map<String, dynamic> json) => PlaceDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      contacts: json['contacts'] as String,
      workTime: PlaceDto._workTimeFromInt(json['work_time'] as String),
      tags: PlaceDto._tagFromJson(json['tags'] as List?),
      imageUrl: PlaceDto._urlFromImage(json['image'] as Map<String, dynamic>),
      images: PlaceDto._imagesFromJson(json['images'] as List?),
      address: json['address'] == null
          ? null
          : AddressDto.fromJson(json['address'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryDto.fromJson(json['category'] as Map<String, dynamic>),
    );
