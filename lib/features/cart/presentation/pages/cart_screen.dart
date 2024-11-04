import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: S().cart,result: true,),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {

                return CartProductItem();
              },),
            ),
            verticalSpacing(5),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.sp),
              width: 338.w,
              height: 61.h,
              padding: EdgeInsets.symmetric(
                horizontal: 15.sp
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.grey:Colors.transparent ,
                ),
                  color: MyShared.getThemeMode() == ThemeMode.dark ? Colors.transparent : AppColors.primary,
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S().totalPrice,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.notPureWhite
                  ),
                  ),   Text("5000 SAR",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.notPureWhite
                  ),
                  ),
                ],
              ),

            ),
            AppButton(
              borderRadius: BorderRadius.circular(10.r),
              width: 338.w,
              padding: EdgeInsets.zero,
              height: 61.h,
              margin: EdgeInsets.zero,

              onPressed: (){
                pushNamed(context, Routes.checkOutScreen);
              }, label: S().checkout,
              fontSize: 16.sp,
            backgroundColor: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.primaryDarkTheme : AppColors.moreGold,
            ),
            verticalSpacing(15),
          ],
        ),
      ),
    );
  }
}
