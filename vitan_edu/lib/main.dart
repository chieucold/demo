import 'dart:async';
import 'dart:io';

import 'package:core/common/log/bnd_log.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:exam/core/common/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guide/core/common/injection.dart';
import 'package:learn/core/common/injection.dart';
import 'package:vitan_edu/certificate_app.dart';
import 'package:vitan_edu/features/presentation/app/view/bnd_app.dart';

import 'core/common/injection.dart';

void main() async {
  runZonedGuarded(() async {
    HttpOverrides.global = MyHttpOverrides();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    configureInjection();
    configureInjectionExam();
    configureGuideInjection(isRegistCoreModule: false);
    configureLearnInjection(isRegistCoreModule: false);
    await LocalStoreManager.init();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    //---------
    goApp();
  }, (Object error, StackTrace stack) async {
    if (kReleaseMode) getItSuper<BNDLog>().logError(error.toString());
    // logger.d(error);
    // if (error.toString().contains('SocketException: Connection failed') &&
    //     LocalStoreManager.getString(UserSettings.currentScreen) != retryViewPage) {
    //   showDisconnectInternet();
    // }
  });
}

void goApp() {
  runApp(BndApp());
  //runApp(DevicePreview(enabled: kDebugMode, builder: (context) => const BndApp()));
}
