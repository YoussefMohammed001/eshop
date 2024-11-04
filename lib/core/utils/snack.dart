
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

snackBar(BuildContext context,message,Color color){
  final snackBar = SnackBar(
    backgroundColor: color,
    duration: const Duration(seconds: 1),
    content:  Center(child: Text(message,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),)),

  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}