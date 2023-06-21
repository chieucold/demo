import 'dart:async';

import 'package:api/exam/model/exam_index.dart';
import 'package:bloc/bloc.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/common.dart';
import 'package:core/common/core_module.dart';
import 'package:core/components/bnd_message.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:vitan_edu/features/domain/usecases/user/user_use_cases.dart';
import 'package:vitan_edu/features/presentation/app/bloc/app_state.dart';

@lazySingleton
class AppBloc extends Cubit<AppState> {
  final AppSettings _appSettings;

  AppBloc(this._appSettings)
      : super(AppStateInitial(appModel: AppModel(language: 'vi', theme: true, isBiometric: false)));

  String get language => LocalStoreManager.getString(UserSettings.language);

  bool get theme => LocalStoreManager.getBool(UserSettings.theme);

  bool get isBiometric => LocalStoreManager.getBool(UserSettings.isLoginBiometric);

  bool get isPassCode => LocalStoreManager.getString(UserSettings.keyPassCode).isNotEmpty;

  final StreamController<bool> verificationNotifier = StreamController<bool>.broadcast();

  void changeLanguage(String language) {
    emit(AppChangeState(appModel: AppModel(language: language)));
    LocalStoreManager.setString(UserSettings.language, language);
  }

  void changePassCode(String code) {
    if (isPassCode) {
      //  final String codeMd5 = Utils.generateMd5(code);
      //  final String localCode = LocalStoreManager.getString(UserSettings.keyPassCode);
      // if(codeMd5 == localCode){
      LocalStoreManager.setString(UserSettings.keyPassCode, '');
      LocalStoreManager.setInt(UserSettings.keyLockTime, 0);
      showSuccessMessage(AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('cancel_passscode_success'));
      Navigator.pop(navigatorKey!.currentState!.context);
      // }
    } else {
      LocalStoreManager.setString(UserSettings.keyPassCode, Utils.generateMd5(code));
      showSuccessMessage(AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('set_passcode_success'));
      Navigator.pop(navigatorKey!.currentState!.context);
    }
    emit(AppChangeState(appModel: state.appModel.copyWith(theme: isPassCode)));
  }

  void changeDurationLockScreen(int duration) {
    LocalStoreManager.setInt(UserSettings.keyLockTime, duration);
    emit(AppChangeState(appModel: state.appModel.copyWith(durationLockScreen: duration)));
  }

  void changeTheme(bool isLight) {
    emit(AppChangeState(appModel: state.appModel.copyWith(theme: isLight)));
    LocalStoreManager.setBool(UserSettings.theme, isLight);
  }

  void changeIsBiometric(bool isBiometric) {
    emit(AppChangeState(appModel: state.appModel.copyWith(isBiometric: isBiometric)));
    LocalStoreManager.setBool(UserSettings.isLoginBiometric, isBiometric);
  }

  void changeRefresh() {
    emit(AppChangeState(appModel: state.appModel.copyWith(isCountTime: true)));
  }

  void init() async {
    // await _appSettings.init();
    emit(AppChangeState(
        appModel: AppModel(
      isBiometric: isBiometric,
      language: language.isNotEmpty ? language : 'vi',
      theme: theme,
      isCountTime: true,
    )));
  }

// Future<int> getNotificationNotSeen() async {
//   int _countNotificationNotSeen = 0;
//   // final param = CountNotificationPublicFilterResource(blockIds: <int>[], status: 0);
//   // final Either<String, int> data = await _notificationUsecases.getNotificationNotSeen(param);
//   final Either<String, int> data = await _notificationUsecases.getNotificationNotSeen();
//   data.fold((String failure) => showErrorMessage(failure), (int data) {
//     _countNotificationNotSeen = data;
//   });
//   emit(AppChangeState(appModel: state.appModel.copyWith(countNotificationNotSeen: _countNotificationNotSeen)));
//   return _countNotificationNotSeen;
// }

// void markSeenNotification() {
//   int countNoti = 0;
//   if (state.appModel.countNotificationNotSeen > 0) {
//     countNoti = state.appModel.countNotificationNotSeen - 1;
//   }
//   emit(AppChangeState(
//       appModel: AppModel(
//     countNotificationNotSeen: countNoti,
//   )));
// }
}
