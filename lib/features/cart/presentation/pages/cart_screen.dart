import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/features/cart/presentation/manager/cart_cubit.dart';
import 'package:eshop/features/cart/presentation/widgets/cart_details_item.dart';
import 'package:eshop/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:eshop/features/cart/presentation/widgets/cart_shimmer_list.dart';
import 'package:eshop/features/check_out/presentation/checkOut_args.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cubit = CartCubit(getIt());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cubit..getCart(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: MyShared.getThemeMode() == ThemeMode.dark
                ? AppColors.backgroundDark
                : Colors.white,
            title: Center(
                child: Text(
              S().cart,
              style: TextStyle(
                  color: MyShared.getThemeMode() == ThemeMode.dark
                      ? Colors.white
                      : Colors.black),
            )),
            iconTheme: IconThemeData(
              color: MyShared.getThemeMode() == ThemeMode.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          body: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is GetCartLoading) {
                return CartShimmerList();
              } else if (state is GetCartSuccess) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount:
                              state.cartEntities.cartItemsEntities.length,
                          itemBuilder: (context, index) {
                            return CartProductItem(

                              onDelete: () {
                                cubit
                                    .toggleCart(
                                  id: state
                                      .cartEntities
                                      .cartItemsEntities[index]
                                      .productEntities
                                      .id,
                                )
                                    .then((onValue) {
                                  setState(() {
                                    state.cartEntities.cartItemsEntities
                                        .removeAt(index);
                                    state.cartEntities.subTotal =
                                        state.cartEntities.subTotal -
                                            state
                                                .cartEntities
                                                .cartItemsEntities[index]
                                                .productEntities
                                                .price;
                                  });
                                });
                              },
                              onDecrement: () {
                                cubit
                                    .updateCart(
                                  id: state.cartEntities
                                      .cartItemsEntities[index].productCartId,
                                  quantity: state.cartEntities
                                          .cartItemsEntities[index].quantity -
                                      1,
                                )
                                    .then((onValue) {
                                  state.cartEntities.cartItemsEntities[index]
                                      .quantity--;
                                  state.cartEntities.subTotal =
                                      state.cartEntities.subTotal -
                                          state
                                              .cartEntities
                                              .cartItemsEntities[index]
                                              .productEntities
                                              .price;
                                  setState(() {});
                                });
                              },
                              onIncrement: () {
                                cubit
                                    .updateCart(
                                  id: state.cartEntities
                                      .cartItemsEntities[index].productCartId,
                                  quantity: state.cartEntities
                                          .cartItemsEntities[index].quantity +
                                      1,
                                )
                                    .then((onValue) {
                                  state.cartEntities.cartItemsEntities[index]
                                      .quantity++;
                                  state.cartEntities.subTotal =
                                      state.cartEntities.subTotal +
                                          state
                                              .cartEntities
                                              .cartItemsEntities[index]
                                              .productEntities
                                              .price;
                                  setState(() {});
                                });
                              },
                              productEntities: state.cartEntities
                                  .cartItemsEntities[index].productEntities,
                              quantity: state.cartEntities
                                  .cartItemsEntities[index].quantity,
                            );
                          }),
                    ),
                    CartDetailsItem(
                      title: S().totalItems,
                      body: state.cartEntities.cartItemsEntities
                          .fold(
                              0,
                              (int previousValue, element) =>
                                  previousValue + element.quantity)
                          .toString(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Divider(
                        color: MyShared.getThemeMode() == ThemeMode.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    CartDetailsItem(
                      title: S().totalPrice,
                      body: "${state.cartEntities.subTotal} EGP",
                    ),
                    verticalSpacing(10),
                    AppButton(onPressed: () {
                      pushNamed(context, Routes.checkOutScreen,

                      arguments: CheckOutArgs(

                          cartItemsEntities: state.cartEntities
                              .cartItemsEntities, totalQuantity: state.cartEntities.cartItemsEntities
                          .fold(
                          0,
                              (int previousValue, element) =>
                          previousValue + element.quantity),
                          totalPrice: state.cartEntities.subTotal,

                      )
                      );
                    }, label: S().checkout),
                    verticalSpacing(10)
                  ],
                );
              } else if (state is GetCartFailure) {
                return Text(state.toString());
              } else {
                return SizedBox();
              }
            },
          ),
        ));
  }
}
