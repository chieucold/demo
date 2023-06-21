import 'package:core/common/common.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:signalr_core/signalr_core.dart';

class BNDSignalR {
  HubConnection? _connection;
  late int timeError = 0;

  HubConnection? get connection => _connection!;

  Future<void> initConnection({String? url}) async {
    if (_connection != null && _connection!.state == HubConnectionState.connected) return;
    try {
      _connection = HubConnectionBuilder()
          .withUrl(
              url ?? (kDebugMode ? ApiPath.signalrUrl : ApiPathRelease.signalrUrl),
              HttpConnectionOptions(
                logMessageContent: true,
                accessTokenFactory: () async {
                  return LocalStoreManager.getString(UserSettings.tokenUser);
                },
              ))
          .build();

      await _connection!.start();

      _connection!.onclose((_) {
        _connection!.start();
      });
      // _connection.onclose((Exception? exception) {
      //   _connection.start();
      // });
    } catch (ex) {
      print(ex);
      //await Future<void>.delayed(const Duration(seconds: 1)).then((_) => initConnection());
      if (timeError <= 2) {
        timeError++;
        await initConnection();
      } else {
        GetIt.I<BNDLog>().logError(ex.toString());
      }
    }
  }

  Future<void> addEvent<T>(String actionName, Object data) async {
    final List<Object> listEvent = <Object>[data];
    await _connection!.invoke(actionName, args: listEvent);
  }

  Future<void> stopConnection() async {
    if (_connection != null) await _connection!.stop();
  }
}
