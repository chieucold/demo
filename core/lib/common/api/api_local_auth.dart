import 'package:core/common/core_module.dart';
import 'package:core/common/permission/permission.dart';
import 'package:core/components/bnd_message.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static LocalAuthentication? _auth;
  final GlobalVariableResource _gl = GetIt.I<GlobalVariableResource>();

  LocalAuthApi() {
    _auth = LocalAuthentication();
  }

  final IOSAuthMessages iosStrings = IOSAuthMessages(
    cancelButton: AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('cancel_one'),
    goToSettingsButton: AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('setting'),
    goToSettingsDescription:
        AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('error_ios_setting_biometrics_des'),
    lockOut: AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('error_ios_lockout_biometrics_msg'),
  );
  final AndroidAuthMessages androidStrings = AndroidAuthMessages(
    biometricHint: "",
    biometricRequiredTitle:
        AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('authentication_required'),
    signInTitle: AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('authentication_required'),
    cancelButton: AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('cancel_one'),
    goToSettingsButton: AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('setting'),
    goToSettingsDescription:
        AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('error_android_setting_biometrics_des'),
    biometricNotRecognized:
        AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('error_android_biometrics_not_recognized'),
    biometricSuccess: AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('success'),
    deviceCredentialsRequiredTitle:
        AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('error_android_required_biometrics_title'),
    deviceCredentialsSetupDescription:
        AppLocalizations.of(navigatorKey!.currentState!.context)?.translate('error_android_required_biometrics_des'),
  );

  Future<bool> isBiometricAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _auth!.isDeviceSupported();
    } on PlatformException catch (e) {
      print(e);
    }
    isAvailable ? print('Biometric is available!') : print('Biometric is unavailable.');
    if (!isAvailable) {
      await _openSetting();
    }

    return isAvailable;
  }

  Future<void> _openSetting() async {
    await showConfirmDialog(
      navigatorKey!.currentState!.context,
      AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('error_ios_setting_biometrics_des'),
      onSubmit: () async {
        await _gl.setOpenFile(true);
        await onSettingsTap();
      },
    );
  }

  // static Future<List<BiometricType>> getBiometrics({VoidCallback? onError}) async {
  //   try {
  //     return await _auth!.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     print(e);
  //     onError?.call();
  //     return <BiometricType>[];
  //   }
  // }

  Future<List<BiometricType>> getListOfBiometricTypes({VoidCallback? onError,bool isOpenSetting =false}) async {
    List<BiometricType> listOfBiometrics = [];
    try {
      listOfBiometrics = await _auth!.getAvailableBiometrics();
      print(listOfBiometrics);
      if (listOfBiometrics.length == 0) {
        onError?.call();
      }
    } on PlatformException catch (e) {
      onError?.call();
    }
    if(listOfBiometrics.isEmpty && isOpenSetting)
    await _openSetting();
    return listOfBiometrics;
  }

  Future<bool> authenticateUser({VoidCallback? onHandler, VoidCallback? onError}) async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _auth!.authenticate(
        localizedReason:
            AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('please_verify_biometrics_msg'),
        useErrorDialogs: true,
        stickyAuth: true,
        biometricOnly: true,
        androidAuthStrings: androidStrings,
        iOSAuthStrings: iosStrings,
      );
    } on PlatformException catch (e) {
      showErrorMessage( AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('alert_verify_biometrics_ too_many_times'));
      isAuthenticated =false;
print('cuongv ${e.message}');
    }

    isAuthenticated ? print('User is authenticated!') : print('User is not authenticated.');
    if (isAuthenticated) {
      onHandler?.call();
    } else {
      onError?.call();
    }
    await _gl.setOpenFile(false);
    return isAuthenticated;
  }
}
