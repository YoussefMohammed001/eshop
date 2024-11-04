import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/core/utils/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreName extends StatelessWidget {
  const StoreName({super.key});

  @override
  Widget build(BuildContext context) {
    return            Container(
      margin: EdgeInsets.symmetric(horizontal: 30.sp,
          vertical: 20.sp
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text("Sore Sabhuh",style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500
            ),),
          ),
          verticalSpacing(15),
          Row(children: [
            AppSVG(assetName: "flag_sa",
              height: 20.h,
              width: 20.w,
            ),
            horizontalSpacing(10),
            Expanded(
              child: Text("Jeddah",style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,

              )),
            ),
            AppSVG(assetName: "star"),
            horizontalSpacing(5),
            Text("3.5",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],),
        ],
      ),
    );
  }
}
