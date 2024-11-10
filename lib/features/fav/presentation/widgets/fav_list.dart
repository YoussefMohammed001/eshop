import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
import 'package:eshop/features/fav/presentation/widgets/fav_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavList extends StatefulWidget {
  const FavList({super.key});

  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView(
        children: [
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is GetFavLoading) {
                return FavShimmer();
              }
              if (state is GetFavSuccess) {
                return GridView.builder(
                  itemCount: state.favoritesResponse.data.favorites.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: ProductEntities(
                          name: state.favoritesResponse.data
                              .favorites[index].product.name,
                          description: state.favoritesResponse.data
                              .favorites[index].product.description,
                          id: state.favoritesResponse.data.favorites[index]
                              .product.id,
                          images: [],
                          price: state.favoritesResponse.data
                              .favorites[index].product.price
                              .toDouble(),
                          oldPrice: state.favoritesResponse.data
                              .favorites[index].product.oldPrice
                              .toDouble(),
                          discount: state.favoritesResponse.data
                              .favorites[index].product.discount
                              .toDouble(),
                          image: state.favoritesResponse.data
                              .favorites[index].product.image,
                          isInCart: false,
                          isFav: true),
                      isLoading: false,
                    );
                  },
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0.8,
                    crossAxisSpacing: 0.4,
                    childAspectRatio: 0.7,
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
          verticalSpacing(80)

        ],
      ),
    );
  }
}
