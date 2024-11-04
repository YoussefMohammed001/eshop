import 'package:eshop/features/auth/register/data/data_source/register_api.dart';
import 'package:eshop/features/auth/register/data/model/register_req.dart';
import 'package:eshop/features/auth/register/data/model/register_response.dart';

class RegisterRepo{
final RegisterApi registerApi;
  RegisterRepo({required this.registerApi});

  Future<RegisterResponse> register({required RegisterRequestModel request}) async {
    return await registerApi.register(request: request);

  }
}