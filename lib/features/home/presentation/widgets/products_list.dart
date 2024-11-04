import 'package:eshop/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.isLoading});
final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          isLoading: isLoading,
        );
      }, gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0.8.sp,
        crossAxisSpacing: 0.4.sp,
        childAspectRatio: 0.9.sp,
      ),

    );
  }
}
