import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> internetAvailable() async {
  return await InternetConnectionChecker().hasConnection;
}

void splashCheckInternetConnection(BuildContext context) {
  InternetConnectionChecker().hasConnection.then((available) {
    if (!available) {
     // pushAndRemoveUntil(context, const NoInternetScreen());
    }
  });
}
