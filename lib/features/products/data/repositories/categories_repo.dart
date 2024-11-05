import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/features/home/data/models/home_response.dart';
import 'package:eshop/features/products/data/data_sources/categories_api.dart';
import 'package:eshop/features/products/data/models/categories_model.dart';
import 'package:eshop/features/products/domain/entities/categories_entity.dart';
import 'package:eshop/features/products/domain/repositories/category_products_base_repo.dart';

class CategoriesProductsRepositoryImp extends CategoryProductsBaseRepo {

  final CategoriesProductsApi categoriesApi;

  CategoriesProductsRepositoryImp({required this.categoriesApi});


   @override
  Future<List<CategoryEntity>> getCategories() async {
    final response = await categoriesApi.getCategories();
    List<CategoryEntity> categoryEntity = Mapper.mapToEntity(response.data!.data);
    return categoryEntity;
  }

  @override
  Future<List<ProductEntities>> getCategoryProducts(int id) async {
    final response = await categoriesApi.getCategoryProductApi(categoryId: id);
    List<ProductEntities> productEntities = Mapper.mapToProductEntity(response);
    return productEntities;
  }



}
class Mapper {

  static List<CategoryEntity> mapToEntity(List<CategoryItem> data) {
    return data.map((e) => CategoryEntity(id: e.id, name: e.name, image: e.image)).toList();
  }

  static List<ProductEntities> mapToProductEntity(List<HomeProducts> product) {
    return product.map((e)=> ProductEntities(id: e.id, image: e.image, name: e.name, price: e.price, isFav: e.inFavorites, oldPrice: e.oldPrice, isInCart: e.inCart, discount: e.discount.toDouble())).toList();
  }

}