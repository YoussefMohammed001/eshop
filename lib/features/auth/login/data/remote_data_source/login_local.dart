import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/shared_preferences/my_shared_keys.dart';
import 'package:eshop/features/auth/login/data/model/login_response_model.dart';




class LoginLocal {
  Future saveLoginData({required UserData user}) async {
    MyShared.putString(key: MySharedKeys.apiToken, value: user.token);
    MyShared.putString(key: MySharedKeys.userPhone, value: user.phone);
    MyShared.putString(key: MySharedKeys.email, value: user.email);
    MyShared.putString(key: MySharedKeys.userId, value: user.id.toString());
    MyShared.putString(key: MySharedKeys.userName, value: user.name);

  }

}