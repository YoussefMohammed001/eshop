import 'package:eshop/core/models/products_model.dart';
import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/home/data/models/home_response.dart';
import 'package:eshop/features/products/data/models/categories_model.dart';

class CategoriesProductsApi {
  Future<CategoriesResponse> getCategories() async {
    final response =
        await ApiService.getData(endPoint: ApiConstants.categories);
    final categoriesModel = CategoriesResponse.fromJson(response);
    return categoriesModel;
  }

  Future<List<ProductsModel>> getCategoryProductApi(
      {required int categoryId}) async {
    try {
      final response = await ApiService.getData(
        endPoint: "${ApiConstants.categories}/$categoryId",
      );
      safePrint(response);
      return response['data']['data']
          .map<ProductsModel>((json) => ProductsModel.fromJson(json))
          .toList();
    } catch (e) {
      safePrint("api error===========> $e");
      rethrow;
    }
  }
}
