// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'count_tab_event_model.g.dart';

@JsonSerializable()
class CountTabEventModel {
  @JsonKey(defaultValue: 0)
  int ComingSoon;

  @JsonKey(defaultValue: 0)
  int Past;

  @JsonKey(defaultValue: 0)
  int GoingOn;

  @JsonKey(defaultValue: 0)
  int Join;

  @JsonKey(defaultValue: 0)
  int Invite;

  CountTabEventModel({
    this.ComingSoon = 0,
    this.Past = 0,
    this.GoingOn = 0,
    this.Join = 0,
    this.Invite = 0,
  });

  factory CountTabEventModel.fromJson(Map<String, dynamic> json) => _$CountTabEventModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountTabEventModelToJson(this);
}
