import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/features/home/presentation/manager/home_cubit.dart';
import 'package:eshop/features/home/presentation/widgets/home_app_bar.dart';
import 'package:eshop/features/home/presentation/widgets/home_banner.dart';
import 'package:eshop/features/home/presentation/widgets/products_list.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  final cubit = HomeCubit(getIt());
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit..getHomeData(),
  child: BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    return Column(
      children: [
 HomeAppBar(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              verticalSpacing(10),
              HomeBanner(cubit: cubit,),
              verticalSpacing(30),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Text(S().topRated,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w700),)),
              verticalSpacing(10),
              ProductsList(homeCubit: cubit,),
              verticalSpacing(80),
            ],
          ),
        ),
      ],
    );
  },
),
);
  }
}