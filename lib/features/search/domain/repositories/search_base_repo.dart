import 'package:eshop/core/entities/product_entity.dart';

abstract class SearchBaseRepo{
  Future<List<ProductEntities>> getSearch({required String searchText});


}