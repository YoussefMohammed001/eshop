import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/auth/login/data/model/login_request_model.dart';
import 'package:eshop/features/auth/login/data/model/login_response_model.dart';

class LoginRemote{
  Future<LoginResponse> login({required LoginRequestModel request}) async {
    final response = await ApiService.postData(endPoint: ApiConstants.login,
        data: request.toJson()
    );
    safePrint("response===> ${response.toString()}");
    final loginResponse = LoginResponse.fromJson(response);


    safePrint("otpResponse: ${loginResponse.toString()}");
    return loginResponse;
  }





}