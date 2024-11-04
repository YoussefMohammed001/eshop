import 'package:eshop/core/cubits/language/language_cubit.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (MyShared.getCurrentLanguage() == "ar") {
          context.read<AppCubit>().changeLanguageToEn();
        } else {
          context.read<AppCubit>().changeLanguageToAr();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.sp),
        width: 338.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: MyShared.getThemeMode() == ThemeMode.dark
                  ? AppColors.grey.withOpacity(0.5)
                  : Colors.transparent),
          color: MyShared.getThemeMode() == ThemeMode.dark
              ? Colors.transparent
              : AppColors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Row(
          children: [
            AppSVG(
              assetName: "language",
              color: MyShared.getThemeMode() == ThemeMode.dark
                  ? AppColors.notPureWhite
                  : AppColors.primary,
            ),
            horizontalSpacing(20),
            Expanded(child: Text(S().language)),
            Text(
              MyShared.getCurrentLanguage() == "ar" ? "عربي" : "English",
              style: TextStyle(
                  color: MyShared.getThemeMode() == ThemeMode.dark
                      ? AppColors.notPureWhite
                      : AppColors.primary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
