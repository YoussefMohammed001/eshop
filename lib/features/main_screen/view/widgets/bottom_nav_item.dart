import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({super.key, required this.icon, required this.title, required this.onTap, required this.color, });
  final String icon,title;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSVG(assetName: icon,

          color: color,
          ),
          verticalSpacing(5),
          Text(title,
          style: TextStyle(
            fontSize: 12.sp,
            color: color,

            fontWeight: FontWeight.w700
          ),
          ),
        ],
      ),
    );

  }
}
