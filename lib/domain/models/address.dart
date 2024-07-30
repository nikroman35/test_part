class AddressModel {
  final int id;
  final String fullAddress;
  final String? country;
  final String? house;
  final String? region;
  final String? cityDistrict;
  final String city;
  final String street;

  final ({double lat, double lon})? geo;

  AddressModel(
      {required this.id,
      required this.fullAddress,
      this.country,
      this.house,
      this.region,
      this.cityDistrict,
      required this.city,
      required this.street,
      this.geo});
}
