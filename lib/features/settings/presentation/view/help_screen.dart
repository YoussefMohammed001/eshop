import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/core/widgets/app_logo.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyword_highlighter/flutter_keyword_highlighter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: S().help,
          ),
          verticalSpacing(50),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.sp),
            width: double.infinity,
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                    color: MyShared.getThemeMode() == ThemeMode.dark
                        ? AppColors.notPureWhite
                        : AppColors.primary)),
            child: Column(
              children: [
                AppLogo(),
                verticalSpacing(10),
                HighlightedText(
                    defaultTextStyle: TextStyle(
                        fontSize: 16.sp,
                        color: MyShared.getThemeMode() == ThemeMode.dark
                            ? AppColors.notPureWhite
                            : AppColors.primary
                    ),
                    content: "${S().contactUs} +01008451421",
                    highlightedTextStyles: [
                      HighlightedTextStyle(
                          highlightedText: S().contactUs,
                          customStyle: TextStyle(
                            fontWeight: FontWeight.w700,           fontSize: 16.sp,
                              color: MyShared.getThemeMode() == ThemeMode.dark
                                  ? AppColors.notPureWhite
                                  : AppColors.primary
                          ))
                    ]),
                verticalSpacing(20),
                HighlightedText(
                    defaultTextStyle: TextStyle(
                        fontSize: 16.sp,
                        color: MyShared.getThemeMode() == ThemeMode.dark
                            ? AppColors.notPureWhite
                            : AppColors.primary
                    ),
                    content: "${S().location} Cairo,Egypt",
                    highlightedTextStyles: [
                      HighlightedTextStyle(
                          highlightedText: S().location,
                          customStyle: TextStyle(fontWeight: FontWeight.w700,           fontSize: 16.sp,))
                    ]),
                verticalSpacing(20),
                HighlightedText(
                    defaultTextStyle: TextStyle(
                        fontSize: 16.sp,
                        color: MyShared.getThemeMode() == ThemeMode.dark
                            ? AppColors.notPureWhite
                            : AppColors.primary),
                    content: "${S().email}  yoseffmohamed001@gmail.com",
                    highlightedTextStyles: [
                      HighlightedTextStyle(

                          highlightedText: S().email,
                          customStyle: TextStyle(fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ))
                    ]),
                verticalSpacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSVG(
                        assetName: "face",
                        height: 30.h,
                        width: 30.w,
                        color: MyShared.getThemeMode() == ThemeMode.dark
                            ? AppColors.notPureWhite
                            : AppColors.primary),
                    horizontalSpacing(15),
                    AppSVG(
                        assetName: "whats",
                        height: 30.h,
                        width: 30.w,
                        color: MyShared.getThemeMode() == ThemeMode.dark
                            ? AppColors.notPureWhite
                            : AppColors.primary),
                    horizontalSpacing(15),
                    AppSVG(
                        assetName: "snap",
                        height: 30.h,
                        width: 30.w,
                        color: MyShared.getThemeMode() == ThemeMode.dark
                            ? AppColors.notPureWhite
                            : AppColors.primary),
                    horizontalSpacing(15),
                    AppSVG(
                        assetName: "insta",
                        height: 30.h,
                        width: 30.w,
                        color: MyShared.getThemeMode() == ThemeMode.dark
                            ? AppColors.notPureWhite
                            : AppColors.primary),
                  ],
                ),
                verticalSpacing(10),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
