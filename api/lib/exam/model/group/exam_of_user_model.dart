import 'package:api/exam/model/group/info_personal_user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'group_index.dart';

part 'exam_of_user_model.g.dart';

@JsonSerializable(includeIfNull: true)
class ListExamOfUserModel {
  int totalRows;
  List<ExamOfUserModel> data;

  ListExamOfUserModel({this.totalRows = 0, this.data = const <ExamOfUserModel>[]});

  factory ListExamOfUserModel.fromJson(Map<String, dynamic> json) => _$ListExamOfUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListExamOfUserModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class ExamOfUserModel {
  ExamOfUserModel(
      {required this.userId,
      this.user,
      this.groupExamId = 0,
      this.status = 1,
      this.userExamResultId = 0,
      this.examId = 0,
      this.userExamResult,
      this.startDate,
      this.endDate,
      this.timeSubmitExam,
      this.isSubmitLate,
      this.createdBy,
      this.assignedBy,
      this.indefiniteSubmit,
      this.isShowAnswerAfterFinish,
      this.mark = 0,
      this.countUser = 0,
      this.note = ''});

  @JsonKey(defaultValue: 0)
  int userId;
  ExamUserModel? user;
  @JsonKey(defaultValue: 0)
  int groupExamId;
  @JsonKey(defaultValue: 0)
  int examId;
  @JsonKey(defaultValue: 1)
  int status;
  @JsonKey(defaultValue: 0)
  int userExamResultId;
  ExamOfUserResult? userExamResult;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? timeSubmitExam;
  @JsonKey(defaultValue: false)
  bool? isSubmitLate;
  @JsonKey(defaultValue: 0)
  int? createdBy;
  AssignedBy? assignedBy;
  @JsonKey(defaultValue: false)
  bool? indefiniteSubmit;
  @JsonKey(defaultValue: false)
  bool? isShowAnswerAfterFinish;
  @JsonKey(defaultValue: 0)
  int mark;
  @JsonKey(defaultValue: '')
  String note;
  @JsonKey(defaultValue: 0)
  int countUser;
  ExamUserModel? noteBy;

  factory ExamOfUserModel.fromJson(Map<String, dynamic> json) => _$ExamOfUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamOfUserModelToJson(this);
}

@JsonSerializable()
class ExamUserModel {
  ExamUserModel(
      {this.id,
      required this.username,
      required this.firstName,
      required this.lastName,
      required this.fullName,
      required this.avatar,
      this.isVerify = false});

  @JsonKey(defaultValue: null)
  int? id;
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
  @JsonKey(defaultValue: false)
  bool isVerify;

  factory ExamUserModel.fromJson(Map<String, dynamic> json) => _$ExamUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamUserModelToJson(this);
}
@JsonSerializable()
class HistoryOfUserRequest{
  int groupId;
  int pageSize;
  int pageIndex;

  HistoryOfUserRequest({required this.groupId, required this.pageSize, required this.pageIndex});

  factory HistoryOfUserRequest.fromJson(Map<String, dynamic> json) =>
      _$HistoryOfUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryOfUserRequestToJson(this);
}