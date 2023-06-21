import 'package:api/api/exam_api.dart';
import 'package:api/exam/model/exam_index.dart';

class UserExamResultRepository {
  final ExamApi _examAPI;

  UserExamResultRepository(this._examAPI);

  Future<UserInfoExamResultPublicResource> getUserExamNumberTimeResult(UserExamResultRequest param) async {
    return await _examAPI.userExamResultGetUserExamNumberTimeResult(param.examId);
  }

  Future<UserExamResultPublicResource> getExamResultByUser(ExamSuccessRequest param) async {
    return await _examAPI.userExamResultGetExamResultByUser(param.examResultId,param.fromType);
  }
}
