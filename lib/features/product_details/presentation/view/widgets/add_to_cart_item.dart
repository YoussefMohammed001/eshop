import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartItem extends StatelessWidget {
  const AddToCartItem({super.key, required this.isInCart, required this.onTap});
final bool isInCart;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap: onTap,
      child: Container(
        height: 55.h,
        margin: EdgeInsets.symmetric(horizontal: 30.sp),
        padding: EdgeInsets.all(15.sp),
        decoration: BoxDecoration(
            color: isInCart ?  AppColors.primary:AppColors.error,
            borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isInCart ?  S().addToCart : S().removeFromCart,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color:AppColors.notPureWhite

              ),
            ),
            horizontalSpacing(10),
            AppSVG(assetName: "add_to_cart_pd",

            )
          ],
        ),
      ),
    );
  }
}
