import 'package:flutter/material.dart';

Future showLoadingDialog({required BuildContext context}) {
  return showDialog(context: context, builder: (context) => AlertDialog(content: const CircularProgressIndicator(),),);
}