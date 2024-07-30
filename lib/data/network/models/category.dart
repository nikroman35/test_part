
part of 'data.dart';

@JsonSerializable(createToJson: false)
class CategoryDto implements ModelConverter<CategoryModel> {
  final int id;
  final String name;

  const CategoryDto({required this.id, required this.name});

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  @override
  CategoryModel convertToModel() {
    return CategoryModel(id: id, name: name);
  }
}
