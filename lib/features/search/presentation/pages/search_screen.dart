import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_text_field.dart';
import 'package:eshop/core/widgets/products_list.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
import 'package:eshop/features/search/presentation/manager/search_cubit.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final cubit = SearchCubit(getIt());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(getIt()),
      child: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return SafeArea(
              bottom: false,


              child: Scaffold(
                body: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: AppColors.primary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          horizontalSpacing(10),
                          InkWell(
                            onTap: () => pop(context),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColors.notPureWhite,
                            ),
                          ),
                          Expanded(
                            child: AppTextField(
                                onChanged: (value) {
                                  cubit.search(search: value);
                                },
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(15.sp),
                                  child: AppSVG(
                                    assetName: "search",
                                    color: AppColors.primary,
                                  ),
                                ),
                                enabled: true,
                                autofocus: true,
                                title: "",
                                hintText: S().search),
                          ),
                          verticalSpacing(5),
                        ],
                      ),
                    ),
                    state is SearchInitial
                        ? Center(child: Text(S().search))
                        : Expanded(
                          child: ListView(

                            children: [
                              ProductsList(
                                isLoading: cubit.isLoading,
                                productsLength: cubit.searchProducts.length,
                                product: cubit.searchProducts,
                              ),
                            ],
                          ),
                        ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
