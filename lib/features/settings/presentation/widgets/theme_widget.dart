import 'package:eshop/core/cubits/language/language_cubit.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({super.key});

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(vertical: 8.sp),
      width: 338.w,
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: MyShared.getThemeMode() == ThemeMode.dark
                ? AppColors.grey.withOpacity(0.5)
                : Colors.transparent),
        color: MyShared.getThemeMode()  == ThemeMode.dark
            ? Colors.transparent
            : AppColors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.sp),
      child: Row(
        children: [
          AppSVG(assetName: "light_mode",
            color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.primary,
          ),  // Your SVG for light mode
          horizontalSpacing(20),  // A custom widget you have for spacing
          Expanded(
            child: Text(S().lightMode),  // The text showing "Light Mode" or "Dark Mode"
          ),
          Transform.scale(
            scale: 0.5.sp,
            child: CupertinoSwitch(
              value: MyShared.getThemeMode() == ThemeMode.light,  // Use the cubit state if available, fallback to shared preferences
              onChanged: (bool value) {
                // Toggle the theme when the switch is changed
              MyShared.getThemeMode() == ThemeMode.dark ? context.read<AppCubit>().changeThemeToLight() : context.read<AppCubit>().changeThemeToDark();
                setState(() {

                });
              },
            ),
          )
        ],
      ),
    );
  }
}
