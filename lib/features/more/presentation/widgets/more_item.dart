import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreItem extends StatelessWidget {
  const MoreItem({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    required this.themeMode, // Accept the themeMode as a parameter
  });

  final String image, text;
  final VoidCallback onTap;
  final ThemeMode themeMode; // Add this parameter

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.sp),
        width: 338.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(
              color: themeMode == ThemeMode.dark
                  ? AppColors.grey.withOpacity(0.5)
                  : Colors.transparent),
          color: themeMode == ThemeMode.dark
              ? Colors.transparent
              : AppColors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Row(
          children: [
            AppSVG(
              assetName: image,
              color: themeMode == ThemeMode.dark
                  ? AppColors.notPureWhite
                  : AppColors.notPureBlack,
            ),
            horizontalSpacing(10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios,
            size: 18.sp,
            )
          ],
        ),
      ),
    );
  }
}
