import 'package:eshop/features/cart/data/models/toggle_cart/toggle_cart_response.dart';
import 'package:eshop/features/cart/domain/entities/cart_entities.dart';
import 'package:eshop/features/cart/domain/entities/update_cart_entities.dart';

abstract class CartBaseRepo{
  Future<CartEntities> getCart();
  Future<UpdateCartEntities> updateCart({required int id,required int quantity});
Future<ToggleCartResponse> toggleCart({required int id});
}