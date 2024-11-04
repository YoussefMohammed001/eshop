import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/shared_preferences/my_shared_keys.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(12.sp),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S().goodMorning, style: TextStyle()),
                    verticalSpacing(5),
                    Text(MyShared.getString(key: MySharedKeys.userName), style: TextStyle()),
                  ],
                ),
              ),
              InkWell(
                  onTap: (){
                    /// TODO: push to cart
                    pushNamed(context, Routes.cartScreen);
                  },
                  child: AppSVG(assetName: "home_cart",
                  color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.primary,
                  ))
            ],
          ),
          verticalSpacing(10),
          Row(
            children: [
            AppSVG(assetName: "home_location",
              color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.primary,
            ),
            horizontalSpacing(10),
            Text("Cairo, Egypt", style: TextStyle(
              color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.darkGrey
            )),
            Spacer(),
          ])
        ],
      ),
    );
  }
}
