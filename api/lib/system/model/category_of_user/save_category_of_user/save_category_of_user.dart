import 'package:json_annotation/json_annotation.dart';

part 'save_category_of_user.g.dart';

@JsonSerializable()
class SaveCategoryOfUserRes {
  int blockCategoryId;
 

  SaveCategoryOfUserRes(
      { required this.blockCategoryId
      });

  factory SaveCategoryOfUserRes.fromJson(Map<String, dynamic> json) =>
      _$SaveCategoryOfUserResFromJson(json);

  Map<String, dynamic> toJson() => _$SaveCategoryOfUserResToJson(this);
}