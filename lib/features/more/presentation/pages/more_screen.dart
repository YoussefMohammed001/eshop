import 'package:eshop/core/cubits/language/language_cubit.dart';
import 'package:eshop/core/cubits/language/language_state.dart';
import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/features/more/presentation/widgets/more_item.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(12.sp),
            child: Text(
              S().more,
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
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            // Get the current theme mode
            ThemeMode currentTheme = MyShared.getThemeMode();

            return Column(
              children: [
                MoreItem(
                  image: "profile",
                  text: S().profile,
                  onTap: () {
                    pushNamed(context, Routes.profileScreen);
                  },
                  themeMode: currentTheme, // Pass themeMode to MoreItem
                ),
                MoreItem(
                  image: "order",
                  text: S().myOrders,
                  onTap: () {},
                  themeMode: currentTheme, // Pass themeMode to MoreItem
                ),

                MoreItem(
                  image: "settings",
                  text: S().setting,
                  onTap: () {
                    final result = pushNamed(context, Routes.settingsScreen);
                    if (result == true) {
                      setState(() {});
                    }
                  },
                  themeMode: currentTheme, // Pass themeMode to MoreItem
                ),
                MoreItem(
                  image: "logout",
                  text: S().logOut,
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(S().logOut),
                          content: Text(S().areYouSureYouWantToLogOut),
                          actions: [
                            TextButton(
                              onPressed: () {
                                pop(context);
                              },
                              child: Text(S().cancel),
                            ),
                            TextButton(
                              onPressed: () {
                                MyShared.clearUserData();
                                pushNamedAndRemoveUntil(context, Routes.splash);
                              },
                              child: Text(S().logOut),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  themeMode: currentTheme, // Pass themeMode to MoreItem
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
