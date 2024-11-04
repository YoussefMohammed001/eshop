import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/network/endpoints.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/auth/register/data/model/register_req.dart';
import 'package:eshop/features/auth/register/data/model/register_response.dart';


class RegisterApi{




  Future<RegisterResponse> register({required RegisterRequestModel request}) async {

    final response = await ApiService.postData(endPoint: ApiConstants.register,
        data: request.toJson()
    );
    safePrint("response===> ${response.toString()}");
    final registerResponse = RegisterResponse.fromJson(response);
    safePrint("otpResponse: ${registerResponse.toString()}");
    return registerResponse;
  }


}