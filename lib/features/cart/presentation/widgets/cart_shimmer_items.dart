import 'package:eshop/core/utils/spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

shimmerButton(){
  return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade300,
      child:     Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.r)

        ),
        height: 50.h,
        width: 337.w,
      ),
  );
}


shimmerSubPrice(){
  Column(
    children: [
      verticalSpacing(10),
      Shimmer.fromColors(
        baseColor: Colors.grey.shade100,
        highlightColor: Colors.grey.shade300,
        child:     Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.r)

          ),
          height: 3.h,
          width: 337.w,
        ),
      ),
      verticalSpacing(10),
      Shimmer.fromColors(
        baseColor: Colors.grey.shade100,
        highlightColor: Colors.grey.shade300,
        child:     Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10.r)

          ),
          height: 3.h,
          width: 337.w,
        ),
      ),
      verticalSpacing(10),

    ],
  );
}