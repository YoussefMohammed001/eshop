import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final bool status;
  final String? message;
  final CategoryData? data;

  CategoriesResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseToJson(this);
}

@JsonSerializable()
class CategoryData {

  final List<CategoryItem> data;


  CategoryData({
    required this.data,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}

@JsonSerializable()
class CategoryItem {
  final int id;
  final String name;
  final String image;

  CategoryItem({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}