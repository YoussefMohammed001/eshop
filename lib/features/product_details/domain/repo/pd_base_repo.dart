import 'package:eshop/core/entities/product_entity.dart';

abstract class PDBaseRepo{

  Future<ProductEntities> getProductDetails({required int id});

}