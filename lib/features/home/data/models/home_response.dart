import 'package:eshop/core/models/products_model.dart';
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
  final List<ProductsModel> products;

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

