import 'package:json_annotation/json_annotation.dart';

part 'reassign_exam_request.g.dart';

@JsonSerializable()
class ReAssignExamRequest {
  int groupId;
  int examId;
  int groupExamId;

  List<int> userId;

  DateTime? startDate;
  DateTime? endDate;

  bool allowDeadline;
  bool allowSeeAnswerAfterComplete;

  ReAssignExamRequest({
    required this.groupExamId,
    required this.groupId,
    required this.examId,
    this.userId = const <int>[],
    this.startDate,
    this.endDate,
    this.allowDeadline = false,
    this.allowSeeAnswerAfterComplete = false,
  });

  factory ReAssignExamRequest.fromJson(Map<String, dynamic> json) => _$ReAssignExamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReAssignExamRequestToJson(this);
}
