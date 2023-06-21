import 'package:json_annotation/json_annotation.dart';

part 'invite_user_request.g.dart';

@JsonSerializable()
class InviteUserRequest {
  int userId;
  int eventId;

  InviteUserRequest(this.userId, this.eventId);

  factory InviteUserRequest.fromJson(Map<String, dynamic> json) => _$InviteUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InviteUserRequestToJson(this);
}