import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_text_field.dart';
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
  }

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

  final cubit = HomeCubit(getIt());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            physics: state is HomeLoading ? NeverScrollableScrollPhysics() : null,
            slivers: [
              SliverToBoxAdapter(
                child: HomeAppBar(),
              ),

              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  minHeight: 70.h,
                  maxHeight: 70.h,
                  child: InkWell(
                      onTap: () {
                        pushNamed(context, Routes.searchScreen);
                      },
                      child: Container(
                        height: 10.h,
                        color: AppColors.primary,
                        child: AppTextField(
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(15.sp),
                              child: AppSVG(
                                assetName: "search",
                                color: AppColors.primary,
                              ),
                            ),
                            enabled: false,
                            title: "",
                            hintText: S().search),
                      )),
                ),
              ),
              SliverToBoxAdapter(
                child: verticalSpacing(10),

              ),
              SliverToBoxAdapter(
                child: HomeBanner(
                  cubit: cubit,
                ),
              ),
              SliverToBoxAdapter(
                child: ProductsHomeList(
                  homeCubit: cubit,
                ),
              ),
              SliverToBoxAdapter(
                child: verticalSpacing(80),

              ),
            ],
          );
        },
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
