import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:flutter/material.dart';

class FavShimmer extends StatelessWidget {
  const FavShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ProductItem(
          product: ProductEntities(
            name: "",
            id: 0,
            price: 0,
            oldPrice: 0,
            image: "image",
            isInCart: false,
            isFav: false,
            discount: 0,
            images: [],
            description: '',
          ),
          isLoading: true,
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
  }
}
