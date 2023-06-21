import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/app_settings/app_settings_entity.dart';
import 'package:core/common/connectivity/connectivity_core.dart';
import 'package:get_it/get_it.dart';

class AppSettings {
  final CommondataApi _commonData;

  AppSettings(this._commonData);

  ConnectivityCore _connectivityCore = GetIt.I<ConnectivityCore>();

  AppSettingsEntity appSettings = AppSettingsEntity(configs: Configs());

  // final _inAppReview = InAppReview.instance;

  AppSettingsEntity get getAppSettings {
    return appSettings;
  }

  Configs get configs {
    return appSettings.configs;
  }

  Future<void> init() async {
    await _connectivityCore.checkConnect().then((bool connected) async {
      if (connected) {
        appSettings = await _commonData.appSettingInit(0, false);
      }
    });
    _connectivityCore.connectivityStream.listen((bool event) async {
      if (event && appSettings.configs.appVersion.isEmpty) {
        appSettings = await _commonData.appSettingInit(0, false);
      }
    });
  }
}
