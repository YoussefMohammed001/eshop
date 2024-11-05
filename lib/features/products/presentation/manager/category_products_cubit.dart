import 'package:bloc/bloc.dart';
import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/products/domain/entities/categories_entity.dart';
import 'package:eshop/features/products/domain/use_cases/products_categories_usecase.dart';
import 'package:meta/meta.dart';
part 'category_products_state.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  CategoryProductsCubit(this.categoriesRepository) : super(CategoryProductsInitial());

  final CategoriesProductsUseCase categoriesRepository;
  List<CategoryEntity> categoriesList = [];
  List<ProductEntities> productList = [];
   bool isFirstTime = true;

  Future<void> getCategories() async {
    emit(ProductLoading());
    categoriesRepository.getCategories().then((onValue) {
      categoriesList = onValue;
      getCategoryProductApi(categoriesList[0].id).then((_) {
        categoriesList[0].isSelected = true;

      });
    });
  }

  Future<void> getCategoryProductApi(int id) async {
    emit(ProductLoading()); // Emit loading state before clearing list
    productList.clear();
    categoriesRepository.getCategoryProductApi(id).then((onValue) {
      productList = onValue;
      if(productList.isNotEmpty){
        isFirstTime = false;
        safePrint(" product list length ${productList.length}");
      }
      emit(ProductSuccess());

    });
  }
}