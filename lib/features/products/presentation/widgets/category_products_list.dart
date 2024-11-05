import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/features/products/presentation/manager/category_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsList extends StatefulWidget {
  const CategoryProductsList({super.key, required this.categoryProductsCubit});
  final CategoryProductsCubit categoryProductsCubit;

  @override
  State<CategoryProductsList> createState() => _CategoryProductsListState();
}

class _CategoryProductsListState extends State<CategoryProductsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: (context, state) {
        bool isLoading = state is ProductLoading; // Check if the state is loading

        return Expanded(
          child: ListView(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: isLoading ? 6 : widget.categoryProductsCubit.productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.8.sp,
                  crossAxisSpacing: 0.4.sp,
                  childAspectRatio: 0.7.sp,
                ),
                itemBuilder: (BuildContext context, int index) {
                  // If loading, show shimmer items without actual data
                  if (isLoading) {
                    return ProductItem(
                      isLoading: true,
                      product: ProductEntities.empty(),
                    );
                  } else {
                    // Display actual products when data is loaded
                    final product = widget.categoryProductsCubit.productList[index];
                    return ProductItem(
                      isLoading: false,
                      product: product,
                    );
                  }
                },
              ),
              verticalSpacing(80),
            ],
          ),
        );
      },
    );
  }
}