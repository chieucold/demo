import 'package:json_annotation/json_annotation.dart';
part 'profile_member_count_total_model.g.dart';

@JsonSerializable(includeIfNull: true)
class ProfileMemberCountTotalModel {
  @JsonKey(name: "totalGroup", defaultValue: 0)
  int totalGroup;

  @JsonKey(name: "exam", defaultValue: 0)
  int exam;

  @JsonKey(name: "competition", defaultValue: 0)
  int competition;

  @JsonKey(name: "name", defaultValue: '')
  String name;

  @JsonKey(name: "avatar", defaultValue: '')
  String avatar;

  ProfileMemberCountTotalModel({
    required this.totalGroup,
    required this.exam,
    required this.competition,
    required this.name,
    required this.avatar,
  });

  factory ProfileMemberCountTotalModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileMemberCountTotalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileMemberCountTotalModelToJson(this);
}
