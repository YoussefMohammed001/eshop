// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleCartResponse _$ToggleCartResponseFromJson(Map<String, dynamic> json) =>
    ToggleCartResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ToggleCartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToggleCartResponseToJson(ToggleCartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ToggleCartData _$ToggleCartDataFromJson(Map<String, dynamic> json) =>
    ToggleCartData(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToggleCartDataToJson(ToggleCartData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      oldPrice: (json['old_price'] as num).toDouble(),
      discount: (json['discount'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
    };
