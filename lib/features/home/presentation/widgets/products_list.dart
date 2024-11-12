import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/core/widgets/products_list.dart';
import 'package:eshop/features/home/presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsHomeList extends StatelessWidget {
  const ProductsHomeList({
    super.key,
    required this.homeCubit,
  });
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return ProductsList(

      product: homeCubit.homeEntities.products,
      isLoading: homeCubit.isLoading ,
      productsLength: homeCubit.homeEntities.products.length,);
  }
}
