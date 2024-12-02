import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/utils/easy_loading.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/core/widgets/divider.dart';
import 'package:eshop/features/cart/presentation/manager/cart_cubit.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
import 'package:eshop/features/product_details/presentation/manager/product_details_cubit.dart';
import 'package:eshop/features/product_details/presentation/view/product_details_args.dart';
import 'package:eshop/features/product_details/presentation/view/widgets/add_to_cart_item.dart';
import 'package:eshop/features/product_details/presentation/view/widgets/product_deails_content.dart';
import 'package:eshop/features/product_details/presentation/view/widgets/product_details_banner.dart';
import 'package:eshop/features/product_details/presentation/view/widgets/shimmer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.args});
  final ProductDetailsArgs args;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final cubit = ProductDetailsCubit(getIt());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => cubit..getProductDetails(id: widget.args.id),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(getIt()),
        ),
        BlocProvider(
          create: (context) => CartCubit(getIt()),
        ),
      ],
      child: BlocListener<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is ToggleFavoriteLoading) {
            showLoading();
          }
          if (state is ToggleFavoriteSuccess) {
            showSuccess(state.message);
          }
          if (state is ToggleFavoriteFailure) {
            showError(state.message);
          }
        },
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return ShimmerDetails();
            }
            if (state is ProductDetailsSuccess) {
              return SafeArea(
                child: Scaffold(
                  body: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Column(
                      children: [
                        verticalSpacing(10),
                        CustomAppBar(
                          title: state.productEntities.name,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            // This will remove the shadow and give a bounce effect
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProductDetailsBanner(
                                  images: state.productEntities.images,
                                  isLoading: false,
                                ),
                                DividerWidget(),
                                ProductDeailsContent(
                                  name: state.productEntities.name,
                                  oldPrice: state.productEntities.oldPrice,
                                  description:
                                      state.productEntities.description,
                                  price: state.productEntities.price,
                                  discount: state.productEntities.discount,
                                  isInCart: state.productEntities.isInCart,
                                  isInFav: state.productEntities.isInFavorite,
                                  onFavTap: () {
                                    context
                                        .read<FavoriteCubit>()
                                        .toggleFav(state.productEntities.id)
                                        .then((v) {
                                      state.productEntities.isInFavorite =
                                          !state.productEntities.isInFavorite;
                                      setState(() {});
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        AddToCartItem(
                          isInCart: state.productEntities.isInCart,
                          onTap: () {
                            context.read<CartCubit>().toggleCart(id: state.productEntities.id).then((onValue){
                              state.productEntities.isInCart =
                              !state.productEntities.isInCart;
                              setState(() {});
                            });

                          },
                        ),
                        verticalSpacing(15),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
