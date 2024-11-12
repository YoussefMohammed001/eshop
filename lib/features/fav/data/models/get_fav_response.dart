import 'package:eshop/core/models/products_model.dart';

class FavoritesResponse {
  final bool status;
  final String? message;
  final FavoritesData data;

  FavoritesResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory FavoritesResponse.fromJson(Map<String, dynamic> json) {
    return FavoritesResponse(
      status: json['status'],
      message: json['message'],
      data: FavoritesData.fromJson(json['data']),
    );
  }
}

class FavoritesData {
  final int currentPage;
  final List<FavoriteItem> favorites;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String? nextPageUrl;
  final String path;
  final int perPage;
  final String? prevPageUrl;
  final int to;
  final int total;

  FavoritesData({
    required this.currentPage,
    required this.favorites,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory FavoritesData.fromJson(Map<String, dynamic> json) {
    return FavoritesData(
      currentPage: json['current_page'],
      favorites: (json['data'] as List)
          .map((item) => FavoriteItem.fromJson(item))
          .toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class FavoriteItem {
  final int id;
  final ProductsModel product;

  FavoriteItem({
    required this.id,
    required this.product,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      id: json['id'],
      product: ProductsModel.fromJson(json['product']),
    );
  }
}

