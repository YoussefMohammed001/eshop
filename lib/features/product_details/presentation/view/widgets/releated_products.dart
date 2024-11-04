import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReleatedProducts extends StatelessWidget {
  const ReleatedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  verticalSpacing(10),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10.sp
          ),
          child: Text(S().relatedProducts,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite:AppColors.primary,

            ),),
        ),
        verticalSpacing(10),
        SizedBox(
          height: 230.h,
          child: ListView.builder(
            physics: BouncingScrollPhysics(), // This will remove the shadow and give a bounce effect
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(isLoading: false,);
            },),
        ),
        verticalSpacing(10),
      ],
    );
  }
}
