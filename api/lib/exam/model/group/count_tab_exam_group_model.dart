
import 'package:json_annotation/json_annotation.dart';
part 'count_tab_exam_group_model.g.dart';
@JsonSerializable(includeIfNull: true)
class CountTabExamGroupModel{
  @JsonKey(defaultValue: 0)
  int Wait;
  @JsonKey(defaultValue: 0)
  int DidTheHomework;
  @JsonKey(defaultValue: 0)
  int Scored;

  CountTabExamGroupModel({this.Wait=0, this.DidTheHomework=0, this.Scored=0});

  factory CountTabExamGroupModel.fromJson(Map<String, dynamic> json) =>
      _$CountTabExamGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountTabExamGroupModelToJson(this);
}