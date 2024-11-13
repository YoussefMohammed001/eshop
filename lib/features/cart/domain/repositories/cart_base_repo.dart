import 'package:eshop/features/cart/domain/entities/cart_entities.dart';

abstract class CartBaseRepo{
  Future<CartEntities> getCart();


}