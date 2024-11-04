import 'package:eshop/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutLineButton extends StatelessWidget {
  AppOutLineButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = AppColors.primary,
    this.width = double.infinity,
    this.height,
    this.fontSize,
    this.backgroundColor,
  });

  final VoidCallback onPressed;
  final String label;
  final Color textColor;
  final double width;
  final double? height;
  final double? fontSize;
  final Color? backgroundColor;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56.h,

      margin: margin ?? EdgeInsets.symmetric(horizontal: 30.sp),
      width: width,
      child: OutlinedButton(
        style: ButtonStyle(
          side: WidgetStateProperty.all<BorderSide>(  BorderSide(color: AppColors.primary, width: 1.sp)),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(34.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(vertical: 15.sp),
          child: Text(
            label,
            maxLines: 1,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize ?? 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
