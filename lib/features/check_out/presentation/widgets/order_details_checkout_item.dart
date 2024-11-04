import 'package:eshop/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsCheckoutItem extends StatelessWidget {
  const OrderDetailsCheckoutItem({super.key, required this.title, required this.value,  this.dividerVisibility = true});
final String title,value;
final bool dividerVisibility;
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.sp),
          child: Row(
            children: [
              Expanded(child: Text(title,
                style: TextStyle(
                  color: AppColors.notPureWhite,
                  fontSize: 16.sp,
                ),
              )),
              Text(value,
                style: TextStyle(
                  color: AppColors.notPureWhite,
                  fontSize: 16.sp,
                ),
              )

            ],
          ),
        ),
        Visibility(
          visible: dividerVisibility,
          child: Divider(
            color: AppColors.notPureWhite,
            thickness: 3.sp,
          ),
        ),
      ],
    );
  }
}
