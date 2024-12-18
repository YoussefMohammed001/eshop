import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CartProductItem extends StatefulWidget {
   CartProductItem(
      {super.key,
      this.updateVisible = true,
      required this.productEntities,
       this.onIncrement,
       this.onDecrement,
       this.quantity = 0, this.onDelete});
  final bool updateVisible;
  final ProductEntities productEntities;
  final VoidCallback? onIncrement, onDecrement,onDelete;
   int quantity;



  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {


  @override
  void initState() {

    safePrint("quantity===========>${widget.quantity}");
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  _buildCartItem(context);
  }



  // Main cart item UI
  Widget _buildCartItem(BuildContext context) {
    return Container(
      width: 338.w,
      height: 100.h,
      margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
      decoration: BoxDecoration(
        color: MyShared.getThemeMode() == ThemeMode.dark
            ? Colors.transparent
            : Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.grey.withOpacity(0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(
            imageUrl: widget.productEntities.image,
            width: 91.w,
            height: 100.h,
            borderRadius: BorderRadius.circular(10.r),
          ),
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
                      Expanded(
                        child: Text(
                          widget.productEntities.name,
                          maxLines: 2,
                          style: TextStyle(
                            color: MyShared.getThemeMode() == ThemeMode.dark
                                ? AppColors.notPureWhite
                                : AppColors.notPureBlack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      horizontalSpacing(10),
                      Visibility(
                        visible: widget.updateVisible,
                        child: InkWell(
                          onTap: widget.onDelete,
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.error,
                          ),
                        ),
                      ),
                      horizontalSpacing(10),
                    ],
                  ),
                  verticalSpacing(2),
                  Row(
                    children: [
                      Text(widget.productEntities.price.toString(),
                          style: TextStyle(
                              color: AppColors.moreGold,
                              fontWeight: FontWeight.w600)),
                      horizontalSpacing(5),
                      Text(
                        widget.productEntities.oldPrice.toString(),
                        style: TextStyle(
                          color: AppColors.error,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      horizontalSpacing(5),
                      Text(
                        "${widget.productEntities.discount.toInt()} %",
                        style: TextStyle(
                          color: AppColors.error,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: widget.updateVisible,
                        child: InkWell(
                          onTap: widget.onIncrement,
                          child: AppSVG(
                            assetName: "plus",
                            color: MyShared.getThemeMode() == ThemeMode.dark
                                ? AppColors.notPureWhite
                                : AppColors.primary,
                          ),
                        ),
                      ),
                      horizontalSpacing(10),
                      Text(
                        widget.quantity.toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: MyShared.getThemeMode() == ThemeMode.dark
                              ? AppColors.notPureWhite
                              : AppColors.primary,
                        ),
                      ),
                      horizontalSpacing(10),
                      Visibility(
                        visible:widget.quantity > 1 && widget.updateVisible,
                        child: InkWell(
                          onTap: widget.onDecrement,
                          child: AppSVG(
                            assetName: "minus",
                            color: MyShared.getThemeMode() == ThemeMode.dark
                                ? AppColors.notPureWhite
                                : AppColors.primary,
                          ),
                        ),
                      ),
                      horizontalSpacing(5),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
