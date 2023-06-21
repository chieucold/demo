import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:core/common/common.dart';
import 'package:core/common/core_module.dart';
import 'package:core/components/retry_view_widget.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';

class ConnectivityCore {
  late StreamSubscription<ConnectivityResult> streamSubscription;
  final StreamController<bool> _connectivityController = StreamController<bool>.broadcast();
  final Connectivity _connectivity = Connectivity();

  Stream<bool> get connectivityStream => _connectivityController.stream;

  Future<bool> checkConnect({bool isAddStream = false}) async {
    final ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if (isAddStream) _connectivityController.add(connectivityResult != ConnectivityResult.none);
    return connectivityResult != ConnectivityResult.none;
  }

  void handlerNetWorkChange() {
    streamSubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      final bool isConnected = result != ConnectivityResult.none;
      _connectivityController.add(isConnected);
    if (isConnected && LocalStoreManager.getString(UserSettings.currentScreen) == retryViewPage) {
        LocalStoreManager.setString(UserSettings.currentScreen, '');
        Navigator.pop(navigatorKey!.currentState!.context);
      }
      print('onConnectivityChanged $result');
    });
  }

  void disposeConnectivity() {
    _connectivityController.close();
  }
}

Future<void> showDisconnectInternet() async {
  if (LocalStoreManager.getString(UserSettings.currentScreen) == retryViewPage) return;
  await LocalStoreManager.setString(UserSettings.currentScreen, retryViewPage);
  await showGeneralDialog(
      context: navigatorKey!.currentState!.context,
      pageBuilder: (_, __, ___) {
        return const RetryAreaView();
      });
}
