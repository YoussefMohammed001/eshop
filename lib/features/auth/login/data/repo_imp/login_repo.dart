import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/features/auth/login/data/model/login_request_model.dart';
import 'package:eshop/features/auth/login/data/model/login_response_model.dart';
import 'package:eshop/features/auth/login/data/remote_data_source/login_local.dart';
import 'package:eshop/features/auth/login/data/remote_data_source/login_remote.dart';

class LoginRepo{
  final LoginRemote loginRemote;
  LoginRepo(this.loginRemote);




  Future<LoginResponse> login({required LoginRequestModel loginRequestModel})async{

   final response =  await loginRemote.login(request: loginRequestModel);
   if(response.status == true){
     safePrint("repo response.token ==$response");
       LoginLocal().saveLoginData(user: response.data!);
     return response;
   }else{
     return response;
   }
  }


}