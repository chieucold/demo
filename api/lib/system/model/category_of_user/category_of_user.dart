import 'package:json_annotation/json_annotation.dart';

part 'category_of_user.g.dart';

@JsonSerializable()
class CategoryOfUserResModel {
  int blockCategoryId;
 

  CategoryOfUserResModel(
      { required this.blockCategoryId
      });

  factory CategoryOfUserResModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryOfUserResModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryOfUserResModelToJson(this);
}