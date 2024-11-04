import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_asset.dart';
import 'package:eshop/core/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreLocation extends StatelessWidget {
  const StoreLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.sp,
          ),
          child: Text(
            "Location",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        verticalSpacing(10),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.sp,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSVG(
                assetName: "location_pd",
                color: MyShared.getThemeMode() == ThemeMode.dark
                    ? AppColors.notPureWhite
                    : AppColors.primary,
              ),
              Text(
                " Haa Alkhalidia,Jeddah",
                style: TextStyle(),
              ),
            ],
          ),
        ),
        verticalSpacing(10),
        Center(
          child: AppAssetImage(
              image: "map",
              width: 338.w,
              height: 127.h,
              topLeftRadius: 10.r,
              topRightRadius: 10.r,
              bottomLeftRadius: 10.r,
              bottomRightRadius: 10.r,
              fit: BoxFit.fitWidth),
        ),
        verticalSpacing(20),
        DividerWidget()
      ],
    );
  }
}
