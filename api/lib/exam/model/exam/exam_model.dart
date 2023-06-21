import 'package:api/system/model/system_index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_model.g.dart';

@JsonSerializable()
class ExamModel {
  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: 0)
  int duration;

  @JsonKey(defaultValue: 0)
  int examLevel;

  @JsonKey(defaultValue: <String>[])
  List<String> propertiesValueName;

  @JsonKey(defaultValue: 0)
  int numberOfExamTime;

  @JsonKey(defaultValue: false)
  bool isApproved;

  @JsonKey(defaultValue: false)
  bool isLike;

  @JsonKey(defaultValue: <CommonUserModel>[])
  List<CommonUserModel> members;

  @JsonKey(defaultValue: 0)
  int numberOfMembers;

  @JsonKey(defaultValue: "")
  String examCategoryName;

  @JsonKey(defaultValue: false)
  bool isFree;

  ExamModel(
      {required this.id,
      this.title = "",
      this.duration = 0,
      this.examLevel = 0,
      this.propertiesValueName = const <String>[],
      this.numberOfExamTime = 0,
      this.isApproved = false,
      this.numberOfMembers = 0,
      this.members = const <CommonUserModel>[],
      this.isLike = false,
      this.examCategoryName = "",
      this.isFree = false});

  factory ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelToJson(this);
}

@JsonSerializable()
class ExamRequest {
  int? examSetId;
  List<int> propertyDetails = <int>[];
  int? examCategoryId;
  int? status;
  String? sortExpression;
  int? pageIndex;
  int? pageSize;
  List<int> examCategoryIds;
  List<int> examIds;
  String? titleExams; // for appBar,
  double price; //for from examSet
  bool isBuy;
  bool isFree;

  ExamRequest(
      {this.examSetId,
      this.propertyDetails = const <int>[],
      this.examCategoryId,
      this.status,
      this.sortExpression,
      this.pageIndex,
      this.pageSize,
      this.examCategoryIds = const <int>[],
      this.examIds = const <int>[],
      this.titleExams = "",
      this.price = 0, this.isBuy = false, this.isFree = false});

  factory ExamRequest.fromJson(Map<String, dynamic> json) => _$ExamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExamRequestToJson(this);

  Map<String, dynamic> toQueries(ExamRequest instance) => <String, dynamic>{
        'examSetId': instance.examSetId,
        for (int i = 0; i < instance.propertyDetails.length; i++) 'propertyDetail': instance.propertyDetails[i],
        'examCategoryId': instance.examCategoryId,
        'status': instance.status,
        'sortExpression': instance.sortExpression,
        'pageIndex': instance.pageIndex,
        'pageSize': instance.pageSize,
      };
}
