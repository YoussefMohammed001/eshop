import 'package:json_annotation/json_annotation.dart';

part 'update_cart_response.g.dart';

@JsonSerializable()
class UpdateCartResponse {
  final bool status;
  final String message;
  final UpdateCartData? data;

  UpdateCartResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory UpdateCartResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartResponseToJson(this);
}

@JsonSerializable()
class UpdateCartData {
  final Cart cart;
  @JsonKey(name: 'sub_total')
  final double subTotal;
  final double total;

  UpdateCartData({
    required this.cart,
    required this.subTotal,
    required this.total,
  });

  factory UpdateCartData.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartDataFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartDataToJson(this);
}

@JsonSerializable()
class Cart {
  final int id;
  final int quantity;
  final UpdateCartProduct product;

  Cart({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class UpdateCartProduct {
  final int id;
  final double price;
  @JsonKey(name: 'old_price')
  final double oldPrice;
  final int discount;
  final String image;

  UpdateCartProduct({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory UpdateCartProduct.fromJson(Map<String, dynamic> json) => _$UpdateCartProductFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartProductToJson(this);
}