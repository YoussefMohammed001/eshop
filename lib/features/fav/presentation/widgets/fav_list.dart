import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/easy_loading.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavList extends StatefulWidget {
  const FavList({super.key, required this.cubit});

  final FavoriteCubit cubit;

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
  listener: (context, state) {
    if(state is ToggleFavoriteLoading){
      showLoading();
    } if(state is ToggleFavoriteSuccess){
      showSuccess(state.message);
    }if(state is ToggleFavoriteFailure){
      showError(state.message);
    }
  },
  child: BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return state is GetFavSuccess && widget.cubit.favorites.isEmpty ?   Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.heart_broken_outlined,color: AppColors.primary,
              size: 80.sp,
              ),
              Text(S().noProductsInFav,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp
              ),
              ),
              verticalSpacing(100.h)
            ],
          ),
        )  : Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.cubit.isLoading ? 10 : widget.cubit.favorites
                    .length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.8.sp,
                  crossAxisSpacing: 0.4.sp,
                  childAspectRatio: 0.7.sp,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(
                    isFavScreen:  true,
                    onFavTap: () {
                      widget.cubit.toggleFav(
                        widget.cubit.favorites[index].productEntities.id
                      ).then((onValue){
                        widget.cubit.favorites.removeAt(index);
                      });},
                    isLoading: widget.cubit.isLoading,
                    product: widget.cubit.isLoading
                        ? ProductEntities()
                        : widget.cubit.favorites[index].productEntities,
                  );
                },
              ),
              verticalSpacing(80),
            ],
          ),
        );
      },
    ),
);
  }
}
