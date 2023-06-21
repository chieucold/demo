import 'package:api/api/guide_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'disc_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DISCResultOutputResource {
  DISCResultOutputResource(
      {this.type, this.answers, this.testCategoryId = 0, this.id = 0, this.isDiffer = false, this.isLike = false});

  factory DISCResultOutputResource.fromJson(Map<String, dynamic> json) => _$DISCResultOutputResourceFromJson(json);

  @JsonKey(
      name: 'type', includeIfNull: true, toJson: discQuestionTypeEnumToJson, fromJson: discQuestionTypeEnumFromJson)
  DiscQuestionTypeEnum? type;
  @JsonKey(name: 'answers', includeIfNull: true, defaultValue: <DISCQuestionResource>[])
  List<DISCQuestionResource>? answers;
  @JsonKey(name: 'isLike', includeIfNull: true, defaultValue: false)
  bool isLike;
  @JsonKey(
    name: 'selectedAnswersDiff',
    includeIfNull: true,
  )
  AnswerDISCSelectResource? selectedAnswersDiff;
  @JsonKey(name: 'selectedAnswersLike', includeIfNull: true)
  AnswerDISCSelectResource? selectedAnswersLike;
  @JsonKey(name: 'isDiffer', includeIfNull: true, defaultValue: false)
  bool isDiffer;
  @JsonKey(name: 'testCategoryId', includeIfNull: true, defaultValue: 0)
  int testCategoryId;
  @JsonKey(name: 'id', includeIfNull: true, defaultValue: 0)
  int id;

  static const fromJsonFactory = _$DISCResultOutputResourceFromJson;
  static const toJsonFactory = _$DISCResultOutputResourceToJson;

  Map<String, dynamic> toJson() => _$DISCResultOutputResourceToJson(this);
}
