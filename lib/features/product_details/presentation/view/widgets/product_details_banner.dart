import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsBanner extends StatelessWidget {
  const ProductDetailsBanner({
    super.key,
    required this.image,
    this.isLoading = true, // Add a loading state parameter
  });

  final String image;
  final bool isLoading; // New parameter for loading state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(12.sp),
      child: Row(
        children: [
          AppSVG(assetName:
          MyShared.getCurrentLanguage() == "en" ?  MyShared.getThemeMode() == ThemeMode.dark ? "back_white"  : "back":    MyShared.getThemeMode() == ThemeMode.dark ? "forward_white"  : "forward",
            height: 25.h,
            width: 25.w,
          ),
          Expanded(
            child: CarouselSlider.builder(
              itemCount: isLoading ? 3 : 10, // Show shimmer for 3 items when loading
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return isLoading ? _buildShimmer() : _buildContent(); // Show shimmer or content based on loading state
              },
              options: CarouselOptions(
                viewportFraction: 0.9, // Adjust this value to fit the width
                enlargeCenterPage: true,

                autoPlay: false,
                height: 159,
              ),
            ),
          ),
          AppSVG(assetName:           MyShared.getCurrentLanguage() == "en" ?     MyShared.getThemeMode() == ThemeMode.dark ? "forward_white"  : "forward" : MyShared.getThemeMode() == ThemeMode.dark ? "back_white"  : "back",
            height: 25.h,
            width: 25.w,
          ),

        ],
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.sp),
        width: 244.w,
        height: 159.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r), // Match the asset image's border radius
        ),
      ),
    );
  }

  Widget _buildContent() {
    return AppAssetImage(
      image: image,
      width: 338.w,
      height: 127.h,
      topLeftRadius: 0,
      topRightRadius: 0,
      bottomLeftRadius: 0,
      bottomRightRadius: 0,
      fit: BoxFit.contain,
    );
  }
}