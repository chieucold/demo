import 'dart:convert';

import 'package:core/common/core_module.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

@injectable
class NotificationManager {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    final RemoteMessage? initialMessage = await messaging.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      await _handleMessage(initialMessage);
    }
    await initialNotification();
    // await initNotification();
    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      logger.d('onMessageOpenedApp');
      if (message.notification != null) {
        await onSelectNotification(jsonEncode(message.data));
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logger.d('onMessage');
      _handleMessage(message);
    });
    // messaging.getToken().then((value) {
    //   log('FCM TOKEN : ${value}');
    // });
    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  void onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    //
  }

  Future<void> initialNotification() async {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    // final AndroidInitializationSettings initializationSettingsAndroid =
    //     const AndroidInitializationSettings(
    //         '@drawable/ic_stat_notification_default');
    // final DarwinInitializationSettings initializationSettingsDarwin =
    //     DarwinInitializationSettings(
    //         onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    // final InitializationSettings initializationSettings =
    //     InitializationSettings(
    //   android: initializationSettingsAndroid,
    //   iOS: initializationSettingsDarwin,
    // );
    // flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onDidReceiveNotificationResponse: (NotificationResponse data) {});
  }

  // Future<void> initNotification() async {
  //   final AndroidInitializationSettings initializationSettingsAndroid =
  //       const AndroidInitializationSettings(
  //           '@drawable/ic_stat_notification_default');

  //   final IOSInitializationSettings initializationSettingsIOS =
  //       const IOSInitializationSettings();

  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(
  //           android: initializationSettingsAndroid,
  //           iOS: initializationSettingsIOS);

  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification: (String? payload) =>
  //           onSelectNotification(payload ?? ''));
  // }

  Future<void> _handleMessage(RemoteMessage message) async {
    final RemoteNotification? notification = message.notification;

    // final AndroidNotification? android = message.notification?.android;
    if (notification != null) {
      await _showNotification(message);
    }
  }

  Future<void> _showNotification(RemoteMessage message) async {
    final RemoteNotification? remoteNotification = message.notification;
    // NotificationDetails platformChannelSpecifics = NotificationDetails(
    //     android: AndroidNotificationDetails(
    //         'your channel id', 'your channel name',
    //         enableVibration: true,
    //         fullScreenIntent: true,
    //         priority: Priority.high,
    //         importance: Importance.max,
    //         autoCancel: true));
    // await flutterLocalNotificationsPlugin.show(0, remoteNotification!.title,
    //     remoteNotification.body, platformChannelSpecifics,
    //     payload: jsonEncode(message.data));
  }

  Future<void> onSelectNotification(String payload) async {
    final response = jsonDecode(payload);
    // if (!isNotCurrentScreen(vhs5HomeSupperAppRouteName)) {
    //   await LocalStoreManager.setCurrentScreen(vhe8HomeScreenRouteName);
    //   navigatorKey!.currentState!.pushNamed(vhe8HomeScreenRouteName);
    // }

    // if (ModalRoute.of(navigatorKey!.currentState!.context) != null &&
    //     ModalRoute.of(navigatorKey!.currentState!.context)!.settings.name != vhs5HomeSupperAppRouteName) {
    //   await LocalStoreManager.setCurrentScreen(vhe8HomeScreenRouteName);
    //   navigatorKey!.currentState!.pushNamed(vhe8HomeScreenRouteName);
    // }
    logger.d(response.toString());
    var data = jsonDecode(response["data"]);
    notificationRouteGoTo(data['ObjectType'].toString(), navigatorKey!.currentState!.context, data['Action'].toString(),
        int.parse(data['BlockId']),
        objectId: int.tryParse(data['ObjectId'].toString()));
    return;
  }
}
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   logger.d("Handling a background message: ${message.data}");
// }
