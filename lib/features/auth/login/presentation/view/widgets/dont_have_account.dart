import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveAccountWidget extends StatefulWidget {
  const DontHaveAccountWidget({super.key});

  @override
  State<DontHaveAccountWidget> createState() => _DontHaveAccountWidgetState();
}

class _DontHaveAccountWidgetState extends State<DontHaveAccountWidget> {
  @override
  Widget build(BuildContext context) {
    return        Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S().dontHaveAnAccount,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ), GestureDetector(
          onTap: (){
            pushNamed(context, Routes.registerScreen);
          },
          child: Text(" ${S().register}",
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