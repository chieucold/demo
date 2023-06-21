import 'package:json_annotation/json_annotation.dart';
part 'count_tab_group_admin_model.g.dart';
@JsonSerializable()
class CountTabGroupAdminModel {
  CountTabGroupAdminModel({
    this.doing=0,
    this.expired=0,
  });

  @JsonKey(defaultValue: 0)
  int doing;
  @JsonKey(defaultValue: 0)
  int expired;

  factory CountTabGroupAdminModel.fromJson(Map<String, dynamic> json) => _$CountTabGroupAdminModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountTabGroupAdminModelToJson(this);
}
