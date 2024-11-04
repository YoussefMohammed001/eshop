import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/core/utils/navigators.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.title, this.result = true});
  final String title;
  final bool result;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}







class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                pop(context).then((onValue) {
                  setState(() {});
                });
              },
              child: AppSVG(
                assetName: MyShared.getCurrentLanguage() == "en"
                    ? MyShared.getThemeMode() == ThemeMode.dark
                        ? "back_white"
                        : "back"
                    : MyShared.getThemeMode() == ThemeMode.dark
                        ? "forward_white"
                        : "forward",
                height: 20.h,
                width: 20.w,
              )),
          horizontalSpacing(10),
          Text(
            widget.title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}