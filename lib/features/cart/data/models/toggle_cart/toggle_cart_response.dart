import 'package:json_annotation/json_annotation.dart';

part 'toggle_cart_response.g.dart';

@JsonSerializable()
class ToggleCartResponse {
  final bool status;
  final String message;
  final ToggleCartData? data;

  ToggleCartResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory ToggleCartResponse.fromJson(Map<String, dynamic> json) =>
      _$ToggleCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleCartResponseToJson(this);
}

@JsonSerializable()
class ToggleCartData {
  final int id;
  final int quantity;
  final Product product;

  ToggleCartData({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory ToggleCartData.fromJson(Map<String, dynamic> json) =>
      _$ToggleCartDataFromJson(json);

  Map<String, dynamic> toJson() => _$ToggleCartDataToJson(this);
}

@JsonSerializable()
class Product {
  final int id;
  final double price;
  @JsonKey(name: 'old_price')
  final double oldPrice;
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