import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/features/store_profile/presentation/widgets/location.dart';
import 'package:eshop/features/store_profile/presentation/widgets/store_info_screen_image_profile.dart';
import 'package:eshop/features/store_profile/presentation/widgets/store_name.dart';
import 'package:eshop/features/store_profile/presentation/widgets/store_products.dart';
import 'package:eshop/features/store_profile/presentation/widgets/store_reviews.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreProfileScreen extends StatelessWidget {
  const StoreProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            CustomAppBar(title: S().infoStore),
            verticalSpacing(15),
            StoreInfoScreen(),
            StoreName(),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20.sp
              ),
              child: Divider(
                color: AppColors.notPureWhite,
                thickness: 1.5.sp,
              ),
            ),
            verticalSpacing(10),
            StoreReviews(),
            verticalSpacing(10),
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: 20.sp
              ),
              child: Divider(
                color: AppColors.notPureWhite,
                thickness: 1.5.sp,
              ),
            ),
            verticalSpacing(10),
            StoreProducts(),
            verticalSpacing(10),
            Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: 20.sp
              ),
              child: Divider(
                color: AppColors.notPureWhite,
                thickness: 1.5.sp,
              ),
            ),
            verticalSpacing(10),
            StoreLocation(),

          ],
        ),
      ),
    );

  }
}
