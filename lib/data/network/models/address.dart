part of 'data.dart';

@JsonSerializable(createToJson: false)
class AddressDto implements ModelConverter<AddressModel> {
  final int id;

  @JsonKey(name: 'full')
  final String fullAddress;

  final String? country;
  final String? house;
  final String? region;

  @JsonKey(name: 'city_district')
  final String? cityDistrict;

  final String city;
  final String street;

  @JsonKey(name: 'latitude', fromJson: _intFromString)
  final double? lat;

  @JsonKey(name: 'longitude', fromJson: _intFromString)
  final double? lon;

  AddressDto(
      {required this.id,
      required this.fullAddress,
      required this.country,
      required this.house,
      required this.region,
      required this.cityDistrict,
      required this.city,
      required this.street,
      required this.lat,
      required this.lon});

  static double? _intFromString(String data) => double.tryParse(data);

  factory AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

  @override
  AddressModel convertToModel() {
    return AddressModel(
        id: id,
        fullAddress: fullAddress,
        country: country,
        house: house,
        region: region,
        cityDistrict: cityDistrict,
        city: city,
        street: street,
        geo: (lat != null && lon != null) ? (lat: lat!, lon: lon!) : null);
  }
}
