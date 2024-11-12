import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/safe_print.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_image.dart';
import 'package:eshop/features/products/presentation/manager/category_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key, required this.categoryProductsCubit});
  final CategoryProductsCubit categoryProductsCubit;

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((v) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryProductsCubit, CategoryProductsState>(
      builder: (context, state) {
        return SizedBox(
          height: 95.h,
          child: isLoading
              ? ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            itemCount: 6, // Placeholder count for shimmer effect
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 29.r,
                        backgroundColor: Colors.grey[300],
                      ),
                      verticalSpacing(10),
                      Container(
                        width: 50.w,
                        height: 12.h,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
              : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            itemCount: widget.categoryProductsCubit.categoriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {

                  });
                  safePrint("${widget.categoryProductsCubit.categoriesList[index].id}");
                  setState(() {
                    for (int i = 0;
                    i <
                        widget.categoryProductsCubit
                            .categoriesList.length;
                    i++) {

                      widget.categoryProductsCubit.categoriesList[i]
                          .isSelected = false;
                    }
                    widget.categoryProductsCubit.categoriesList[index]
                        .isSelected = true;
                  });
                  widget.categoryProductsCubit.getCategoryProductApi(
                      widget
                          .categoryProductsCubit
                          .categoriesList[index]
                          .id
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 29.r,
                            backgroundColor: widget
                                .categoryProductsCubit
                                .categoriesList[index]
                                .isSelected
                                ? AppColors.moreGold
                                : Colors.transparent,
                          ),
                          CircleAvatar(
                            radius: 26.r,

                            backgroundColor: AppColors.primary,
                            child: AppImage(imageUrl:widget
                                .categoryProductsCubit
                                .categoriesList[index]
                                .image , width: 60.w, height: 60.h,
                                borderRadius: BorderRadius.circular(50.r)),
                          ),
                        ],
                      ),
                      verticalSpacing(10),
                      Text(
                        widget
                            .categoryProductsCubit
                            .categoriesList[index]
                            .name,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}