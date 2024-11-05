import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/features/products/presentation/manager/category_products_cubit.dart';
import 'package:eshop/features/products/presentation/widgets/categories_list.dart';
import 'package:eshop/features/products/presentation/widgets/category_products_list.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {



  const ProductsScreen({super.key});

  @override


  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final categoryProductsCubit = CategoryProductsCubit(getIt());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => categoryProductsCubit..getCategories(),
  child: Column(
      children: [
        Center(
          child: Padding(

            padding: EdgeInsets.all(12.sp),
            child: Text(
              S().products,
              style: TextStyle(
                color: MyShared.getThemeMode() == ThemeMode.dark
                    ? AppColors.notPureWhite
                    : AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
          ),
        ),
        CategoriesList(categoryProductsCubit: categoryProductsCubit,),
        Divider(),
       CategoryProductsList(categoryProductsCubit: categoryProductsCubit,)

      ],
    ),
);
  }
}
