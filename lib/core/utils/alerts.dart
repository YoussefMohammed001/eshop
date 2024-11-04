import 'package:eshop/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Alerts {
  static void showErrorDialog({
    required BuildContext context,
    required String errorMessage,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: AppColors.primary,
                size: 44.sp,
              ),
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
               //AppButton(text: S().ok, onPressed: () => pop(context),)
            ],
          ),
        ),
      ),
    );
  }
}
