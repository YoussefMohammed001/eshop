import 'package:eshop/core/entities/product_entity.dart';

class CartEntities {
  double subTotal = 0;
  List<CartItemsEntities> cartItemsEntities = [];
  CartEntities({required this.subTotal, required this.cartItemsEntities});
}

class CartItemsEntities {
  int productCartId = 0;
  int _quantity = 0;
  ProductEntities productEntities;
  CartItemsEntities({required this.productCartId, required this.productEntities,
  required int quantity}){
    _quantity = quantity;
  }

  int get quantity => _quantity;
  set quantity(int value) {
    _quantity = value;
  }
}