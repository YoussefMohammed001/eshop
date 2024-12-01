import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/cart/data/models/get_cart/get_cart_model_response.dart';
import 'package:eshop/features/cart/data/models/toggle_cart/toggle_cart_response.dart';
import 'package:eshop/features/cart/data/models/update_cart/update_cart_response.dart';


class CartApi {
  Future<CartData> getCart() async {
    try {
      // Await the response from the API call
      final response = await ApiService.getData(endPoint: ApiConstants.carts);

      // Print the 'data' response. Ensure it's properly handled
      safePrint("api response===========> ${response['data']}");

      // Assuming response['data'] is a map, map it to CartData
      return CartData.fromJson(response[
          'data']); // Map it to CartData (using a fromJson factory constructor)
    } catch (e) {
      // Print the error if something goes wrong
      safePrint("api error===========> $e");
      rethrow;
    }
  }


  Future<UpdateCartResponse> updateCart({required int id,required int quantity}) async {
    try {
      final response = await ApiService.putData(endPoint: "${ApiConstants.carts}/$id", data: {

        "quantity": quantity,
      });
      return UpdateCartResponse.fromJson(response);
    } catch (e) {
      safePrint("api error===========> $e");

      rethrow;
    }
  }


Future<ToggleCartResponse> toggleCart({required int id}) async {
    try {

      final response = await ApiService.postData(endPoint: ApiConstants.carts,
      data: {
        "product_id":id
      }
      );
      return ToggleCartResponse.fromJson(response);
    } catch (e) {
      safePrint("api error===========> $e");
      rethrow;
    }
  }
}
