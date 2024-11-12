import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/models/products_model.dart';
import 'package:eshop/features/fav/data/models/get_fav_response.dart';
import 'package:eshop/features/fav/domain/entities/fav_entities.dart';

class FavMapper {
  static FavEntities mapToEntities(FavoriteItem favItem) {
    return FavEntities(
      id: favItem.id,
        productEntities: mapToProductEntity(favItem.product),
    );
  }


  static ProductEntities mapToProductEntity(ProductsModel product) {
    return ProductEntities(
      id: product.id,
      image: product.image,
      name: product.name,
      price: product.price,
      isFav: product.inFavorites,
      oldPrice: product.oldPrice,
      isInCart: product.inCart,
      discount: product.discount.toDouble(),
      images: product.images,
      description: '',
    );
  }




}
