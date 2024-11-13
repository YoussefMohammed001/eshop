import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/easy_loading.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/features/fav/domain/entities/fav_entities.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatelessWidget {
  ProductsList({
    super.key,
    this.product = const [],
    required this.isLoading,
    this.isFavScreen = false,
    required this.productsLength,

  });

  List<ProductEntities> product = [];
  List<FavEntities> favList = [];
  final bool isLoading;
  final bool isFavScreen;
  final int productsLength;

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
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: isLoading ? 10 : productsLength,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0.8.sp,
              crossAxisSpacing: 0.4.sp,
              childAspectRatio: 0.7.sp,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(
                onFavTap: () {
                  context.read<FavoriteCubit>().toggleFav(
                      product[index].id
                  ).then((onValue){
                    product[index].isInFavorite = !product[index].isInFavorite;
                  });
                },
                isLoading: isLoading,
                product: isLoading == false
                    ? product[index]
                    : ProductEntities(),
              );
            },
          );
        },
      ),
    );
  }
}
