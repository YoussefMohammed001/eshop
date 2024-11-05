import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/features/main_screen/manager/main_cubit.dart';
import 'package:eshop/features/main_screen/view/widgets/bottom_nav_item.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final cubit = MainCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: Scaffold(
                body: Column(
                  children: [
                    Expanded(child: cubit.screens[cubit.index]),
                  ],
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Container(
                  width: 368.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color:
                     MyShared.getThemeMode() == ThemeMode.dark ? AppColors.backgroundDark :
                     AppColors.bottomNavColor),
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BottomNavItem(

                        icon: 'home',
                        title: S().home,
                        onTap: () {
                          cubit.changeIndex(0);
                        },
                        color: cubit.index == 0
                            ? AppColors.primary
                            : AppColors.bottomNavText,
                      ),
                      BottomNavItem(
                        icon: 'search',
                        title: S().products,
                        onTap: () {
                          cubit.changeIndex(1);
                        },
                        color: cubit.index == 1
                            ? AppColors.primary
                            : AppColors.bottomNavText,
                      ),
                      BottomNavItem(
                        icon: 'fav',
                        title: S().fav,
                        onTap: () {
                          cubit.changeIndex(2);
                        },
                        color: cubit.index == 2
                            ? AppColors.primary
                            : AppColors.bottomNavText,
                      ),
                      BottomNavItem(
                        icon: 'more',
                        title: S().more,
                        onTap: () {
                          cubit.changeIndex(3);
                        },
                        color: cubit.index == 3
                            ? AppColors.primary
                            : AppColors.bottomNavText,
                      ),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
