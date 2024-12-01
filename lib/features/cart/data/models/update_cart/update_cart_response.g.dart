// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartResponse _$UpdateCartResponseFromJson(Map<String, dynamic> json) =>
    UpdateCartResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : UpdateCartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateCartResponseToJson(UpdateCartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UpdateCartData _$UpdateCartDataFromJson(Map<String, dynamic> json) =>
    UpdateCartData(
      cart: Cart.fromJson(json['cart'] as Map<String, dynamic>),
      subTotal: (json['sub_total'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$UpdateCartDataToJson(UpdateCartData instance) =>
    <String, dynamic>{
      'cart': instance.cart,
      'sub_total': instance.subTotal,
      'total': instance.total,
    };

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      product:
          UpdateCartProduct.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };

UpdateCartProduct _$UpdateCartProductFromJson(Map<String, dynamic> json) =>
    UpdateCartProduct(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      oldPrice: (json['old_price'] as num).toDouble(),
      discount: (json['discount'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$UpdateCartProductToJson(UpdateCartProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
    };
