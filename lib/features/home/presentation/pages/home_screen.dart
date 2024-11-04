import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/features/home/presentation/widgets/home_app_bar.dart';
import 'package:eshop/features/home/presentation/widgets/home_banner.dart';
import 'package:eshop/features/home/presentation/widgets/products_list.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  }  List<String> images = [
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              verticalSpacing(10),
              HomeBanner(image: "https://media.istockphoto.com/id/1307857856/photo/store-on-smartphone-with-shopping-online-social-media-application-concept-3d-render.webp?a=1&b=1&s=612x612&w=0&k=20&c=8n3nQ0xvFdH-r2Z4pr3it79uyxcJyRNBOllJq2SdKnM=", isLoading: isLoading),
              verticalSpacing(30),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Text(S().categories,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),)),
              verticalSpacing(10),
              SizedBox(
                height: 95.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.sp
                  ),
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){

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
                                  backgroundColor:AppColors.primary
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
              verticalSpacing(20),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Text(S().topRated,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),)),
              verticalSpacing(10),
              ProductsList(isLoading: isLoading),
              verticalSpacing(80),
            ],
          ),
        ),
      ],
    );
  }
}