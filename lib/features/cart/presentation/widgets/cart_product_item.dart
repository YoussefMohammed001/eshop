import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, this.updateVisible = true, this.isLoading = false, required this.productEntities});
  final bool updateVisible;
  final bool isLoading;
  final ProductEntities productEntities;

  @override
  Widget build(BuildContext context) {
    return isLoading ? _buildShimmerPlaceholder() : _buildCartItem(context);
  }


  // Shimmer placeholder
  Widget _buildShimmerPlaceholder() {
    return Container(
      width: 338.w,
      height: 100.h,
      margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade50,
            child: Container(
              width: 91.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          horizontalSpacing(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade50,
                  child: Container(
                    height: 20.h,
                    width: 120.w,
                    color: Colors.grey[300],
                  ),
                ),
                verticalSpacing(2),
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade50,
                      child: Container(
                        height: 15.h,
                        width: 50.w,
                        color: Colors.grey[300],
                      ),
                    ),
                    horizontalSpacing(5),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade50,
                      child: Container(
                        height: 15.h,
                        width: 50.w,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                verticalSpacing(2),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade50,
                  child: Container(
                    height: 15.h,
                    width: 100.w,
                    color: Colors.grey[300],
                  ),
                ),
                verticalSpacing(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade50,
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 15.h,
                        width: 20.w,
                        color: Colors.grey[300],
                      ),
                    ),
                    horizontalSpacing(5),
                    Shimmer.fromColors(


                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade50,
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 15.h,
                        width: 10.w,
                        color: Colors.grey[300],
                      ),
                    ),
                    horizontalSpacing(5),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade50,
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 15.h,
                        width: 20.w,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Main cart item UI
  Widget _buildCartItem(BuildContext context) {
    return Container(
      width: 338.w,
      height: 100.h,
      margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
      decoration: BoxDecoration(
        color: MyShared.getThemeMode() == ThemeMode.dark ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.grey.withOpacity(0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(
            imageUrl: productEntities.image,
            width: 91.w,
            height: 100.h,
            borderRadius: BorderRadius.circular(10.r),
          ),
          horizontalSpacing(10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          productEntities.name,
                          maxLines: 2,
                          style: TextStyle(
                            color: MyShared.getThemeMode() == ThemeMode.dark
                                ? AppColors.notPureWhite
                                : AppColors.notPureBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: updateVisible,
                        child: Icon(
                          Icons.delete_outline_rounded,
                          color: AppColors.error,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(2),
                  Row(
                    children: [
                      Text(productEntities.price.toString(),
                          style: TextStyle(
                              color: AppColors.moreGold,
                              fontWeight: FontWeight.w600)),
                      horizontalSpacing(5),
                      Text(
                        productEntities.oldPrice.toString(),
                        style: TextStyle(
                          color: AppColors.error,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      horizontalSpacing(5),
                      Text(
                        productEntities.discount.toString(),
                        style: TextStyle(
                          color: AppColors.error,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(2),
                  RatingBarIndicator(
                    direction: Axis.horizontal,
                    itemCount: 5,
                    rating: 3.5,
                    itemPadding: EdgeInsets.all(0.sp),
                    itemSize: 15.sp,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: AppSVG(assetName: "star"),
                      );
                    },
                  ),
                  Visibility(
                    visible: updateVisible,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppSVG(
                          assetName: "plus",
                          color: MyShared.getThemeMode() == ThemeMode.dark
                              ? AppColors.notPureWhite
                              : AppColors.primary,
                        ),
                        horizontalSpacing(10),
                        Text(
                          "1",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: MyShared.getThemeMode() == ThemeMode.dark
                                ? AppColors.notPureWhite
                                : AppColors.primary,
                          ),
                        ),
                        horizontalSpacing(10),
                        AppSVG(
                          assetName: "minus",
                          color: MyShared.getThemeMode() == ThemeMode.dark
                              ? AppColors.notPureWhite
                              : AppColors.primary,
                        ),
                        horizontalSpacing(5),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}