import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/products_list.dart';
import 'package:eshop/features/products/presentation/manager/category_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        bool isLoading =
            state is ProductLoading; // Check if the state is loading

        return Expanded(
          child: ListView(

            padding: EdgeInsets.all(0),
            children: [
              ProductsList(
                  product: widget.categoryProductsCubit.productList,
                  isLoading: isLoading,
                  productsLength:
                      widget.categoryProductsCubit.productList.length,),
              verticalSpacing(80),
            ],
          ),
        );
      },
    );
  }
}
