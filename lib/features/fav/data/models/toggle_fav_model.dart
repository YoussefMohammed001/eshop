import 'package:json_annotation/json_annotation.dart';

part 'toggle_fav_model.g.dart';

@JsonSerializable()
class ToggleFavoriteResponse {
  final bool status;
  final String message;
  final ToggleFavoriteData? data; // Make data nullable

  ToggleFavoriteResponse({
    required this.status,
    required this.message,
    this.data, // Remove `required` for nullable field
  });

  factory ToggleFavoriteResponse.fromJson(Map<String, dynamic> json) => _$ToggleFavoriteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleFavoriteResponseToJson(this);
}

@JsonSerializable()
class ToggleFavoriteData {
  final int id;
  final Product product;

  ToggleFavoriteData({
    required this.id,
    required this.product,
  });

  factory ToggleFavoriteData.fromJson(Map<String, dynamic> json) => _$ToggleFavoriteDataFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleFavoriteDataToJson(this);
}

@JsonSerializable()
class Product {
  final int id;
  final int price;
  @JsonKey(name: 'old_price')
  final int oldPrice;
  final int discount;
  final String image;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}