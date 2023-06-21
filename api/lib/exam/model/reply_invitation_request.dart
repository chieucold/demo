import 'package:json_annotation/json_annotation.dart';

part 'reply_invitation_request.g.dart';

@JsonSerializable()
class ReplyInvitationRequest {
  int userId;
  int groupId;
  bool accept;

  ReplyInvitationRequest(this.userId, this.groupId, this.accept);


  factory ReplyInvitationRequest.fromJson(Map<String, dynamic> json) => _$ReplyInvitationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyInvitationRequestToJson(this);
}