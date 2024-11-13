import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/divider.dart';
import 'package:eshop/features/product_details/presentation/view/widgets/add_to_cart_item.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDeailsContent extends StatelessWidget {
  const ProductDeailsContent({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.isInCart,
    required this.isInFav,
    required this.onCartTap,
    required this.onFavTap,
  });
  final String name, description;
  final double price, oldPrice, discount;
  final bool isInCart;
  final bool isInFav;
  final VoidCallback onFavTap;
  final VoidCallback onCartTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            CircleAvatar(
              radius: 15.r,
              child: IconButton(
                  onPressed: onFavTap,
                  icon: Icon(isInFav ? Icons.favorite : Icons.favorite_border,
                  size: 15.sp,
                  )),
            )
          ],
        ),
        verticalSpacing(10),
        Row(
          children: [
            AppSVG(assetName: "coins"),
            horizontalSpacing(5),
            Text(
              price.toString(),
              style: TextStyle(
                  color: AppColors.moreGold, fontWeight: FontWeight.w600),
            ),
            horizontalSpacing(5),
            Text(
              oldPrice.toString(),
              style: TextStyle(
                color: AppColors.error,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            horizontalSpacing(5),
            Text(
              "50 %",
              style: TextStyle(
                color: AppColors.error,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        verticalSpacing(10),
        ReadMoreText(
          S().description,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        verticalSpacing(5),
        ReadMoreText(
          "$description ",
          style: TextStyle(
              fontSize: 14.sp, fontWeight: FontWeight.w500, height: 1.5.sp),
        ),
        verticalSpacing(15),
        AddToCartItem(
          isInCart: isInCart,
          onTap: onCartTap,
        ),
        verticalSpacing(15),
        DividerWidget()
      ],
    );
  }
}
