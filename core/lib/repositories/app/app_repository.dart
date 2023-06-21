import 'package:api/api/exam_api.dart';

class AppRepository {
  final ExamApi _examApi;

  AppRepository(this._examApi);

  Future<String> getLink(int objectType, int objectId) async {
    return _examApi.appSettingGetLink(objectType, objectId);
  }
}
