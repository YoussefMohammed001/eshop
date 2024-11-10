import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
import 'package:eshop/features/fav/presentation/widgets/fav_list.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  bool isLoading = true;

  @override
  void initState() {
    context.read<FavoriteCubit>().getFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Text(
              S().fav,
              style: TextStyle(
                color: MyShared.getThemeMode() == ThemeMode.dark
                    ? AppColors.notPureWhite
                    : AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
          ),
        ),
        FavList(),
      ],
    );
  }
}
