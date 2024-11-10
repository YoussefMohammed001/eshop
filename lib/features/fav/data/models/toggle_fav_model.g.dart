// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toggle_fav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToggleFavoriteResponse _$ToggleFavoriteResponseFromJson(
        Map<String, dynamic> json) =>
    ToggleFavoriteResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ToggleFavoriteData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToggleFavoriteResponseToJson(
        ToggleFavoriteResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ToggleFavoriteData _$ToggleFavoriteDataFromJson(Map<String, dynamic> json) =>
    ToggleFavoriteData(
      id: (json['id'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ToggleFavoriteDataToJson(ToggleFavoriteData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      oldPrice: (json['old_price'] as num).toInt(),
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
