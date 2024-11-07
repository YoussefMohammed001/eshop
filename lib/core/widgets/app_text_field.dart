import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.keyboardType,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.black,
    this.controller,
    this.autofocus = false,
    this.textInputAction,
    this.backgroundColor,
    this.onFieldSubmitted,
    this.prefixIcon,
    this.labelFontWeight,
    this.maxLength,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    required this.title,
    this.enabled,
    this.withTitle = false,
    this.titleIcon = "",
    this.minLines = 1,
    this.maxLines = 1,
    this.textAlign,
    required this.hintText,
  });

  final Color textColor;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;
  final String title;
  final String hintText;
  final FontWeight? labelFontWeight;
  final int? maxLength;
  final String? titleIcon;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator? validator;
  final bool? enabled;
  final bool autofocus;
  final bool? withTitle;
  final ValueChanged<String>? onChanged;
  final int minLines;
  final int maxLines;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          margin ?? EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      width: 338.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          withTitle!
              ? Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MyShared.getThemeMode() == ThemeMode.dark
                            ? AppColors.notPureWhite
                            : AppColors.notPureBlack,
                      ),
                    ),
                    verticalSpacing(10),
                  ],
                )
              : SizedBox(),
          TextFormField(
            enabled: enabled,
            cursorColor: MyShared.getThemeMode() == ThemeMode.dark
                ? AppColors.notPureWhite
                : AppColors.notPureBlack,
            textAlign: textAlign ?? TextAlign.start,
            minLines: minLines,
            maxLines: maxLines,
            validator: validator,
            onChanged: onChanged,
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            autofocus: autofocus,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              labelStyle: TextStyle(),
              hintStyle: TextStyle(
                color: MyShared.getThemeMode() == ThemeMode.dark
                    ? AppColors.notPureWhite
                    : AppColors.notPureBlack,
              ),
              errorStyle: const TextStyle(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.h, horizontal: 19.sp),
              hintText: hintText,
              fillColor: MyShared.getThemeMode() == ThemeMode.dark
                  ? AppColors.primaryDarkTheme.withOpacity(0.5)
              
                  : Colors.white,
              filled: true,
              errorMaxLines: 2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: const BorderSide(color: AppColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: BorderSide(
                    color: MyShared.getThemeMode() == ThemeMode.dark
                        ? AppColors.primary
                        : AppColors.primaryDarkTheme),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: const BorderSide(color: AppColors.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: const BorderSide(color: AppColors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
