import 'package:core/model/paging.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_category_of_user.g.dart';

@JsonSerializable()
class CategoryOfUser {
  CategoryOfUser(
      {required this.blockCategoryId, required this.title, this.icon});

  final int blockCategoryId;
  final String title;
  final String? icon;

  factory CategoryOfUser.fromJson(Map<String, dynamic> json) =>
      _$CategoryOfUserFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryOfUserToJson(this);
}

@JsonSerializable()
class GetCategoryOfUserRes extends PagingRequest {
  GetCategoryOfUserRes({required int pageIndex, required int pageSize})
      : super(pageIndex, pageSize);

  factory GetCategoryOfUserRes.fromJson(Map<String, dynamic> json) =>
      _$GetCategoryOfUserResFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoryOfUserResToJson(this);
}
