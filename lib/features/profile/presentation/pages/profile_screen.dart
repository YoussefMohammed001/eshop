import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/shared_preferences/my_shared_keys.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/core/widgets/app_text_field.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailC = TextEditingController();
  @override
  void initState() {
    nameController.text = MyShared.getString(key: MySharedKeys.userName);
    phoneController.text = MyShared.getString(key: MySharedKeys.userPhone);
    emailC.text = MyShared.getString(key: MySharedKeys.email);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: S().profile),
            verticalSpacing(20),
            AppTextField(title: S().fullName, hintText: S().fullName,
            controller: nameController,enabled: false,
            ),
            AppTextField(title: S().fullName, hintText: S().fullName,
              controller: emailC,
              enabled: false,
            ),
             AppTextField(title: S().fullName, hintText: S().fullName,
              controller: phoneController,
              enabled: false,
            ),
            verticalSpacing(20),
            // AppButton(onPressed: (){}, label:S().save,
            //   backgroundColor:MyShared.getThemeMode() == ThemeMode.dark ? AppColors.primaryDarkTheme : AppColors.moreGold
            // ),
            // verticalSpacing(20),
            // AppButton(onPressed: (){}, label:S().cancel,
            // backgroundColor: AppColors.grey,
            // ),
            verticalSpacing(20),
            GestureDetector(
              onTap: (){
                pushNamed(context, Routes.deleteScreen);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15.sp
                ),
                width: 335.w,
                height: 60.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color:MyShared.getThemeMode() == ThemeMode.dark ? AppColors.primaryDarkTheme :  AppColors.primary
                  )
                ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSVG(assetName: "delete",
                    color: AppColors.error,
                    ),
                    horizontalSpacing(10),
                    Text(S().deleteAccount,
                    )
                  ],
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
