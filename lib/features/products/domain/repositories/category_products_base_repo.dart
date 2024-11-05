import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/features/products/domain/entities/categories_entity.dart';

abstract class CategoryProductsBaseRepo {

  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntities>> getCategoryProducts(int id);
}