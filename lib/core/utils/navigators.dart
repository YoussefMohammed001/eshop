import 'package:flutter/material.dart';


Future pushNamed(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) async {
  return await Navigator.pushNamed(context, routeName, arguments: arguments);
}

void pushNamedAndRemoveUntil(
  context,
  routeName, {
  Object? arguments,
}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    (route) => false,
    arguments: arguments,
  );
}

Future pop(context, [dynamic result])async {
  Navigator.pop(context, result);
}
