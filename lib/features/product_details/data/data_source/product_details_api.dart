import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/product_details/data/models/product_details_model.dart';

class ProdcutDetailsApi {

   Future<ProductDetailsData> getProductDetails({required int id}) async {
    var response = await ApiService.getData(endPoint: ApiConstants.products+id.toString());
    safePrint("api response $response");
    safePrint("api data response ${response['data']}");
     ProductDetailsData product = ProductDetailsData.fromJson(response['data']);
     safePrint("product $product");
    return product;
  }
}