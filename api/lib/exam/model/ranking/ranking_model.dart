import 'package:core/model/paging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class RankingModel {
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
  int duration;
  DateTime? createdDate;
  int? numberMemberInExam;
  String? examName;

  RankingModel({
    required this.id,
    this.avatar = "",
    this.fullName = "",
    required this.rank,
    required this.mark,
    this.createdDate,
    required this.duration,
    this.examName,
    this.numberMemberInExam,
  });

  factory RankingModel.fromJson(Map<String, dynamic> json) => _$RankingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RankingModelToJson(this);
}