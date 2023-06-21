
import 'package:json_annotation/json_annotation.dart';

part 'invite_event_request.g.dart';

@JsonSerializable()
class InviteEventRequest {
  int id;
  int invitedId;

  InviteEventRequest({required this.id, required this.invitedId});

  factory InviteEventRequest.fromJson(Map<String, dynamic> json) => _$InviteEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InviteEventRequestToJson(this);

}
