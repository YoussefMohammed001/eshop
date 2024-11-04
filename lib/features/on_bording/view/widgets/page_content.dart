import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageContent extends StatefulWidget {
  const PageContent(
      {super.key,
      required this.text,
      required this.controller});
  final String text;
  final PageController controller;
  @override
  State<PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.all(8.sp),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
              ),
            ),
          ),
          verticalSpacing(30),
          SmoothPageIndicator(
            controller: widget.controller,
            count: 3,
            effect: ExpandingDotsEffect(
              dotColor: AppColors.darkGrey,
              activeDotColor: AppColors.gold,
              dotHeight: 3.sp,
              dotWidth: 15.sp,
              expansionFactor: 2.sp,
            ),
          ),

          verticalSpacing(20),

        ],
      ),
    );
  }
}
