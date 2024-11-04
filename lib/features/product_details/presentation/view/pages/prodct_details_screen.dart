import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/core/widgets/divider.dart';
import 'package:eshop/features/product_details/presentation/view/widgets/product_deails_content.dart';
import 'package:eshop/features/product_details/presentation/view/widgets/product_details_banner.dart';
import 'package:eshop/features/product_details/presentation/view/widgets/releated_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 10.sp
          ),
          child: Column(
            children: [
              verticalSpacing(10),
              CustomAppBar( title: 'sdsdsdsdsd',),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(), // This will remove the shadow and give a bounce effect
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDetailsBanner(image: 'dress',isLoading: false,),
                      DividerWidget(),
                      ProductDeailsContent(),
                      verticalSpacing(10),
                      verticalSpacing(10),
                      ReleatedProducts()
                
                
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
