import 'package:json_annotation/json_annotation.dart';

part 'change_time_request.g.dart';

@JsonSerializable()
class ChangeTimeRequest{
  int groupExamId;
  DateTime endDate;

  ChangeTimeRequest({required this.groupExamId, required this.endDate});

  factory ChangeTimeRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeTimeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeTimeRequestToJson(this);
}