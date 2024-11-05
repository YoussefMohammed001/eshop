import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/features/products/domain/entities/categories_entity.dart';
import 'package:eshop/features/products/domain/repositories/category_products_base_repo.dart';

class CategoriesProductsUseCase {
final CategoryProductsBaseRepo categoriesProductsRepository;
  CategoriesProductsUseCase({required this.categoriesProductsRepository});


  Future<List<CategoryEntity>> getCategories() async {
    return await categoriesProductsRepository.getCategories();
  }

  Future<List<ProductEntities>> getCategoryProductApi(int id) async {
    return await categoriesProductsRepository.getCategoryProducts(id);
  }


}