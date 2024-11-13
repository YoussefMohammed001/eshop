import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/cart/data/data_sources/cart_api.dart';
import 'package:eshop/features/cart/data/mapper.dart';
import 'package:eshop/features/cart/domain/entities/cart_entities.dart';
import 'package:eshop/features/cart/domain/repositories/cart_base_repo.dart';

class CartRepoImp extends CartBaseRepo{
  final CartApi cartApi;

  CartRepoImp({required this.cartApi});

  @override
  Future<CartEntities> getCart() async {
    try{
      final response =await cartApi.getCart();
      CartEntities cartEntities = CartMapper.mapTOEntities(response);
      safePrint("cart total"+cartEntities.subTotal.toString());
      return cartEntities;
    }catch(e){
      safePrint("error repo$e");
      rethrow;
    }

  }

}