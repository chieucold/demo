import 'dart:async';
import 'dart:io';
import 'package:api/id/model/device_token_model.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/common.dart';
import 'package:core/common/core_module.dart';
import 'package:core/common/realtime/bnd_signalr.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:version/version.dart';
import 'package:vitan_edu/core/common/notification_manager.dart';
import 'package:vitan_edu/core/common/realtime.dart';
import 'package:vitan_edu/features/domain/usecases/user/user_use_cases.dart';
import 'package:vitan_edu/features/presentation/app/bloc/app_bloc.dart';
import 'package:vitan_edu/features/route/route_goto.dart';
import 'common_module.dart';
import 'package:core/components/notification/bloc/noti_count_bloc.dart';

class VitanUser {
  final AuthenticateApp _authenticateApp;
  final NotificationManager _notificationManager;
  final AppBloc _appBloc;
  final NotiCountBloc _notiCountBloc;
  final UserUseCases _userUseCases;
  Duration oneDecimal = const Duration(seconds: 1);
  final int _countTime = 1200;
  late int _newTime;
  late Timer _timer;
  VitanUser(this._authenticateApp, this._notificationManager, this._appBloc, this._userUseCases, this._notiCountBloc);

  Future<bool> refreshToken(BuildContext context) async {
    final bool isRefreshSuccess = await _authenticateApp.refreshToken();
    if (isRefreshSuccess) {
      await initApp(context);
      await LocalStoreManager.setCurrentScreen(vhs5HomeSupperAppRouteName);
    } else {
      goToVHS3LoginUser(context);
    }
    return true;
  }

  Future<void> gotoMain(BuildContext context, {bool isLogout = false}) async {
    // goToVHS2Onboarding(context);
    // goToVGE2CompleteExam(context, 1);
    // goToVHS3LoginUser(context);
    await AppLocalizations.of(context)!.dialogUpdateVersion();
    goToVHS5HomeSupperApp(context, isLogout: isLogout);
    // goToVCE2CompetitionListScreen(context);}

    // nếu pass qua bước refreshToken lúc vào app và login thì schedules refreshToken
    scheduleRefreshToken(context);
  }

  Future<void> initApp(BuildContext context) async {
    //await initRealtime(context);
    // call notification
    await _notiCountBloc.getNotiNotSee(blockId: BlockEnum.SupperApp.index);
    // set DeviceId notification
    await setToken();
    // goTo
    gotoMain(context);
  }

  Future<void> setTokenFireBase(String deviceId) async {
    if (LocalStoreManager.getString(UserSettings.tokenUser).isNotEmpty) {
      await _userUseCases.setUserMobileToken(
          TokenRequest(deviceToken: deviceId, os: Platform.isIOS ? 'ios' : 'android', createdDate: DateTime.now()));
    }
  }

  Future<void> setToken() async {
    await _notificationManager.messaging.getToken().then((String? deviceId) {
      logger.d(deviceId);
      // get DeviceToken
      if (deviceId != null) setTokenFireBase(deviceId);
    });
  }

  Future<void> logIn(BuildContext context, {bool isLogout = false}) async {
    // await _authenticateApp.authenticate(AppConfig.idAppName, AppConfig.idAppScopes).then((_) async {
    //   await _initApp(context);
    //   gotoMain(context, isLogout: isLogout);
    // });
    logger.d('goLogin');
    goToVHS3LoginUser(context);
    // await initApp(context);
  }

  Future<void> logOut(BuildContext context) async {
    showLoading();
    await setTokenFireBase('');
    GetIt.I<BNDSignalR>().stopConnection();
    await _authenticateApp.logOut(AppConfig.idAppName, AppConfig.idAppScopes).then(
      (_) async {
        GetIt.I<GlobalVariableResource>().isLogout = true;
        logger.d('logout');
        goToVHS3PasswordScreen(context, isLogout: true);
        // logIn(context,isLogout: true);
      },
    );
    hideLoading();
  }

  Future<void> scheduleRefreshToken(BuildContext context) async {
    logger.d('Init Schedule');
    _newTime = _countTime;
    _timer = Timer.periodic(oneDecimal, (Timer timer) async {
      if (_newTime == 0) {
        logger.d('refreshToken');
        await _checkRefreshToken(context);
        _timer.cancel();
      } else {
        _newTime = _newTime > 0 ? _newTime-- : _countTime;
      }
    });
  }

  Future<void> checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String _currentVersion = packageInfo.version;
    if (Version.parse(_currentVersion) < Version.parse(GetIt.I<AppSettings>().getAppSettings.configs.appVersion)) {
      showConfirmDialog(navigatorKey!.currentState!.context,
          AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('alert_update_app_new'),
          onSubmit: () => launchAppStore());
    }
  }

  /// Launches the Apple App Store or Google Play Store page for the app.
  void launchAppStore() async {
    final _appStoreURL = 'https://apps.apple.com/us/app/word-way-brain-letters-game/id1238419944';
    final _chPlayURL = 'https://play.google.com/store/apps/details?id=com.bndedu.vitanedu';
    final String appStoreLink = Platform.isIOS ? _appStoreURL : _chPlayURL;
    if (await canLaunch(appStoreLink)) {
      await launch(appStoreLink);
    } else {
      throw 'Could not launch appStoreLink';
    }
  }

  Future<void> _checkRefreshToken(BuildContext context) async {
    bool isRefresh = await _authenticateApp.refreshToken();
    if (isRefresh) {
      scheduleRefreshToken(context);
    } else {
      logIn(context);
    }
  }
}
