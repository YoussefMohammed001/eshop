import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop/core/widgets/app_asset.dart';
import 'package:eshop/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.image,
    this.isLoading = true, // Add a loading state parameter
  });

  final String image;
  final bool isLoading; // New parameter for loading state

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: isLoading ? 3 : 10, // Show shimmer for 3 items when loading
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return isLoading ? _buildShimmer() : _buildContent(); // Show shimmer or content based on loading state
      },
      options: CarouselOptions(
        viewportFraction: 0.9, // Adjust this value to fit the width
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
        autoPlay: true,
        height: 127,
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.sp),
        width: 338.w,
        height: 127.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r), // Match the asset image's border radius
        ),
      ),
    );
  }

  Widget _buildContent() {
    return AppImage(
      imageUrl: image,
      width: 338.w,
      height: 127.h,
   borderRadius: BorderRadius.circular(10.r),
      fit: BoxFit.fitWidth,
    );
  }
}