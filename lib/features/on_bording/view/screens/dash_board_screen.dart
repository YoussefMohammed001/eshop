import 'package:eshop/core/routing/routes.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/shared_preferences/my_shared_keys.dart';
import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/widgets/app_button.dart';
import 'package:eshop/core/widgets/app_logo.dart';
import 'package:eshop/features/on_bording/view/widgets/page_content.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage(
        //            currentIndex == 0 ?
        //            "assets/images/pngs/logo.png"
        //           :
        //               currentIndex == 1 ?
        //            "assets/images/pngs/logo.png"
        //           :
        //            "assets/images/pngs/logo.png"
        //           ,
        //         ),
        //       fit: BoxFit.fill
        //     )
        // ),
        child: Column(
          children: [
            verticalSpacing(50),
            // App logo
            AppLogo(),
            // Reduce the space taken by the PageView
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(

                ),
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  PageContent(
                      text: S().onBoard1,
                      controller: _controller),
                  PageContent(
                      text: S().onBoard2,
                      controller: _controller),
                  PageContent(

                      text: S().onBoard3,
                      controller: _controller),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      height: 50.h,
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 12.sp),
                      borderRadius: BorderRadius.circular(10.r),
                      backgroundColor: AppColors.darkGrey,
                      onPressed: () {
                        MyShared.putBoolean(key:    MySharedKeys.firstOpen, value: false).then((v){
                          pushNamedAndRemoveUntil(context, Routes.loginScreen);
                        });
                      },
                      label: S().skip,
                    ),
                  ),
                  horizontalSpacing(130),
                  Expanded(
                    child: AppButton(
                      margin: EdgeInsets.all(0),
                      height: 50.h,
                      borderRadius: BorderRadius.circular(10.r),
                      backgroundColor: AppColors.primary,
                      onPressed: () {
                        if (currentIndex == 2) {
                          MyShared.putBoolean(key:    MySharedKeys.firstOpen, value: false).then((v){
                            pushNamedAndRemoveUntil(context, Routes.loginScreen);
                          });
                        } else {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      label: S().next,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpacing(20),
          ],
        ),
      ),
    );
  }
}
