import 'package:json_annotation/json_annotation.dart';

part 'exam_filter_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExamFilterModel {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "tittle", defaultValue: "")
  String title;

  @JsonKey(name: "data")
  List<ExamFilterLevel> listAllLevel;

  ExamFilterModel(this.id, this.title, this.listAllLevel);

  factory ExamFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ExamFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamFilterModelToJson(this);
}

@JsonSerializable()
class ExamFilterLevel {
  @JsonKey(name: "item")
  LevelInfoItem item;

  @JsonKey(name: "children")
  List<ExamFilterLevel> children;

  //List<int>? paths;
  int? parentId;

  ExamFilterLevel({required this.item, required this.children, this.parentId});

  factory ExamFilterLevel.fromJson(Map<String, dynamic> json) =>
      _$ExamFilterLevelFromJson(json);

  Map<String, dynamic> toJson() => _$ExamFilterLevelToJson(this);
}

@JsonSerializable()
class LevelInfoItem {
  @JsonKey(name: "propertyDetailId",defaultValue: 0)
  int propertyDetailId;

  @JsonKey(name: "propertyId",defaultValue: 0)
  int propertyId;

  @JsonKey(name: "propertyDetailName",defaultValue: "")
  String propertyDetailName;

  LevelInfoItem(
      {required this.propertyDetailId, required this.propertyDetailName,required this.propertyId});

  factory LevelInfoItem.fromJson(Map<String, dynamic> json) =>
      _$LevelInfoItemFromJson(json);

  Map<String, dynamic> toJson() => _$LevelInfoItemToJson(this);
}

@JsonSerializable()
class ExamFilterRequest {
  int examCategoryId;

  ExamFilterRequest({required this.examCategoryId});

  factory ExamFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$ExamFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExamFilterRequestToJson(this);
}
