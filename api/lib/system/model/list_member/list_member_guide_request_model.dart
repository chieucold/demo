import 'package:json_annotation/json_annotation.dart';

part 'list_member_guide_request_model.g.dart';

@JsonSerializable(includeIfNull: true)
class ListMemberGuideRequestModel {
  ListMemberGuideRequestModel({
    this.keyWord = '',
    this.pageIndex = 0,
    this.pageSize = 0,
  });

  @JsonKey(defaultValue: "", name: 'KeyWord')
  final String keyWord;

  @JsonKey(defaultValue: 0, name: 'PageSize')
  final int pageSize;

  @JsonKey(defaultValue: 0, name: 'PageIndex')
  final int pageIndex;

  factory ListMemberGuideRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ListMemberGuideRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListMemberGuideRequestModelToJson(this);
}
