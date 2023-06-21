import 'package:json_annotation/json_annotation.dart';

part 'invite_user_group_request.g.dart';

@JsonSerializable()
class InviteUserGroupRequest {
  int userId;
  int groupId;

  InviteUserGroupRequest(this.userId, this.groupId);

  factory InviteUserGroupRequest.fromJson(Map<String, dynamic> json) => _$InviteUserGroupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InviteUserGroupRequestToJson(this);
}
