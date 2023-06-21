import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide_category_object.g.dart';

@JsonSerializable(includeIfNull: true)
class GuideCategoryObjectModel {
  @JsonKey(defaultValue: '')
  String categoryTitle;

  @JsonKey(defaultValue: 0)
  int categoryId;

  @JsonKey(defaultValue: '')
  String objectTitle;

  @JsonKey(defaultValue: 0)
  int objectId;

  @JsonKey(defaultValue: true)
  bool isCategory;

  @JsonKey(defaultValue: false)
  bool isChooseAll;

  GuideCategoryObjectModel({
    this.categoryTitle = "",
    this.categoryId = 0,
    this.objectTitle = "",
    this.objectId = 0,
    this.isCategory = true,
    this.isChooseAll = false,
  });

  factory GuideCategoryObjectModel.fromJson(Map<String, dynamic> json) => _$GuideCategoryObjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$GuideCategoryObjectModelToJson(this);
}
