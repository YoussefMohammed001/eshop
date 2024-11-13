import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/cart/data/models/get_cart_model_response.dart';

class CartApi{


  Future<CartData> getCart() async {  try {
    // Await the response from the API call
    final response = await ApiService.getData(endPoint: ApiConstants.carts);

    // Print the 'data' response. Ensure it's properly handled
    safePrint("api response===========> ${response['data']}");

    // Assuming response['data'] is a map, map it to CartData
    return CartData.fromJson(response['data']); // Map it to CartData (using a fromJson factory constructor)
  } catch (e) {
    // Print the error if something goes wrong
    safePrint("api error===========> $e");
    rethrow;
  }
  }
}
