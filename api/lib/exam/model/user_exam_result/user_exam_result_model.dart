import 'package:api/exam/model/ranking/ranking_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_exam_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserExamResultModel {
  int id;
  String? avatar;
  String? fullName;
  List<RankingModel>? numberOfExamTimes;

  UserExamResultModel(
      {required this.id,
      required this.avatar,
      required this.fullName,
      this.numberOfExamTimes});

  factory UserExamResultModel.fromJson(Map<String, dynamic> json) =>
      _$UserExamResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserExamResultModelToJson(this);
}

@JsonSerializable()
class UserExamResultRequest {
  int examId;
  int userId;
  UserExamResultRequest(this.examId, this.userId) : super();

  factory UserExamResultRequest.fromJson(Map<String, dynamic> json) =>
      _$UserExamResultRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserExamResultRequestToJson(this);
}
