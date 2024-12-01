import 'package:eshop/features/cart/data/models/toggle_cart/toggle_cart_response.dart';
import 'package:eshop/features/cart/domain/entities/cart_entities.dart';
import 'package:eshop/features/cart/domain/entities/update_cart_entities.dart';
import 'package:eshop/features/cart/domain/repositories/cart_base_repo.dart';

class CartUseCase{
  final CartBaseRepo  cartBaseRepo;
  CartUseCase({required this.cartBaseRepo});

  Future<CartEntities> execute(){
    return  cartBaseRepo.getCart();
  }

  Future<UpdateCartEntities> updateExecute({required int id,required int quantity}) async {
    return cartBaseRepo.updateCart(id: id, quantity: quantity);
  } //Future<CartItemsEntities>

Future<ToggleCartResponse> toggleExecute({required int id}) async {
    return cartBaseRepo.toggleCart(id: id);
  }

}