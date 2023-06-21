import 'package:api/api/commondata_api.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ObjectRepository {
  final CommondataApi _commonDataAPI;
  ObjectRepository(this._commonDataAPI);

  Future<SystemObjectResourceFilterResult> systemObjectGetList(SystemObjectFilterResource param) async {
    return await _commonDataAPI.systemObjectGetList(param);
  }
}
