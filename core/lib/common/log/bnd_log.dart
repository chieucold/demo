import 'package:api/api/commondata_api.dart';
import 'package:core/common/constants/const/const_index.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';

class BNDLog {
  final CommondataApi _commonDataApi;
  BNDLog(this._commonDataApi);

  void logError(String message) {
    _commonDataApi.logMobileLogError(_getCurrentScreen(), LogCreateResource(message: message));
  }

  void logInfo(String message) {
    _commonDataApi.logMobileLogInfo(_getCurrentScreen(), LogCreateResource(message: message));
  }

  String _getCurrentScreen() {
    return LocalStoreManager.getString(SharedPreferenceKey.currentScreen);
  }
}
