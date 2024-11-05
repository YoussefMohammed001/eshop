import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_image.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductItem extends StatefulWidget {
  final bool isLoading; // Add a loading state parameter
  ProductEntities product;
  ProductItem({
    super.key,
    required this.isLoading,
    required this.product,
  });
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  // Default to false
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 213.h,
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.grey),
      ),
      child: widget.isLoading == true
          ? _buildShimmer()
          : InkWell(
              onTap: () {
                pushNamed(context, Routes.productDetailsScreen);
              },
              child:
                  _buildContent()), // Use shimmer or content based on loading state
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        verticalSpacing(5),
        GestureDetector(
          onTap: () {
            widget.product.isInFavorite = !widget.product.isInFavorite;
            setState(() {});
          },
          child: Container(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.darkGrey.withOpacity(0.5),
              child: Icon(
                widget.product.isInFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.white,
                size: 15.sp,
              ),
            ),
          ),
        ),
        AppImage(
            imageUrl: widget.product.image,
            width: 65.w,
            height: 65.h,
            fit: BoxFit.fill,
            borderRadius: MyShared.getThemeMode() == ThemeMode.dark ? BorderRadius.circular(100.r) : BorderRadius.circular(0.r)),
        verticalSpacing(10),
        Center(
          child: Text(
            widget.product.name,
            style: TextStyle(
              color: MyShared.getThemeMode() == ThemeMode.dark
                  ? AppColors.notPureWhite
                  : AppColors.notPureBlack,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
        widget.product.oldPrice != widget.product.price
            ? verticalSpacing(10)
            : verticalSpacing(20),
        Text(
          "${widget.product.price} EGP",
          style: TextStyle(
            color: AppColors.moreGold,
          ),
        ),
        verticalSpacing(10),
        Visibility(
          visible: widget.product.oldPrice != widget.product.price,
          child: Text(
            "${widget.product.oldPrice} EGP",
            style: TextStyle(
              color: AppColors.error,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ),
        verticalSpacing(10),
        Spacer(),
        InkWell(
          onTap: () {
            widget.product.isInCart = !widget.product.isInCart;
            setState(() {});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.product.isInCart ? S().removeFromCart : S().addToCart,
                style: TextStyle(
                  color: MyShared.getThemeMode() == ThemeMode.dark
                      ? widget.product.isInCart
                          ? AppColors.error
                          : AppColors.primary
                      : widget.product.isInCart
                          ? AppColors.error
                          : AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              horizontalSpacing(5),
              AppSVG(
                assetName: MyShared.getThemeMode() == ThemeMode.dark
                    ? "add_to_cart_pd"
                    : "add_to_cart_home",
                color: widget.product.isInCart
                    ? AppColors.error
                    : AppColors.primary,
              ),
            ],
          ),
        ),
        verticalSpacing(15),
      ],
    );
  }
}
