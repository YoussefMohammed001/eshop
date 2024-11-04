import 'package:eshop/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreInfoScreen extends StatelessWidget {
  const StoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return      Column(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              margin: EdgeInsets.only(
                  bottom: 20.sp
              ),
              child: AppImage(
                imageUrl: "https://images.unsplash.com/photo-1472851294608-062f824d29cc?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3RvcmUlMjBjb2VyfGVufDB8fDB8fHww",
                width: 368.w,
                height: 137.h,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            Positioned(
              left: 25.sp,
              child: Column(
                children: [
                  AppImage(
                    imageUrl: "https://media.istockphoto.com/id/1086409454/photo/large-window-storefront-with-green-and-white-paint.webp?a=1&b=1&s=612x612&w=0&k=20&c=1aVmG48otQVmoXZB-alCZxJ4XwStjvoDwTKX3Hhyffk=",
                    width: 60.w,
                    height: 60.h,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}