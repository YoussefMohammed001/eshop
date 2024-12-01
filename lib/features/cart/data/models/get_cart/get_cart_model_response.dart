import 'package:eshop/core/models/products_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_model_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CartResponse {
  final bool status;
  final String? message;
  final CartData data;

  CartResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) => _$CartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CartData {
  @JsonKey(name: 'cart_items')
  final List<CartItem> cartItems;
  @JsonKey(name: 'sub_total')
  final int subTotal;
  final int total;

  CartData({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => _$CartDataFromJson(json);
  Map<String, dynamic> toJson() => _$CartDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CartItem {
  final int id;
  final int quantity;
  final ProductsModel product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

