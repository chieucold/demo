import 'package:api/api/exam_api.dart';
import 'package:api/system/model/common_user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_explain_model.g.dart';

@JsonSerializable()
class QuestionExplainModel {
  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: 0)
  int questionId;

  @JsonKey(defaultValue: "")
  String content;

  @JsonKey(defaultValue: 0)
  int status;

  @JsonKey(defaultValue: 0)
  int createdBy;

  DateTime? createdDate;

  @JsonKey(defaultValue: 0)
  int ownerType;

  SimpleUserEntity? user;

  @JsonKey(defaultValue: 0)
  int likeNumber;

  @JsonKey(defaultValue: 0)
  int dislikeNumber;

  bool? isLike;

  @JsonKey(defaultValue: "")
  String soundUrl;

  @JsonKey(defaultValue: false)
  bool isExplainOfMe;
  QuestionExplainModel({
    this.id = 0,
    this.questionId = 0,
    this.content = "",
    this.status = 0,
    this.createdBy = 0,
    this.createdDate,
    this.ownerType = 0,
    this.user,
    this.likeNumber = 0,
    this.dislikeNumber = 0,
    this.isLike = false,
    this.isExplainOfMe = false,
    this.soundUrl = ""
  });

  factory QuestionExplainModel.fromJson(Map<String, dynamic> json) => _$QuestionExplainModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionExplainModelToJson(this);
}
