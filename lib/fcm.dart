import 'package:eshop/core/utils/safe_print.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void initFCM() {
  try {
    initLocalNotifications();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      safePrint("FirebaseMessaging.onMessage");

      if (message.notification != null) {
        safePrint("FirebaseMessaging.onMessage 2");

        String title = message.notification!.title!;
        String body = message.notification!.body!;

        showNotification(title, body);
      }
    });

    FirebaseMessaging.onBackgroundMessage(fcmBackgroundMessages);

    FirebaseMessaging.instance.getToken().then(
          (value) {
        safePrint("FCM Token => $value");
      },
    );
  } catch (error) {
    safePrint(error);
  }
}

Future<void> fcmBackgroundMessages(RemoteMessage message) async {
  safePrint("fcmBackgroundMessages");

  if (message.notification == null) {
    return;
  }

  String title = message.notification!.title!;
  String body = message.notification!.body!;

  showNotification(
    title,
    body,
  );
}

void initLocalNotifications() async {
  // Request permissions for iOS
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
    alert: true,
    badge: true,
    sound: true,
  );

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  DarwinInitializationSettings initializationSettingsDarwin =
  DarwinInitializationSettings(
    onDidReceiveLocalNotification: (id, title, body, payload) {
    },
  );

  InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  if (await Permission.notification.request().isGranted) {
    safePrint("Android Notification Permission Granted");
  } else {
    safePrint("Android Notification Permission Denied");
  }
}

Future<void> showNotification(String title, String body) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'el-balad',
    'el-balad',
    channelDescription: 'el-balad notification channel',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    body.hashCode,
    title,
    body,
    platformChannelSpecifics,
  );
}
