// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: CartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.toJson(),
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
      cartItems: (json['cart_items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTotal: (json['sub_total'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'cart_items': instance.cartItems.map((e) => e.toJson()).toList(),
      'sub_total': instance.subTotal,
      'total': instance.total,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      product: ProductsModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product.toJson(),
    };
