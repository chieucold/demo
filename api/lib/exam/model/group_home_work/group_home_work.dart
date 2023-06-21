import 'package:json_annotation/json_annotation.dart';

part 'group_home_work.g.dart';

@JsonSerializable()
class GroupHomeworkReqModel {
  String? examTimeLimit;
  String? examTimeStart;
  int? createdBy;
  String? avatar;
  int? id;
  int? examCategoryId;
  String? title;
  int? status;

  GroupHomeworkReqModel(
      {this.examTimeLimit,
      this.examTimeStart,
      this.createdBy,
      this.avatar,
      this.id,
      this.examCategoryId,
      this.title,
      this.status});

  factory GroupHomeworkReqModel.fromJson(Map<String, dynamic> json) =>
      _$GroupHomeworkReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupHomeworkReqModelToJson(this);
}

@JsonSerializable()
class GroupHomeworkResModel {
  String Title;
  int Status;
  String SortExpression;
  int PageSize;
  int PageIndex;

  GroupHomeworkResModel({
    this.Title = '',
    this.Status = 0,
    this.SortExpression = '',
    this.PageSize = 0,
    this.PageIndex = 0,
  });
  factory GroupHomeworkResModel.fromJson(Map<String, dynamic> json) =>
      _$GroupHomeworkResModelFromJson(json);

  Map<String, dynamic> toJson() => _$GroupHomeworkResModelToJson(this);
}
