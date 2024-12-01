import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/home/data/models/home_response.dart';

class HomeApi {

  Future<HomeResponse> getHomeDataApi() async {
    try {
      final response = await ApiService.getData(
        endPoint: ApiConstants.home,
      );
      safePrint("api response $response");
      HomeResponse homeResponse = HomeResponse.fromJson(response);
      safePrint("home model $homeResponse");
      return homeResponse;
    } catch (e) {
      safePrint("api error===========> $e");
      rethrow;
    }
  }
}