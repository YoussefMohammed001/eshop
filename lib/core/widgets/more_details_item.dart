import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreDetailsItem extends StatelessWidget {
  const MoreDetailsItem({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.sp
      ),
      child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Divider(
              
              color: AppColors.gold,
              thickness: 2.sp,
            ),
          ),
          horizontalSpacing(10),
          Expanded(
              flex: 20,
              child: Text(title,
              style: TextStyle(
                fontSize: 10.sp
              ),
              ))

        ],
      ),
    );
  }
}
