import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:core/common/core_module.dart';
import 'package:core/components/bnd_message.dart';
import 'package:core/language/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/service/button_notification_model.dart';
import 'package:vitan_edu/core/service/notification_const.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_prompt/bloc/vhs_prompt_bloc.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_prompt/views/widgets/vhs_prompt_widget.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

class AwesomeNotificationService {
  AwesomeNotificationService();
  bool _hasNoti = false;
  List<ButtonNotificationModel> lsNotificationButon = [
    ButtonNotificationModel(key: 'disagree', lable: 'Không đồng ý'),
    ButtonNotificationModel(key: 'agree', lable: 'Đồng ý'),
  ];

  Future<void> initializeNoticationApp() async {
    // await requestPermision(context);
    final token = await FirebaseMessaging.instance.getToken();
    print('Notification token: $token');

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _showScreensByMessage(initialMessage);
    }
    await requestPermision(navigatorKey!.currentState!.context);
    await _initializeNotification();
    // await _onBackgroundMessage();
    await _onMessageOpenedApp();
    await _onMessage();
    await _onClickButtonNotification();
    // await _onBackgroundMessage();
  }

  // Future<void> _onBackgroundMessage() async {
  //   FirebaseMessaging.onBackgroundMessage((message) async {
  //     if (message.notification == null) {
  //       createNotification(message: message);
  //     }
  //     print("Handling a background message: ${message.messageId}");
  //   });
  // }

  Future<void> _onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // logger.d(message.notification?.body);
      _hasNoti = true;
      createNotification(message: message);
    });
  }

  List<NotificationActionButton> _buildListActionButtons() {
    return List<NotificationActionButton>.generate(
      lsNotificationButon.length,
      (index) {
        final item = lsNotificationButon[index];
        return _createNotificationActionButton(
          key: item.key,
          label: item.lable,
        );
      },
    );
  }

  Future<void> _onMessageOpenedApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(message.toString());
      onSelectNotification(jsonEncode(message.data));
    });
  }

  Future<void> requestPermision(BuildContext context) async {
    await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
  }

  Future<void> _showScreensByMessage(RemoteMessage message) async {
    try {
      final data = message.data;
    } catch (e) {
      log('Exception : $e');
    }
  }

  Future<void> _initializeNotification() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/ic_stat_notification_default',
      [
        NotificationChannel(
          channelDescription: 'BnD VitanEdu',
          channelName: 'BnD Tech',
          channelKey: NotificationConst.channelKey,
          defaultColor: Colors.red,
          importance: NotificationImportance.High,
          channelShowBadge: true,
          enableLights: true,
          enableVibration: true,
          playSound: true,
        ),
      ],
    );
  }

  Future<void> createNotification({required RemoteMessage message}) async {
    message;
    late String _body, _title;
    bool _isPrompt = false;
    if (message.data.isNotEmpty) {
      if (message.data["data"] != null) {
        _isPrompt = jsonDecode(message.data["data"])["type"] == "prompt" ? true : false;
      }
      _title = !_isPrompt
          ? (jsonDecode(message.data["data"])['ObjectTitle'] ?? 'Thông báo')
          : 'Có phải bạn đang cố gắng đăng nhập';
      _body = jsonDecode(message.data["data"])['Message'] ?? 'Xác nhận rằng chính bạn đang cố đăng nhập';
    }
    if (message.notification != null) {
      _body = message.notification!.body!;
      _title = message.notification!.title!;
    }

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        // color: kPrimaryVitanColor,
        id: Uuid().v4().hashCode,
        body: _body,
        title: _title,
        channelKey: NotificationConst.channelKey,
        // fullScreenIntent: true,
        // category: NotificationCategory.Message,
        payload: message.data.map((key, value) => MapEntry(key, value.toString())),
        bigPicture: !_isPrompt ? null : 'asset://assets/verification_2_step_img.png',
        notificationLayout: !_isPrompt ? NotificationLayout.Default : NotificationLayout.BigPicture,
      ),
      actionButtons: !_isPrompt ? null : _buildListActionButtons(),
    );
  }

  NotificationActionButton _createNotificationActionButton({required String key, required String label, String? icon}) {
    return NotificationActionButton(
      key: key,
      label: label,
      icon: icon,
      buttonType: ActionButtonType.Default,
      color: CustomTheme.supperAppThemeColor,
    );
  }

  Future<void> _onClickButtonNotification() async {
    AwesomeNotifications().actionStream.listen((action) async {
      // if (!_hasNoti) return;
      if (action.buttonKeyPressed == NotificationConst.keyButtonAgree) {
        await getItSuper<VHSPromptBloc>().acceptPromt(jsonDecode(action.payload!["data"]!)["data"]["Key"]);
        await AndroidForegroundService.stopForeground();
        print("Agree button is pressed");
      } else if (action.buttonKeyPressed == NotificationConst.keyButtonDisagree) {
        await AndroidForegroundService.stopForeground();
        print("Disagree button is pressed.");
      } else {
        if (action.payload?["data"] != null) {
          onSelectNotification(action.payload!["data"]);
        }
        await AndroidForegroundService.stopForeground();
      }
    });
  }

  Future<void> setForegroundNotificationPresentationOptions() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  Future<void> onSelectNotification(dynamic payload) async {
    // goToVHSPromptScreen(navigatorKey!.currentState!.context);
    // goToVHS6Personal(navigatorKey!.currentState!.context);
    final data = jsonDecode(payload);
    // logger.d(response.toString());
    // var data = jsonDecode(response["data"]);
    if (data == null) return;
    if (data["data"] != null) {
      final PromptModel _data = PromptModel.fromJson(data["data"]);
      goToVHSPromptScreen(navigatorKey!.currentState!.context, _data);
    } else {
      notificationRouteGoTo(data['ObjectType'].toString(), navigatorKey!.currentState!.context,
          data['Action'].toString(), int.parse(data['BlockId']),
          objectId: int.tryParse(data['ObjectId'].toString()));
    }

    return;
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (!GetIt.I.isRegistered<AwesomeNotificationService>()) configureInjection();

  await Firebase.initializeApp();
  final AwesomeNotificationService awsome = getItSuper();
  if (message.notification == null) {
    await awsome.createNotification(message: message);
  }
  print("Handling a background message: ${message.messageId}");
}
