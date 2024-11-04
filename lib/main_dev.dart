import 'package:eshop/app.dart';
import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/network/api_service.dart';
import 'package:eshop/core/shared_preferences/my_shared.dart';
import 'package:eshop/myy_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fcm.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize SharedPreferences and Dio
  await MyShared.init();


  // Initialize ApiService
  ApiService.init();


  // Initialize GetIt
  setupGetIt();


  // Set up the Bloc observer
  Bloc.observer = MyBlocObserver();

  // Initialize FCMh
  initFCM();

  // Run the app
  runApp(MyApp());

}
