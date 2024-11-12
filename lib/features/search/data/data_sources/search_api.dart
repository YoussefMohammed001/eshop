import 'dart:convert';

import 'package:eshop/core/models/products_model.dart';
import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/utils/safe_print.dart';

class SearchApi {
  Future<List<ProductsModel>> getSearchApi({required String query}) async {
    try {
      final response =
      await ApiService.postData(endPoint: ApiConstants.search, data: {
        "text": query,
      });
      safePrint("response");
      return response['data']['data']
          .map<ProductsModel>((json) => ProductsModel.fromJson(json))
          .toList();
    }
    catch(e){
      safePrint("api error ======> $e");
      rethrow;
    }
  }
}
