part of 'data.dart';

@JsonSerializable(createToJson: false)
class PlaceDto implements ModelConverter<PlaceModel> {
  final int id;
  final String title;
  final String description;
  final String contacts;

  @JsonKey(name: 'work_time', fromJson: _workTimeFromInt)
  final int workTime;

  @JsonKey(name: 'tags', fromJson: _tagFromJson)
  final List<PlaceTag>? tags;

  @JsonKey(name: 'image', fromJson: _urlFromImage)
  final String? imageUrl;

  @JsonKey(name: 'images', fromJson: _imagesFromJson)
  final List<String>? images;

  final AddressDto? address;

  final CategoryDto? category;

  static int _workTimeFromInt(String value) => int.parse(value);

  static String? _urlFromImage(Map<String, dynamic> map) => map['url'] as String;

  static List<String>? _imagesFromJson(List<dynamic>? map) => map?.map((e) {
        return e['url'] as String;
      }).toList();

  static List<PlaceTag>? _tagFromJson(List<dynamic>? json) => json
      ?.map((e) => PlaceTag(
            (e['id'] as num).toInt(),
            e['name'] as String,
          ))
      .toList();

  PlaceDto({
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

  factory PlaceDto.fromJson(Map<String, dynamic> json) => _$PlaceDtoFromJson(json);

  @override
  PlaceModel convertToModel() {
    return PlaceModel(
        id: id,
        title: title,
        description: description,
        contacts: contacts,
        workTime: PlaceWorkTime.fromInt(workTime),
        tags: tags,
        imageUrl: imageUrl,
        images: images,
        address: address?.convertToModel(),
        category: category?.convertToModel());
  }
}
