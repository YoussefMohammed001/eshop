import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_bar.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/core/widgets/app_text_field.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: S().deleteAccount),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpacing(10.h),
                        Text(S().deleteAccountHead,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        verticalSpacing(3.h),
                        Text(S().deleteAccountTitle,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.start,
                        ),
                        verticalSpacing(7.h),
                        Text(S().deleteAccountText,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),),
                        verticalSpacing(7.h),
                        Text(S().deleteAccountText1,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.start,
                        ),
                        verticalSpacing(5.h),
                        Text(S().deleteAccountText2,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.start,
                        ),
                        verticalSpacing(5.h),
                        Text(S().deleteAccountText3,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Column(
                          children: [
                            verticalSpacing(15.h),
                            AppTextField(
                              withTitle: true,
                              hintText: "****************",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              title: S().password,
                            ),
                            verticalSpacing(15.h),
                            GestureDetector(
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text(
                                  S().forgetPassword,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpacing(15.h),
             AppButton(
               backgroundColor: AppColors.error,
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.all(10.sp),
                              borderRadius: BorderRadius.circular(13.sp),
                              label: S().deleteAccount,
                              onPressed: () {
      
                              },
                            ),
      
                        verticalSpacing(10),
      
                      ],
                    ),
                  ),
                  verticalSpacing(10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
