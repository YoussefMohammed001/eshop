import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/home/data/models/home_response.dart';
import 'package:eshop/features/home/domain/entities/home_entities.dart';

class HomeMapper {
  static HomeEntities mapToEntity(HomeData data) {
    safePrint("Fetched Products: ${data.products.length}");
    return HomeEntities(
      banners: data.banners.map((e) => mapToBannerEntity(e)).toList(),
      products: data.products.map((e) => mapToProductEntity(e)).toList(),
    );
  }


  static HomeBannerEntities mapToBannerEntity(HomeBanner banner) {
    return HomeBannerEntities(
      image: banner.image,
      id: banner.id,
    );

  }

  static ProductEntities mapToProductEntity(HomeProducts product) {
    return ProductEntities(
      id: product.id,
      image: product.image,
      name: product.name,
      price: product.price,
      isFav: product.inFavorites,
      oldPrice: product.oldPrice, isInCart: product.inCart, discount: product.discount.toDouble(), images: product.images, description: '',
    );
  }
}