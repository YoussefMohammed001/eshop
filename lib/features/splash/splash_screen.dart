import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/widgets/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    Future.delayed(Duration(seconds: 3), () {
      if(MyShared.isFirstOpen()){
        pushNamedAndRemoveUntil(context, Routes.dashboard);
      }else if(MyShared.isLoggedIn()){
        pushNamedAndRemoveUntil(context, Routes.mainScreen);
        /// TODO: navigate to MAIN SCREEN
      }else {
        pushNamedAndRemoveUntil(context, Routes.loginScreen);
      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppAssetImage(image: "logo",
              width: 388.w,
              height: 250.h,
              topLeftRadius: 0, topRightRadius: 0, bottomLeftRadius: 0, bottomRightRadius: 0, fit: BoxFit.fill),
        ],
      )
    );
  }
}
