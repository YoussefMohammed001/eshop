import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return        Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S().alreadyHaveAnAccount,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ), GestureDetector(
          onTap: (){
            pushNamed(context, Routes.loginScreen);
          },
          child: Text(" ${S().login}",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
