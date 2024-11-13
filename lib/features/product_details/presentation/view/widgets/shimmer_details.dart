import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_pro/shimmer_pro.dart';

class ShimmerDetails extends StatefulWidget {
  const ShimmerDetails({super.key});

  @override
  State<ShimmerDetails> createState() => _ShimmerDetailsState();
}

class _ShimmerDetailsState extends State<ShimmerDetails> {
  late Color bgColor;
  late ShimmerProLight shimmerlight;
  @override
  void initState() {
    super.initState();
    _themeMode();
  }

  void _themeMode() {

    if (MyShared.getThemeMode() ==ThemeMode.dark) {
      setState(() {
        bgColor = AppColors.backgroundDark;
        shimmerlight = ShimmerProLight.darker;
      });
    } else {
      setState(() {
        bgColor = const Color.fromARGB(255, 240, 240, 240);
        shimmerlight = ShimmerProLight.darker;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ShimmerPro.generated(
            light: shimmerlight,
            scaffoldBackgroundColor: bgColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(10),

                  // Shimmer for CustomAppBar title
                  ShimmerPro.sized(
                    scaffoldBackgroundColor: bgColor,
                    height: 40.h,  // Height for the app bar title shimmer
                    width: double.infinity,  // Width for the shimmer title
                    borderRadius: 10.r,
                  ),

                  verticalSpacing(10),

                  // Shimmer for ProductDetailsBanner (image area)
                  ShimmerPro.sized(
                    scaffoldBackgroundColor: bgColor,
                    height: 177.h,  // Height for the product image banner
                    width: double.infinity,
                    borderRadius: 10.r,
                  ),

                  DividerWidget(),

                  // Shimmer for ProductDetailsContent section
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product name shimmer
                        verticalSpacing(5),
                        ShimmerPro.sized(
                          scaffoldBackgroundColor: bgColor,
                          height: 18.h,
                          width: double.infinity,  // Width for old price shimmer
                          borderRadius: 10.r,
                        ),
                        // Shimmer for old price with strikethrough
                        Row(
                          children: [
                            ShimmerPro.sized(
                              scaffoldBackgroundColor: bgColor,
                              height: 18.h,
                              width: 80.w,  // Width for old price shimmer
                              borderRadius: 10.r,
                            ),
                            horizontalSpacing(10),
                            ShimmerPro.sized(
                              scaffoldBackgroundColor: bgColor,
                              height: 18.h,
                              width: 80.w,  // Width for old price shimmer
                              borderRadius: 10.r,
                            ),
                          ],
                        ),
                        verticalSpacing(10),
                        Row(
                          children: [
                            ShimmerPro.sized(

                              scaffoldBackgroundColor: bgColor,
                              height: 18.h,
                              width: 80.w,  // Width for old price shimmer
                              borderRadius: 10.r,
                            ),
                          ],
                        ),
                        verticalSpacing(10),

                        // Shimmer for description
                        ShimmerPro.text(
                          maxLine: 12,  // Number of lines for description shimmer
                          light: shimmerlight,
                          scaffoldBackgroundColor: bgColor,
                          borderRadius: 10.r,
                        ),

                        // Shimmer for "Add to Cart" and "Add to Favorites" buttons
                        ShimmerPro.sized(
                          scaffoldBackgroundColor: bgColor,
                          height: 40.h,  // Height for button shimmer
                          width: double.infinity,  // Width for "Add to Favorites" button shimmer
                          borderRadius: 20.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
