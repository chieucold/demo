import 'package:json_annotation/json_annotation.dart';
part 'common_user_model.g.dart';

@JsonSerializable()
class CommonUserModel {
  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: "")
  String fullName;

  @JsonKey(defaultValue: "")
  String avatar;

  @JsonKey(defaultValue: "")
  String username;

  @JsonKey(defaultValue: false)
  bool isVertify;

  @JsonKey(defaultValue: false)
  bool isManager;

  DateTime? joinDate;

  CommonUserModel(
      {this.id = 0,
      this.fullName = "",
      this.avatar = "",
      this.username = "",
      this.isVertify = false,
      this.isManager = false,
      this.joinDate});

  factory CommonUserModel.fromJson(Map<String, dynamic> json) => _$CommonUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommonUserModelToJson(this);
}
