import 'package:json_annotation/json_annotation.dart';

part 'info_personal_user_model.g.dart';

@JsonSerializable(includeIfNull: true)
class InfoPersonalUserModel {
  InfoPersonalUserModel({required this.totalRows, required this.data});

  int totalRows;
  @JsonKey(defaultValue: <InfoUserModel>[])
  List<InfoUserModel>? data;

  factory InfoPersonalUserModel.fromJson(Map<String, dynamic> json) => _$InfoPersonalUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoPersonalUserModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class InfoUserModel {
  InfoUserModel(
      {this.userId,
      this.user,
      this.groupExamId,
      this.status,
      this.userExamResultId,
      required this.userExamResult,
      this.startDate,
      this.endDate,
      this.timeSubmitExam,
      this.isSubmitLate,
      this.createdBy,
      this.assignedBy,
      this.indefiniteSubmit,
      this.isShowAnswerAfterFinish,
      this.mark = 0});

  @JsonKey(defaultValue: null)
  int? userId;
  AssignedBy? user;
  @JsonKey(defaultValue: null)
  int? groupExamId;
  @JsonKey(defaultValue: null)
  int? status;
  @JsonKey(defaultValue: null)
  int? userExamResultId;
  @JsonKey(defaultValue: null)
  ExamOfUserResult? userExamResult;
  @JsonKey(defaultValue: null)
  DateTime? startDate;
  @JsonKey(defaultValue: null)
  DateTime? endDate;
  @JsonKey(defaultValue: null)
  DateTime? timeSubmitExam;
  @JsonKey(defaultValue: null)
  bool? isSubmitLate;
  @JsonKey(defaultValue: null)
  int? createdBy;
  @JsonKey(defaultValue: null)
  AssignedBy? assignedBy;
  @JsonKey(defaultValue: null)
  bool? indefiniteSubmit;
  @JsonKey(defaultValue: null)
  bool? isShowAnswerAfterFinish;
  @JsonKey(defaultValue: 0)
  double mark;

  factory InfoUserModel.fromJson(Map<String, dynamic> json) => _$InfoUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoUserModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class AssignedBy {
  AssignedBy({
    this.id = 0,
    this.username = '',
    this.firstName = '',
    this.lastName = '',
    this.fullName = '',
    this.avatar = '',
  });

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: "")
  String username;

  @JsonKey(defaultValue: "")
  String firstName;

  @JsonKey(defaultValue: "")
  String lastName;

  @JsonKey(defaultValue: "")
  String fullName;

  @JsonKey(defaultValue: "")
  String avatar;

  factory AssignedBy.fromJson(Map<String, dynamic> json) => _$AssignedByFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedByToJson(this);
}

@JsonSerializable(includeIfNull: true)
class ExamOfUserResult {
  ExamOfUserResult({
    this.id = 0,
    this.avatar = "",
    this.fullName = "",
    this.rank = 0,
    this.mark = 0.0,
    this.duration,
    this.createdDate,
    this.numberMemberInExam = 0,
    this.examName = "",
    this.examId = 0,
  });

  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: "")
  String avatar;
  @JsonKey(defaultValue: "")
  String fullName;
  @JsonKey(defaultValue: 0)
  int rank;
  @JsonKey(defaultValue: 0)
  double mark;
  @JsonKey(defaultValue: 0)
  int? duration;

  DateTime? createdDate;

  @JsonKey(defaultValue: 0)
  int numberMemberInExam;

  @JsonKey(defaultValue: "")
  String examName;

  @JsonKey(defaultValue: 0)
  int examId;

  factory ExamOfUserResult.fromJson(Map<String, dynamic> json) => _$ExamOfUserResultFromJson(json);

  Map<String, dynamic> toJson() => _$ExamOfUserResultToJson(this);
}
@JsonSerializable()
class AchievementMemberRequest {
  DateTime? startDate;
  DateTime? endDate;
  int? userId;
  int? groupId;

  AchievementMemberRequest(
      {this.startDate, this.endDate, this.groupId, this.userId});

  factory AchievementMemberRequest.fromJson(Map<String, dynamic> json) =>
      _$AchievementMemberRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementMemberRequestToJson(this);
}
