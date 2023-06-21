import 'package:json_annotation/json_annotation.dart';

part 'reply_event_request.g.dart';

@JsonSerializable()
class ReplyEventRequest {
  int eventId;
  bool isJoin;

  ReplyEventRequest({required this.eventId,required this.isJoin});

  factory ReplyEventRequest.fromJson(Map<String, dynamic> json) => _$ReplyEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyEventRequestToJson(this);
}