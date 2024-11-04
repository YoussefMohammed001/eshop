import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart'; // This file will be generated

@JsonSerializable()
class HomeResponse {
  final bool status;
  final String? message;
  final HomeData data;

  HomeResponse({required this.status, this.message, required this.data});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

@JsonSerializable()
class HomeData {
  final List<HomeBanner> banners;
  final List<HomeProducts> products;

  HomeData({required this.banners, required this.products});

  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}

@JsonSerializable()
class HomeBanner {
  final int id;
  final String image;
  final String? category;
  final String? product;

  HomeBanner({required this.id, required this.image, this.category, this.product});

  factory HomeBanner.fromJson(Map<String, dynamic> json) => _$HomeBannerFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBannerToJson(this);
}

@JsonSerializable()
class HomeProducts {
  final int id;
  final double price;
  @JsonKey(name: 'old_price')
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  @JsonKey(name: 'in_favorites')
  final bool inFavorites;
  @JsonKey(name: 'in_cart')
  final bool inCart;

  HomeProducts({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory HomeProducts.fromJson(Map<String, dynamic> json) => _$HomeProductsFromJson(json);

  Map<String, dynamic> toJson() => _$HomeProductsToJson(this);
}