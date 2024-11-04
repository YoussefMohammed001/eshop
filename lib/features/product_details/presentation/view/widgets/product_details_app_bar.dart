import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding:  EdgeInsets.symmetric(vertical:12.sp),
      child: Row(
        children: [
          GestureDetector(
              onTap: (){
                pop(context);
              },
              child: AppSVG(assetName: "back")),
          horizontalSpacing(10),
          Text("Onda Unisex Kids Speed Sand",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}
