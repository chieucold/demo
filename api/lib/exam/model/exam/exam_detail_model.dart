import 'package:api/common/model/common_index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_detail_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class ExamDetailModel {
  int examId;
  String? description;
  UserModel? user;

  @JsonKey(defaultValue: <StructureModel>[])
  List<StructureModel> data;

  @JsonKey(defaultValue: false)
  bool isApproved;

  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: 0)
  double duration;

  @JsonKey(defaultValue: 0)
  int type;

  int? numberDoExam;

  @JsonKey(defaultValue: false)
  bool isLiked;

  DateTime? timeUpdated;

  @JsonKey(defaultValue: false)
  bool isFree;

  @JsonKey(defaultValue: false)
  bool isBuy;

  @JsonKey(defaultValue: 0)
  int belong;

  @JsonKey(defaultValue: 0)
  int categoryId;

  @JsonKey(defaultValue: false)
  bool isRate;

  ExamDetailModel(
      {required this.examId,
      required this.data,
      required this.user,
      this.description,
      required this.isApproved,
      required this.duration,
      required this.type,
      required this.title,
      this.timeUpdated,
      this.isLiked = false,
      this.numberDoExam,
      this.isBuy = false,
      this.isFree = false,
      this.belong = 0,
      this.categoryId = 0,
      this.isRate = false});

  ExamDetailModel copyWith(
          {int? examId,
          bool? isApproved,
          String? title,
          double? duration,
          int? type,
          bool? isLiked,
          List<StructureModel>? data,
          String? description,
          UserModel? user,
          int? numberDoExam,
          DateTime? timeUpdated}) =>
      ExamDetailModel(
        title: title ?? this.title,
        examId: examId ?? this.examId,
        description: description ?? this.description,
        user: user ?? this.user,
        data: data ?? this.data,
        isApproved: isApproved ?? this.isApproved,
        duration: duration ?? this.duration,
        type: type ?? this.type,
        numberDoExam: numberDoExam ?? this.numberDoExam,
        isLiked: isLiked ?? this.isLiked,
        timeUpdated: timeUpdated ?? this.timeUpdated,
        belong: belong,
        categoryId: categoryId,
        isBuy: isBuy,
        isFree: isFree,
        isRate: isRate,
      );

  factory ExamDetailModel.fromJson(Map<String, dynamic> json) => _$ExamDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StructureModel {
  StructureDetailModel item;
  List<StructureModel> children;

  StructureModel({required this.item, required this.children});

  factory StructureModel.fromJson(Map<String, dynamic> json) => _$StructureModelFromJson(json);

  Map<String, dynamic> toJson() => _$StructureModelToJson(this);
}

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class StructureDetailModel {
  @JsonKey(defaultValue: 0)
  int propertyDetailId;

  @JsonKey(defaultValue: 0)
  int propertyId;

  String? propertyName;

  String? propertyDetailName;

  @JsonKey(defaultValue: 0)
  int? propertyDetailParentId;

  @JsonKey(defaultValue: 0)
  int? propertyDetailOrder;

  @JsonKey(defaultValue: 0)
  int? propertyDetailCount;

  String? propertyDetailPath;
  StructureDetailModel(
      {required this.propertyDetailId,
      this.propertyDetailCount,
      required this.propertyDetailName,
      this.propertyDetailOrder,
      this.propertyDetailParentId,
      required this.propertyDetailPath,
      required this.propertyId,
      required this.propertyName});

  factory StructureDetailModel.fromJson(Map<String, dynamic> json) => _$StructureDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$StructureDetailModelToJson(this);
}

@JsonSerializable()
class ExamDetailRequest {
  int examId;
  ExamDetailRequest(this.examId) : super();

  factory ExamDetailRequest.fromJson(Map<String, dynamic> json) => _$ExamDetailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDetailRequestToJson(this);
}
