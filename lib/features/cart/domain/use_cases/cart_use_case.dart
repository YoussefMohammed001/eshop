import 'package:eshop/features/cart/domain/entities/cart_entities.dart';
import 'package:eshop/features/cart/domain/repositories/cart_base_repo.dart';

class CartUseCase{
  final CartBaseRepo  cartBaseRepo;
  CartUseCase({required this.cartBaseRepo});

  Future<CartEntities> execute(){
    return  cartBaseRepo.getCart();
  }
}