import 'package:json_annotation/json_annotation.dart';

import 'system_index.dart';

part 'group_requests_model.g.dart';

@JsonSerializable(includeIfNull: true)
class GroupRequestModel {
  GroupRequestModel(
      {this.groupId = 0,
      this.createdDate,
      this.userInGroups = const <CommonUserModel>[],
      this.countUser = 0,
      this.groupName = "",
      this.avatar = ""});

  @JsonKey(defaultValue: 0)
  int groupId;

  DateTime? createdDate;

  @JsonKey(defaultValue: <CommonUserModel>[])
  List<CommonUserModel> userInGroups;

  @JsonKey(defaultValue: 0)
  int countUser;

  @JsonKey(defaultValue: "")
  String groupName;

  @JsonKey(defaultValue: "")
  String avatar;

  factory GroupRequestModel.fromJson(Map<String, dynamic> json) => _$GroupRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupRequestModelToJson(this);
}
