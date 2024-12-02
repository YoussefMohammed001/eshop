import 'package:eshop/features/cart/domain/entities/cart_entities.dart';

class CheckOutArgs {
  List<CartItemsEntities> cartItemsEntities = [];
  final int totalQuantity;
  final double totalPrice;
  CheckOutArgs( { required this.totalQuantity,required this.cartItemsEntities,required this.totalPrice});



}