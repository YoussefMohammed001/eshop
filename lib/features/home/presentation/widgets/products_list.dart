import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/features/home/presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.homeCubit,});
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:homeCubit.isLoading == true ? 10 :  homeCubit.homeEntities.products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          isLoading: homeCubit.isLoading,
          product:homeCubit.homeEntities.products.isNotEmpty ? homeCubit.homeEntities.products[index] : ProductEntities(name: "", id: 0, price: 0, oldPrice: 0, image: "image", isInCart: false, isFav: false, discount: 0),
        );
      }, gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0.8.sp,
        crossAxisSpacing: 0.4.sp,
        childAspectRatio: 0.7.sp,
      ),

    );
  }
}
