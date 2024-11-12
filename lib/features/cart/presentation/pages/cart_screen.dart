import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/features/cart/presentation/widgets/cart_product_item.dart';
import 'package:eshop/features/cart/presentation/widgets/cart_shimmer_items.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = true;

  @override
  void initState() {

    Future.delayed(Duration(seconds: 3)).then((onValue){
      isLoading = false;
          setState(() {

          });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            S().cart,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Colors.white,

          iconTheme: IconThemeData(
              color: Colors.black), // Set the color for the back button icon
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        body: CustomScrollView(
          slivers: [
            // "Subtotal" section that scrolls with the content
            SliverToBoxAdapter(
              child: isLoading ? shimmerSubPrice() : Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${S().totalPrice} EGP 381.00',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    verticalSpacing(5.h),
                    Text(
                      'Part of your order qualifies for FREE Shipping.\nChoose the FREE Shipping option at checkout.',
                      style:
                          TextStyle(fontSize: 14.sp, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),

            // Pinned "Proceed to Buy" button section
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 70.h,
                maxHeight: 70.h,
                child: isLoading ? shimmerButton() : Container(
                  color: Colors.white,
                  child: Center(
                    child: AppButton(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(vertical: 10.sp),
                      onPressed: () {
                        // Handle checkout action here
                      },
                      label: S().checkout,
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Divider(),
            ),
            // List of Cart Items
            SliverList.builder(
              itemCount: 35,
              itemBuilder: (BuildContext context, int index) {
                return CartProductItem(isLoading: isLoading,);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
