import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/models/products_model.dart';

class SearchMapper{

  static List<ProductEntities> mapToProductEntity(List<ProductsModel> product) {
    return product.map((e)=> ProductEntities(id: e.id, image: e.image, name: e.name, price: e.price, isFav: e.inFavorites, oldPrice: e.oldPrice, isInCart: e.inCart, discount: e.discount.toDouble(), images: e.images, description: e.description)).toList();
  }

}