import 'package:api/common/model/comment/comment_model.dart';
import 'package:api/exam/model/exam_index.dart';
import 'package:core/model/paging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_package_model.g.dart';

@JsonSerializable()
class ExamPackageRequest extends PagingRequest {
  String? sortExpression;
  bool? isHot;
  List<int>? categoryIds;
  String? keyWord;
  DateTime? startDate;
  DateTime? endDate;
  int? status;

  ExamPackageRequest({
    this.sortExpression,
    required int pageSize,
    required int pageIndex,
    this.isHot,
    this.categoryIds,
    this.keyWord,
  }) : super(pageIndex, pageSize);

  factory ExamPackageRequest.fromJson(Map<String, dynamic> json) => _$ExamPackageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExamPackageRequestToJson(this);
}
