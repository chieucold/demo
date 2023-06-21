import 'package:json_annotation/json_annotation.dart';

part 'exam_success_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class ExamSuccessModel {
  @JsonKey(name: "id", defaultValue: 0)
  int id;

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;

  @JsonKey(name: "fullName", defaultValue: "")
  String fullName;

  @JsonKey(name: "rank", defaultValue: 0)
  int rank;

  @JsonKey(name: "mark", defaultValue: 0)
  double mark;

  @JsonKey(name: "duration", defaultValue: 0)
  int duration;

  @JsonKey(name: "numberMemberInExam", defaultValue: 0)
  int numberMemberInExam;

  @JsonKey(name: "examName", defaultValue: "")
  String examName;

  @JsonKey(name: "examId", defaultValue: 0)
  int examId;

  @JsonKey(defaultValue: 0)
  int examType;

  ExamSuccessModel(this.id, this.avatar, this.fullName, this.rank, this.duration, this.numberMemberInExam,
      this.examName, this.mark, this.examId,
      {this.examType = 0});

  factory ExamSuccessModel.fromJson(Map<String, dynamic> json) => _$ExamSuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamSuccessModelToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class ExamSuccessRequest {
  int examResultId;

  @JsonKey(defaultValue: "")
  String examTitle;

  @JsonKey(defaultValue: 0)
  int examType;

  @JsonKey(defaultValue: 0)
  int fromType;

  ExamSuccessRequest({required this.examResultId, required this.examTitle, required this.examType, this.fromType = 0});

  factory ExamSuccessRequest.fromJson(Map<String, dynamic> json) => _$ExamSuccessRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExamSuccessRequestToJson(this);
}
