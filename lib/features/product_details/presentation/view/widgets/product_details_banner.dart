import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsBanner extends StatefulWidget {
  const ProductDetailsBanner({
    super.key,
    required this.images,
    this.isLoading = true, // Add a loading state parameter
  });

  final List<String> images;
  final bool isLoading;

  @override
  State<ProductDetailsBanner> createState() => _ProductDetailsBannerState();
}

class _ProductDetailsBannerState extends State<ProductDetailsBanner> {
  int currentIndex = 0; // Current index of the carousel
  final CarouselSliderController _carouselController = CarouselSliderController(); // Declare the carousel controller

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Row(
        children: [
          InkWell(
            onTap: () {

              _carouselController.previousPage(); // Use previousPage for backward navigation
            },

            child: AppSVG(
              assetName: MyShared.getCurrentLanguage() == "en"
                  ? MyShared.getThemeMode() == ThemeMode.dark
                  ? "back_white"
                  : "back"
                  : MyShared.getThemeMode() == ThemeMode.dark
                  ? "forward_white"
                  : "forward",
              height: 25.h,
              width: 25.w,
            ),
          ),
          Expanded(
            child: CarouselSlider.builder(
              itemCount: widget.images.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return widget.isLoading ? _buildShimmer() : _buildContent(index: index);
              },
              options: CarouselOptions(
                viewportFraction: 0.9, // Adjust this value to fit the width
                enlargeCenterPage: true,
                autoPlay: false,
                height: 159.h,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index; // Update the current index
                  });
                },
              ),
              carouselController: _carouselController, // Assign the controller here
            ),
          ),
          InkWell(
            onTap: () {

                _carouselController.nextPage(); // Use nextPage for forward navigation

                // Go to the first image

            },
            child: AppSVG(
              assetName: MyShared.getCurrentLanguage() == "en"
                  ? MyShared.getThemeMode() == ThemeMode.dark
                  ? "forward_white"
                  : "forward"
                  : MyShared.getThemeMode() == ThemeMode.dark
                  ? "back_white"
                  : "back",
              height: 25.h,
              width: 25.w,
            ),
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

  Widget _buildContent({required int index}) {
    return AppImage(
      imageUrl: widget.images[index],
      width: 338.w,
      height: 127.h,
      borderRadius: BorderRadius.circular(0),
      fit: BoxFit.fill,
    );
  }
}