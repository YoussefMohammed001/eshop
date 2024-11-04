import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductItem extends StatelessWidget {
  final bool isLoading; // Add a loading state parameter
  const ProductItem({super.key, this.isLoading = true}); // Default to false




  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 213.h,
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.grey

        ),
      ),
      child: isLoading ? _buildShimmer() : InkWell(
          onTap: (){
            pushNamed(context, Routes.productDetailsScreen);
          },
          child: _buildContent()), // Use shimmer or content based on loading state
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpacing(5),
          // Shimmer for favorite icon
          Container(
            alignment: Alignment.topRight,
            child: Container(
              width: 30.sp,
              height: 30.sp,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          verticalSpacing(5),
          // Shimmer for product image
          Container(
            width: 54.sp,
            height: 54.sp,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          verticalSpacing(5),
          // Shimmer for product name
          Container(
            width: 80.sp,
            height: 10.sp,
            color: Colors.white,
          ),
          verticalSpacing(5),
          // Shimmer for store name
          Container(
            width: 50.sp,
            height: 10.sp,
            color: Colors.white,
          ),
          verticalSpacing(5),
          // Shimmer for price
          Container(
            width: 70.sp,
            height: 10.sp,
            color: Colors.white,
          ),
          Spacer(),
          // Shimmer for add to cart text
          Container(
            width: 60.sp,
            height: 10.sp,
            color: Colors.white,
          ),
          verticalSpacing(10),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        verticalSpacing(5),
        Container(
          alignment: Alignment.topRight,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: AppColors.darkGrey.withOpacity(0.5),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 15.sp,
            ),
          ),
        ),
        CircleAvatar(
          radius: 27.r,
          backgroundImage: NetworkImage(
            "https://plus.unsplash.com/premium_photo-1661368209998-6965fb87c600?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGlwaG9uZSUyMHdpdGglMjBiYWNrZ3JvdW5kJTIwd2hpdGV8ZW58MHx8MHx8fDA%3D",
          ),
        ),
        verticalSpacing(5),
        Text(
          "Iphone 16",
          style: TextStyle(
            color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite: AppColors.notPureBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        verticalSpacing(5),
        Text(
          "IStore",
          style: TextStyle(
            color:MyShared.getThemeMode() == ThemeMode.dark ? AppColors.grey: AppColors.darkGrey,
          ),
        ),
        verticalSpacing(5),
        Text(
          "SAR 920.00",
          style: TextStyle(
            color: AppColors.moreGold,
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S().addToCart,
              style: TextStyle(
                color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            horizontalSpacing(5),
            AppSVG(assetName:  MyShared.getThemeMode() == ThemeMode.dark ? "add_to_cart_pd":"add_to_cart_home",
              color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.primary,
            ),
          ],
        ),
        verticalSpacing(10),
      ],
    );
  }




}