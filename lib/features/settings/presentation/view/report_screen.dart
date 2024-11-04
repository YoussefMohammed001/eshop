import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/core/widgets/app_text_field.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: S().report,
            ),
            verticalSpacing(10),
            Expanded(
              child: ListView(
                children: [
                  AppTextField(title: S().fullName, hintText: S().fullName,
                  withTitle: true,
                  ),
                  verticalSpacing(10),
                  AppTextField(title: S().fullName, hintText: S().fullName,
                  withTitle: true,
                    minLines: 10,
                    maxLines: 20,
                  ),
                    AppButton(
                      margin: EdgeInsets.all(15.sp),
                      onPressed: (){}, label: S().send,
                    backgroundColor: MyShared.getThemeMode() == ThemeMode.dark ? AppColors.primaryDarkTheme: AppColors.primary,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
