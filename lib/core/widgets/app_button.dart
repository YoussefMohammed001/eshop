import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height,
    this.fontSize,
    this.backgroundColor,
  });

  final VoidCallback onPressed;
  final String label;
  final Color textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? backgroundColor;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 338.w,
      height: height ?? 56.h,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 30.sp),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16.r),
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
              fontWeight: FontWeight.w600,
              fontSize: fontSize ?? 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
