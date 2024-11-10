import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavList extends StatefulWidget {
  const FavList({super.key, required this.cubit});
  final FavoriteCubit cubit;
  @override
  State<FavList> createState() => _FavListState();
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              return GridView.builder(
                itemCount: widget.cubit.favorites.isEmpty
                    ? 10
                    : widget.cubit.favorites.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: widget.cubit.favorites.isEmpty
                        ? ProductEntities(
                            name: "",
                            id: 0,
                            price: 0,
                            oldPrice: 0,
                            image: "image",
                            isInCart: false,
                            isFav: false,
                            discount: 0,
                            images: [],
                            description: '')
                        : ProductEntities(
                            name: widget.cubit.favorites[index].product.name ,
                            description: widget.cubit.favorites[index].product
                                    .description ,
                            id: widget.cubit.favorites[index].product.id ,
                            images: [],
                            price: widget.cubit.favorites[index].product.price
                                    .toDouble() ,
                            oldPrice: widget
                                    .cubit.favorites[index].product.oldPrice
                                    .toDouble() ,
                            discount: widget
                                    .cubit.favorites[index].product.discount
                                    .toDouble() ,
                            image: widget.cubit.favorites[index].product.image ,
                            isInCart: false,
                            isFav: true),
                    isLoading: widget.cubit.favorites.isEmpty ? true : false,
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.8,
                  crossAxisSpacing: 0.4,
                  childAspectRatio: 0.7,
                ),
              );
            },
          ),
          verticalSpacing(80)
        ],
      ),
    );
  }
}
