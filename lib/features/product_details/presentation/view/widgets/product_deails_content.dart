import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/divider.dart';
import 'package:eshop/features/product_details/presentation/view/widgets/add_to_cart_item.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDeailsContent extends StatelessWidget {
  const ProductDeailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text("Onda Unisex Kids Speed Sand",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

          ],
        ),
        verticalSpacing(10),
        Row(
          children: [
            AppSVG(assetName: "coins"),
            horizontalSpacing(5),
            Text("SAR 75.00",
              style: TextStyle(
                  color: AppColors.moreGold,
                  fontWeight: FontWeight.w600
              ),
            ),
            horizontalSpacing(5),
            Text("SAR 7500.00",
              style: TextStyle(
                color: AppColors.error,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.lineThrough,
              ),
            ),
            horizontalSpacing(5),
            Text("50 %",
              style: TextStyle(
                color: AppColors.error,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

          ],
        ),
        verticalSpacing(10),
        Text(S().description,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),

        ),
        verticalSpacing(5),
        Text("Product details\nPackage Dimensions ‏ : ‎ 17.7 x 15.8 x 8.9 cm; 80 gDate First Available ‏ : ‎ 26 May 2024Manufacturer ‏ : ‎ ONDAASIN ‏ : ‎ B0D58QWBSKItem model number ‏ : ‎ FP-BA-SPE-FE-BEG-BEG-20Department ‏ : ‎ unisex-childBest Sellers Rank: #316 in Fashion (See Top 100 in Fashion)#1 in Girls' Fashion Sandals",
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            height: 1.5.sp
          ),

        ),
        verticalSpacing(15),
        AddToCartItem(),
        verticalSpacing(15),
        DividerWidget()
      ],
    );
  }
}
