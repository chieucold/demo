import 'package:json_annotation/json_annotation.dart';

part 'question_explain_save_model.g.dart';

@JsonSerializable(includeIfNull: true)
class QuestionExplainSaveModel {
  QuestionExplainSaveModel({
    required this.id,
    required this.questionId,
    required this.content,
    this.status,
    this.ownerType,
  });

  final int id;
  final int questionId;
  final String content;
  final int? status;
  final int? ownerType;

  factory QuestionExplainSaveModel.fromJson(Map<String, dynamic> json) => _$QuestionExplainSaveModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionExplainSaveModelToJson(this);
}
