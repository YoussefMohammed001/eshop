import 'package:eshop/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartDetailsItem extends StatelessWidget {
  const CartDetailsItem({super.key, required this.title, required this.body});
final String title,body;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
            TextStyle(color: AppColors.primary, fontSize: 20.sp),
          ),      Text(
            body,
            style:
            TextStyle(color: AppColors.primary, fontSize: 20.sp),
          ),
        ],
      ),
    );
  }
}
