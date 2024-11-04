import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart'; 
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logistic_app/core/services/dio_factory.dart';

final GetIt getIt = GetIt.instance;

setupService() async {

  // await dotenv.load(fileName: '.env');

  // Initialize notifications
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic notifications',
      defaultColor: Colors.red,
      ledColor: Colors.white,
    ),
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group', channelGroupName: 'basic Name')
  ]);

  bool isNotificationAllowed =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isNotificationAllowed) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  // Initialize Firebase

  // await FirebaseMessaging.instance.setAutoInitEnabled(true);

  // Set up foreground message handling
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   String title = message.notification?.title?.tr() ?? 'Default Title'.tr();
  //   String body = message.notification?.body?.tr() ?? 'Default Body'.tr();
  //   print("dat is ss ${message.data}");
  //   NotificationServices.showNotification(
  //     title: title,
  //     body: body,
  //     payload:
  //         message.data.map((key, value) => MapEntry(key, value.toString())),
  //   );
    // AwesomeNotifications().createNotification(
    //   content: NotificationContent(
    //     id: message.hashCode,
    //     channelKey: 'basic_channel',
    //     title: title,
    //     body: body,
    //   ),
    // );
  // });

  // Handle background and terminated notifications
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   String? route = message.data['screen'];
  //   debugPrint('route: $route');

  //   // Use the global navigator to push the screen
  //   // navigatorKey.currentState?.pushNamed(route!);

  //   debugPrint('receivedNotification $route');
  // });

  await EasyLocalization.ensureInitialized();
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic notifications',
      defaultColor: Colors.red,
      ledColor: Colors.white,
    ),
  ], channelGroups: [
    NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group', channelGroupName: 'basic Name')
  ]);
  bool isNotifcationAllowed =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isNotifcationAllowed) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }
// HIVE
  await Hive.initFlutter();
  Hive.openBox('settings');


  // API service
  Dio dio = DioFactory.getDio();

// AUTH
 
}
