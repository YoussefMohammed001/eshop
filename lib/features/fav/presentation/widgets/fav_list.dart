import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
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
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return Expanded(
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
                      ); widget.cubit.favorites.removeAt(index);
                    },
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
    );
  }
}
