import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/models/products_model.dart';
import 'package:eshop/features/cart/data/models/get_cart/get_cart_model_response.dart';
import 'package:eshop/features/cart/domain/entities/cart_entities.dart';

class CartMapper {
  static CartEntities mapTOEntities(CartData cartData) {
    return CartEntities(

      subTotal: cartData.subTotal.toDouble(),
      cartItemsEntities: mapToCartItemsEntitiesList(cartData.cartItems),
    );
  }

  static List<CartItemsEntities> mapToCartItemsEntitiesList(List<CartItem> cartItems) {
    return cartItems.map((item) => CartItemsEntities(
   productCartId: item.id,
      productEntities: mapToProductEntity(item.product),
      quantity: item.quantity,
    )).toList();
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
      description: product.description,
    );
  }

}