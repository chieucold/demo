import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationRequestSeen {
  String id;
  int status;
  NotificationRequestSeen({this.status = 1, required this.id});

  factory NotificationRequestSeen.fromJson(Map<String, dynamic> json) => _$NotificationRequestSeenFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationRequestSeenToJson(this);
}
