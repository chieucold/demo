import 'package:core/model/paging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_set_model.g.dart';

@JsonSerializable()
class ExamSetRequest extends PagingRequest {
  String title;
  bool? isFree;

  ExamSetRequest(this.title, int pageIndex, int pageSize, {this.isFree}) : super(pageIndex, pageSize);

  factory ExamSetRequest.fromJson(Map<String, dynamic> json) => _$ExamSetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExamSetRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExamSetGetAllRequestModel {
  ExamSetGetAllRequestModel({
    this.title = '',
    this.isFree = false,
    this.categoryId = 0,
    this.sortExpression = '',
    this.pageSize = 0,
    this.pageIndex = 0,
    this.skip = 0,
    this.version = '',
  });

  factory ExamSetGetAllRequestModel.fromJson(Map<String, dynamic> json) => _$ExamSetGetAllRequestModelFromJson(json);

  @JsonKey(name: 'Title', includeIfNull: true, defaultValue: '')
  String title;
  @JsonKey(name: 'IsFree', includeIfNull: true, defaultValue: false)
  bool isFree;
  @JsonKey(name: 'CategoryId', includeIfNull: true, defaultValue: 0)
  int categoryId;
  @JsonKey(name: 'SortExpression', includeIfNull: true, defaultValue: '')
  String sortExpression;
  @JsonKey(name: 'PageSize', includeIfNull: true, defaultValue: 0)
  int pageSize;
  @JsonKey(name: 'PageIndex', includeIfNull: true, defaultValue: 0)
  int pageIndex;
  @JsonKey(name: 'Skip', includeIfNull: true, defaultValue: 0)
  int skip;
  @JsonKey(name: 'version', includeIfNull: true, defaultValue: '')
  String version;
  static const fromJsonFactory = _$ExamSetGetAllRequestModelFromJson;
  static const toJsonFactory = _$ExamSetGetAllRequestModelToJson;
  Map<String, dynamic> toJson() => _$ExamSetGetAllRequestModelToJson(this);
}
