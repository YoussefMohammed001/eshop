import 'package:json_annotation/json_annotation.dart';
part 'products_model.g.dart';
@JsonSerializable()
class ProductsModel {
  @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: 0.0)
  final double price;
  @JsonKey(name: 'old_price', defaultValue: 0.0)
  final double oldPrice;
  @JsonKey(defaultValue: 0)
  final int discount;
  @JsonKey(defaultValue: "")
  final String image;
  @JsonKey(defaultValue: "")
  final String name;
  @JsonKey(defaultValue: "")
  final String description;
  @JsonKey(defaultValue: [])
  final List<String> images;
  @JsonKey(name: 'in_favorites',defaultValue: false)
  final bool inFavorites;
  @JsonKey(name: 'in_cart',defaultValue: false)
  final bool inCart;

  ProductsModel({
    required this.id,
    required this.price,
    required  this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);

}
