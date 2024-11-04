import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreProducts extends StatefulWidget {
  const StoreProducts({super.key});

  @override
  State<StoreProducts> createState() => _StoreProductsState();
}

class _StoreProductsState extends State<StoreProducts> {

  List<String> images = [
    'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];
  List<String> categories = [
    'Electronics',
   "Appliances",
    "Furniture",
    "Home",
    "Beauty",
    "Sports",
    "Toys",
    "Books",
  ];

  List<bool> isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((v) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.sp,
            ),
            child: Text(S().categories,

              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500
              ),),
          ),
          verticalSpacing(15),
          SizedBox(
            height: 95.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 10.sp
              ),
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  isLoading = true;
                  setState(() {
                    isSelected = List.generate(images.length, (index) => false);
                    isSelected[index] = true;
                  });
                  Future.delayed(Duration(seconds: 2)).then((v) {
                    if (mounted) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  });

                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [

                          CircleAvatar(
                            radius: 32.r,
                            backgroundColor: isSelected[index] ? AppColors.moreGold :  Colors.transparent,
                          ),
                          CircleAvatar(
                            radius: 29.r,
                            backgroundImage: Image.network(images[index]).image,
                            backgroundColor: AppColors.primary,

                          ),
                        ],
                      ),
                      verticalSpacing(10),
                      Text(categories[index],)
                    ],
                  ),
                ),
              );
            },),
          ),
          verticalSpacing(15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.sp,
            ),
            child: Text(S().products,

              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500
              ),),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
                horizontal: 10.sp
            ),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(isLoading: isLoading);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8.sp,
            ),
          ),

        ],
      ),
    );
  }
}
