import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart'; // This is the generated file

@JsonSerializable()
class ProductDetailsResponse {
  final bool status;
  final String? message;
  final ProductDetailsData data;

  ProductDetailsResponse({required this.status, this.message, required this.data});

  // Factory constructor for creating a new ProductResponse instance from a map
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) => _$ProductDetailsResponseFromJson(json);

  // Method to convert a ProductResponse instance to a map
  Map<String, dynamic> toJson() => _$ProductDetailsResponseToJson(this);
}

@JsonSerializable()
class ProductDetailsData {
  final int id;
  final double price;
  @JsonKey(name: 'old_price')
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  @JsonKey(name: 'in_favorites')
  final bool inFavorites;
  @JsonKey(name: 'in_cart')
  final bool inCart;
  final List<String> images;

  ProductDetailsData({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
    required this.images,
  });

  // Factory constructor for creating a new ProductData instance from a map
  factory ProductDetailsData.fromJson(Map<String, dynamic> json) => _$ProductDetailsDataFromJson(json);

  // Method to convert a ProductData instance to a map
  Map<String, dynamic> toJson() => _$ProductDetailsDataToJson(this);
}