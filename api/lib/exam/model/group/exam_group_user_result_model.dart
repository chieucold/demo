import 'package:api/exam/model/group/info_personal_user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../exam_index.dart';

part 'exam_group_user_result_model.g.dart';

@JsonSerializable(includeIfNull: true)
class ExamGroupUserResult {
  ExamGroupUserResult(
      {this.countForTab,
      this.listUserComplete,
      this.detailResultOfCurrentUser,
      this.status = 0,
      this.examTitle = '',
      this.groupId = 0,
      this.groupExamId = 0});

  @JsonKey(defaultValue: 0)
  int status;
  CountForTab? countForTab;
  ListUserComplete? listUserComplete;
  DetailResultOfCurrentUser? detailResultOfCurrentUser;
  @JsonKey(defaultValue: '')
  String examTitle;
  @JsonKey(defaultValue: 0)
  int groupExamId;
  @JsonKey(defaultValue: 0)
  int groupId;

  factory ExamGroupUserResult.fromJson(Map<String, dynamic> json) => _$ExamGroupUserResultFromJson(json);

  Map<String, dynamic> toJson() => _$ExamGroupUserResultToJson(this);
}

@JsonSerializable(includeIfNull: true)
class CountForTab {
  @JsonKey(defaultValue: 0)
  int AnswerEssay;
  @JsonKey(defaultValue: 0)
  int Correct;
  @JsonKey(defaultValue: 0)
  int Incorrect;

  CountForTab({this.AnswerEssay = 0, this.Correct = 0, this.Incorrect = 0});

  factory CountForTab.fromJson(Map<String, dynamic> json) => _$CountForTabFromJson(json);

  Map<String, dynamic> toJson() => _$CountForTabToJson(this);
}

@JsonSerializable(includeIfNull: true)
class DetailResultOfCurrentUser {
  DetailResultOfCurrentUser(
      {this.id = 0,
      this.avatar = '',
      this.fullName = '',
      this.rank = 0,
      this.mark = 0,
      this.duration = 0,
      this.createdDate,
      this.numberMemberInExam = 0,
      this.examName = '',
      this.examId = 0,
      this.userId = 0,
      this.examType = 0,
      this.status = 0,
      this.groupExamId = 0});

  int id;
  @JsonKey(defaultValue: 0)
  int status;
  @JsonKey(defaultValue: '')
  String avatar;
  @JsonKey(defaultValue: '')
  String fullName;
  @JsonKey(defaultValue: 0)
  int rank;
  @JsonKey(defaultValue: 0)
  double mark;
  @JsonKey(defaultValue: 0)
  int duration;
  DateTime? createdDate;
  @JsonKey(defaultValue: 0)
  int numberMemberInExam;
  @JsonKey(defaultValue: '')
  String examName;
  @JsonKey(defaultValue: 0)
  int examId;
  @JsonKey(defaultValue: 0)
  int userId;
  @JsonKey(defaultValue: 0)
  int examType;
  @JsonKey(defaultValue: 0)
  int groupExamId;

  factory DetailResultOfCurrentUser.fromJson(Map<String, dynamic> json) => _$DetailResultOfCurrentUserFromJson(json);

  Map<String, dynamic> toJson() => _$DetailResultOfCurrentUserToJson(this);
}

@JsonSerializable(includeIfNull: true)
class ListUserComplete {
  ListUserComplete({
    this.totalRows = 0,
    this.data = const <UserData>[],
  });

  @JsonKey(defaultValue: 0)
  int totalRows;
  List<UserData> data;

  factory ListUserComplete.fromJson(Map<String, dynamic> json) => _$ListUserCompleteFromJson(json);

  Map<String, dynamic> toJson() => _$ListUserCompleteToJson(this);
}

@JsonSerializable(includeIfNull: true)
class UserData {
  UserData(
      {this.id = 0,
      this.userId = 0,
      this.user,
      this.groupExamId = 0,
      this.examId = 0,
      this.status = 0,
      this.userExamResultId = 0,
      this.userExamResult,
      this.startDate,
      this.endDate,
      this.timeSubmitExam,
      this.isSubmitLate = false,
      this.createdBy = 0,
      this.createDate,
      this.assignedBy,
      this.indefiniteSubmit = false,
      this.isShowAnswerAfterFinish = false,
      this.allowSeeAnswerAfterComplete = false,
      this.mark = 0});

  @JsonKey(defaultValue: 0)
  int id;
  @JsonKey(defaultValue: 0)
  int userId;
  User? user;
  @JsonKey(defaultValue: 0)
  int groupExamId;
  @JsonKey(defaultValue: 0)
  int examId;
  @JsonKey(defaultValue: 0)
  int status;
  @JsonKey(defaultValue: 0)
  int userExamResultId;
  DetailResultOfCurrentUser? userExamResult;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? timeSubmitExam;
  @JsonKey(defaultValue: false)
  bool isSubmitLate;
  @JsonKey(defaultValue: 0)
  int createdBy;
  DateTime? createDate;
  AssignedBy? assignedBy;
  @JsonKey(defaultValue: false)
  bool indefiniteSubmit;
  @JsonKey(defaultValue: false)
  bool isShowAnswerAfterFinish;
  @JsonKey(defaultValue: 0)
  double mark;
  @JsonKey(defaultValue: false)
  bool allowSeeAnswerAfterComplete;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
