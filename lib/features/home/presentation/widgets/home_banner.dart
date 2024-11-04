import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop/core/widgets/app_image.dart';
import 'package:eshop/features/home/presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
    required this.cubit, // Add a loading state parameter
  });

  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: cubit.isLoading
          ? 10
          : cubit.homeEntities.banners
              .length, // Show shimmer for 3 items when loading
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return cubit.isLoading
            ? _buildShimmer()
            : _buildContent(
                index: index); // Show shimmer or content based on loading state
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
          borderRadius: BorderRadius.circular(
              10.r), // Match the asset image's border radius
        ),
      ),
    );
  }

  Widget _buildContent({required int index}) {
    return AppImage(
      imageUrl: cubit.homeEntities.banners[index].image,
      width: 338.w,
      height: 127.h,
      borderRadius: BorderRadius.circular(10.r),
      fit: BoxFit.fitWidth,
    );
  }
}
