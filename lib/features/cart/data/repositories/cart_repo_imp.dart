import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/cart/data/data_sources/cart_api.dart';
import 'package:eshop/features/cart/data/mapper.dart';
import 'package:eshop/features/cart/data/models/toggle_cart/toggle_cart_response.dart';
import 'package:eshop/features/cart/data/models/update_cart/update_cart_response.dart';
import 'package:eshop/features/cart/domain/entities/cart_entities.dart';
import 'package:eshop/features/cart/domain/entities/update_cart_entities.dart';
import 'package:eshop/features/cart/domain/repositories/cart_base_repo.dart';
import 'package:eshop/generated/intl/messages_ar.dart';

class CartRepoImp extends CartBaseRepo{
  final CartApi cartApi;

  CartRepoImp({required this.cartApi});

  @override
  Future<CartEntities> getCart() async {
    try{
      final response =await cartApi.getCart();
      CartEntities cartEntities = CartMapper.mapTOEntities(response);
      safePrint("cart total${cartEntities.subTotal}");
      return cartEntities;
    }catch(e){
      safePrint("error repo$e");
      rethrow;
    }
  }

  @override
  Future<UpdateCartEntities> updateCart({required int id, required int quantity}) async {
    try{
      final response = await cartApi.updateCart(id: id, quantity: quantity);
      UpdateCartEntities cartEntities = UpdateCartMapper.mapToEntities(response);
      return cartEntities;
    }catch(e){
      safePrint("error repo$e");
      rethrow;
    }
  }

  @override
  Future<ToggleCartResponse> toggleCart({required int id}) {
   final response = cartApi.toggleCart(id: id);
    return response;
  }

}

class UpdateCartMapper{
  static UpdateCartEntities mapToEntities(UpdateCartResponse updateCartResponse){
return UpdateCartEntities(
    quantity: updateCartResponse.data!.cart.quantity, message:
updateCartResponse.message
);
  }
}



