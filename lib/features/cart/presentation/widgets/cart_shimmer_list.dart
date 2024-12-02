import 'package:eshop/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CartShimmerList extends StatelessWidget {
  const CartShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
        _buildShimmerPlaceholder(),
      ],
    );
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
}
