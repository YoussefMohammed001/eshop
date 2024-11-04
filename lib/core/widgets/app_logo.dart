import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/widgets/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return                 Container(
      decoration: BoxDecoration(
          color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite.withOpacity(0.5) :Colors.transparent,
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: AppAssetImage(
        image: "logo",
        height: 165.h,
        width: 163.w,
        topLeftRadius: 0,
        topRightRadius: 0,
        bottomLeftRadius: 0,
        bottomRightRadius: 0,
        fit: BoxFit.contain,
      ),
    );
  }
}
