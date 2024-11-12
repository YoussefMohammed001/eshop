import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/shared_preferences/my_shared_keys.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_text_field.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding:  EdgeInsets.only(top:20.sp,bottom: 40.sp,left: 10.sp,right: 10.sp),
          margin: EdgeInsets.only(bottom: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.sp),
              bottomRight: Radius.circular(10.sp),
            ),
            color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.primary : AppColors.primary
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S().goodMorning, style: TextStyle(                       color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.notPureWhite
                        )),
                        verticalSpacing(5),
                        Text(MyShared.getString(key: MySharedKeys.userName), style: TextStyle(
                           color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.notPureWhite
                        )),
                      ],
                    ),
                  ),
                  InkWell(
                      onTap: (){
                        pushNamed(context, Routes.cartScreen);
                      },
                      child: AppSVG(assetName: "home_cart",
                          color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.notPureWhite
                      ))
                ],
              ),
              verticalSpacing(10),
              Row(
                children: [
                AppSVG(assetName: "home_location",
                    color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.notPureWhite
                ),
                horizontalSpacing(10),
                Text("Cairo, Egypt", style: TextStyle(
                    color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.notPureWhite
                )),
                Spacer(),
              ])
            ],
          ),
        ),
        InkWell(
            onTap: (){
              pushNamed(context, Routes.searchScreen);
            },
            child: AppTextField(
                enabled: false,
                title: "", hintText:S().search))
      ],
    );
  }
}
