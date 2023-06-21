import 'package:api/common/model/common_index.dart';
import 'package:core/model/paging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_explain_list.g.dart';

@JsonSerializable(includeIfNull: true)
class QuestionExplainListModel {
  QuestionExplainListModel({
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
    this.isLike,
    this.isExplainOfMe = false,
  });

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

  UserModel? user;

  @JsonKey(defaultValue: 0)
  int likeNumber;

  @JsonKey(defaultValue: 0)
  int dislikeNumber;

  bool? isLike;

  @JsonKey(defaultValue: false)
  bool isExplainOfMe;

  factory QuestionExplainListModel.fromJson(Map<String, dynamic> json) => _$QuestionExplainListModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionExplainListModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class QuestionExplainListRequestModel extends PagingRequest {
  int questionId;
  QuestionExplainListRequestModel(this.questionId, int pageIndex, int pageSize) : super(pageIndex, pageSize);

  factory QuestionExplainListRequestModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionExplainListRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionExplainListRequestModelToJson(this);
}
