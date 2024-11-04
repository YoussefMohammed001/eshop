import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key,this.updateVisible = true});
final bool updateVisible;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 338.w,
        height: 100.h,
        margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
        decoration: BoxDecoration(
            color: MyShared.getThemeMode() == ThemeMode.dark ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.grey.withOpacity(0.5))),
        child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          AppImage(
              imageUrl:
                  "https://plus.unsplash.com/premium_photo-1661368209998-6965fb87c600?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGlwaG9uZSUyMHdpdGglMjBiYWNrZ3JvdW5kJTIwd2hpdGV8ZW58MHx8MHx8fDA%3D",
              width: 91.w,
              height: 100.h,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(MyShared.getCurrentLanguage() == "ar" ? 10.r : 0.r),
                bottomRight: Radius.circular(MyShared.getCurrentLanguage() == "ar" ? 10.r : 0.r),
                topLeft: Radius.circular(MyShared.getCurrentLanguage() == "en" ? 10.r : 0.r),
                bottomLeft: Radius.circular(MyShared.getCurrentLanguage() == "en" ? 10.r : 0.r),
              )),

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
                      Text("Iphone 16",
                          style: TextStyle(
                              color:MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.notPureBlack,
                              fontWeight: FontWeight.w700)),
                      Visibility(
                          visible: updateVisible,
                          child: Icon(Icons.delete_outline_rounded, color: AppColors.error))
                    ],
                  ),
                  verticalSpacing(2),
                  Row(
                    children: [
                      Text("SAR 3000",
                          style: TextStyle(
                              color: AppColors.moreGold,
                              fontWeight: FontWeight.w600)),
                      horizontalSpacing(5),
                      Text(
                        "SAR 7500.00",
                        style: TextStyle(
                          color: AppColors.error,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      horizontalSpacing(5),
                      Text(
                        "50 %",
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
                    itemSize: 15.sp, itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:  EdgeInsets.all(5.sp),
                        child: AppSVG(assetName: "star"),
                      );
                  },
              
                  ),
              
                  Visibility(
                    visible: updateVisible,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppSVG(assetName: "plus",
              
                        color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.moreGold,
                        ),
                        horizontalSpacing(10),
                        Text("1",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.moreGold,
                          ),
                        ),
                        horizontalSpacing(10),
                        AppSVG(assetName: "minus",
                          color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.notPureWhite : AppColors.moreGold,
                        ),
                        horizontalSpacing(5),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),





        ]));
  }
}
