import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:eshop/features/check_out/presentation/checkOut_args.dart';
import 'package:eshop/features/check_out/presentation/widgets/order_details_checkout_item.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyword_highlighter/flutter_keyword_highlighter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key, required this.checkOutArgs});
final CheckOutArgs checkOutArgs;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: S().checkout),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: checkOutArgs.cartItemsEntities.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return CartProductItem(
                          quantity: checkOutArgs.cartItemsEntities[index].quantity,
                            updateVisible: false,
                            productEntities: checkOutArgs.cartItemsEntities[index].productEntities);
                      },
                    ),
                  ],
                ),
              ),
            ),
            verticalSpacing(10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sp),
              decoration: BoxDecoration(
                border: Border.all(
                  color: MyShared.getThemeMode() == ThemeMode.dark
                      ? AppColors.grey
                      : Colors.transparent,
                ),
                color: MyShared.getThemeMode() == ThemeMode.dark
                    ? Colors.transparent
                    : AppColors.moreGold,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(children: [
                OrderDetailsCheckoutItem(
                  title: S().totalItems,
                  value: checkOutArgs.totalQuantity.toString(),
                ),
                OrderDetailsCheckoutItem(
                  title: S().totalPrice,
                  value: "${checkOutArgs.totalPrice} EGP",
                  dividerVisibility: false,
                ),
              ]),
            ),
            verticalSpacing(10),
            HighlightedText(
              content: "${S().deliveryAddress}: مدينة الملك عبدالعزيز، الرياض، السعودية",
              defaultTextStyle: TextStyle(
                color: MyShared.getThemeMode() == ThemeMode.dark
                    ? AppColors.notPureWhite
                    : AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
              highlightedTextStyles: [],
            ),
            verticalSpacing(10),
            AppButton(
                onPressed: () {},
                label: S().checkout,
                width: 348.w,
                height: 56.h),
            verticalSpacing(20)
          ],
        ),
      ),
    );
  }
}
