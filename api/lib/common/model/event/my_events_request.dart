import 'package:json_annotation/json_annotation.dart';

part 'my_events_request.g.dart';

@JsonSerializable()
class MyEventsRequest {
  int pageIndex;
  int pageSize;
  int? status;
  bool? isJoin;

  MyEventsRequest({required this.pageIndex, required this.pageSize, this.status, this.isJoin});

  factory MyEventsRequest.fromJson(Map<String, dynamic> json) => _$MyEventsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MyEventsRequestToJson(this);
}
