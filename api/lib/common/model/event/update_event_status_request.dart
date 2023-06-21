
import 'package:json_annotation/json_annotation.dart';

part 'update_event_status_request.g.dart';
@JsonSerializable()
class UpdateEventStatusRequest {
  int id;
  int choose;

  UpdateEventStatusRequest({required this.id,required this.choose});

  factory UpdateEventStatusRequest.fromJson(Map<String, dynamic> json) => _$UpdateEventStatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateEventStatusRequestToJson(this);
}