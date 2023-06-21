import 'dart:async';

import 'package:core/assets/images/images.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/common.dart';
import 'package:core/common/connectivity/connectivity_core.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/dialog/bnd_general_dialog.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/common/notification_manager.dart';
import 'package:vitan_edu/core/common/vitan_user.dart';
import 'package:vitan_edu/core/service/awsome_notification_service.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/theme/vhs_color.dart';
import 'package:vitan_edu/features/presentation/app/bloc/app_bloc.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

class AppInitScreen extends StatefulWidget {
  AppInitScreen({Key? key}) : super(key: key);

  @override
  _AppInitScreenState createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  bool checkAnimation = true;
  int secondsAnimation = 1;
  final VitanUser _vitanUser = getItSuper();
  final AppBloc _appBloc = getItSuper();
  final AuthenticateApp _authenticateApp = getItSuper();
  final NotificationManager _notificationManager = getItSuper();
  final ConnectivityCore _connectivityCore = getItSuper();
  final AwesomeNotificationService awesomeNotificationService = getItSuper();

  @override
  void initState() {
    super.initState();
    commonInit();

    if (_appBloc.isPassCode) {
      _checkPassCode(onSuccess: initApp);
    } else {
      initApp();
    }
    // init notification service
    Future<void>.delayed(Duration(seconds: secondsAnimation), () {});

    // _notificationManager.setupInteractedMessage();
  }

  void initApp() async {
    _connectivityCore.checkConnect().then((statusConnected) {
      if (!statusConnected) {
        showDisconnectInternet();
      } else {
        // cần check connect để bắn stream
        _checkLogin();
      }
    });
    _connectivityCore.connectivityStream.listen((event) {
      if (event) _checkLogin();
    });
  }

  void _checkPassCode({required Function onSuccess}) {
    showLockScreen(context, streamController: _appBloc.verificationNotifier, onComplete: (String text) => onSuccess());
  }

  Future<void> _checkLogin() async {
    try {
      // final bool _isLogin = _authenticateApp.isLogin && !LocalStoreManager.getBool(UserSettings.isLoginBiometric);
      // if (_isLogin) {
      //   _initApp();
      // } else {
        if (LocalStoreManager.getString(UserSettings.refreshToken).isNullOrEmpty) {
          goToVHS3LoginUser(context);
        } else {
          _initApp();
        // }
      }
    } catch (e) {}
  }

  void commonInit() async {
    // khởi tạo loading
    Loading.configLoading();
    // await awesomeNotificationService.initializeNoticationApp();
    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  Future<void> _initApp() async {
    // check RefreshToken
    await _authenticateApp.updateUserInfo();
    await _vitanUser.refreshToken(context);
    //
  }

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(Duration(seconds: secondsAnimation), () {
      if (checkAnimation) {
        setState(() {
          checkAnimation = !checkAnimation;
        });
      }
    });
    return Scaffold(
      body: buildBody(secondsAnimation: secondsAnimation, checkAnimation: checkAnimation),
    );
  }
}

class buildBody extends StatelessWidget {
  final bool checkAnimation;
  final int secondsAnimation;

  buildBody({Key? key, required this.checkAnimation, required this.secondsAnimation}) : super(key: key);
  final AppSettings appSettings = getItSuper();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: VHSColor.vhs1BackGroundColor,
              // borderRadius: const BorderRadius.only(bottomRight: Radius.circular(80)),
              gradient: CustomTheme.primarySupperAppLinearGradient,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                // Expanded(
                //   child: Container(
                //     padding: EdgeInsetsDirectional.only(top: 48.sp, start: 60.sp, end: 60.sp),
                //     child: AnimatedOpacity(
                //         opacity: (checkAnimation) ? 0 : 1,
                //         duration: Duration(seconds: secondsAnimation),
                //         child: Text(
                //           // AppLocalizations.of(context)!.translate("app_init_title"),
                //           appSettings.configs.bndCompanyName,
                //           textAlign: TextAlign.center,
                //           style: textStyleBodyDefault.copyWith(color: CustomTheme.white.withOpacity(0.8)),
                //         )),
                //   ),
                //   flex: 1,
                // ),
                Center(
                  child: Container(
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(bottom: 50.sp),
                      height: (checkAnimation) ? 100 : 49.sp,
                      width: (checkAnimation) ? 100 : 216.sp,
                      child: Images.svgAssets(Images.icLogoHome),
                      duration: Duration(seconds: secondsAnimation),
                    ),
                  ),
                ),
                // Expanded(
                //   child: AnimatedContainer(
                //     duration: Duration(seconds: secondsAnimation),
                //     alignment: (checkAnimation) ? AlignmentDirectional.bottomCenter : AlignmentDirectional.topCenter,
                //     height: (checkAnimation) ? 50 : 150,
                //     child: BNDImage(
                //       imageUrl: Images.background_image,
                //       color: CustomTheme.white.withOpacity(0.2),
                //       package: 'core',
                //     ),
                //   ),
                //   flex: 1,
                // ),
                BNDImage(
                  imageUrl: Images.background_image_splash,
                  // color: CustomTheme.white.withOpacity(0.2),
                  package: 'core',
                  height: 196.sp,
                ),
              ],
            ),
          ),
          flex: 8,
        ),
        // Expanded(
        //   child: Center(
        //     child: Text(
        //       appSettings.configs.bndCompanyTitle,
        //       style: textStyleBodyDefault.copyWith(color: CustomTheme.textColor2),
        //     ),
        //   ),
        //   flex: 1,
        // )
      ],
    );
  }
}
