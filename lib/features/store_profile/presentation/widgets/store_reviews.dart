import 'package:eshop/core/styles/colors.dart';
import 'package:eshop/core/utils/spacing.dart';
import 'package:eshop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreReviews extends StatelessWidget {
  const StoreReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
      margin: EdgeInsets.symmetric(horizontal: 30.sp,
      ),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${S().customerReviews} ( 17 )",style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500
          ),),
          verticalSpacing(10),
          ListView.builder(
            shrinkWrap: true,
            itemCount:3 ,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(
                vertical: 5.sp
              ),
              child: Row(
                children: [
                  Text("Positive"),
                  horizontalSpacing(10),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: 0.3,
                      minHeight: 7.sp,
                      borderRadius: BorderRadius.circular(10.r),
                      backgroundColor: AppColors.grey,
                      color: AppColors.gold,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
                  horizontalSpacing(10),
                  Text("100%"),
                ],
              ),
            );
          },)
        ],
      ),
    );
  }
}
