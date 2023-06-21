import 'package:json_annotation/json_annotation.dart';

part 'group_exam_user_result_model.g.dart';

@JsonSerializable(includeIfNull: true)
class GroupExamUserResultModel {
  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: 0)
  int status;

  @JsonKey(defaultValue: 0)
  int duration;

  @JsonKey(defaultValue: 0)
  double mark;

  @JsonKey(defaultValue: 0)
  int createdBy;

  @JsonKey(defaultValue: "")
  String note;

  @JsonKey(defaultValue: 0)
  int examId;

  @JsonKey(defaultValue: 0)
  int userExamResultId;

  GroupExamUserResultModel({
    this.status = 0,
    this.duration = 0,
    this.mark = 0,
    this.createdBy = 0,
    this.note = "",
    this.id = 0,
    this.examId = 0,
    this.userExamResultId = 0,
  });

  factory GroupExamUserResultModel.fromJson(Map<String, dynamic> json) => _$GroupExamUserResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupExamUserResultModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class GroupExamUserResultRequestModel {
  @JsonKey(defaultValue: 0)
  int groupExamId;

  @JsonKey(defaultValue: 0)
  int userId;
  GroupExamUserResultRequestModel({this.groupExamId = 0, this.userId = 0});

  factory GroupExamUserResultRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GroupExamUserResultRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupExamUserResultRequestModelToJson(this);
}
