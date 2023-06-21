import 'package:json_annotation/json_annotation.dart';

part 'system_user_model.g.dart';

@JsonSerializable()
class SystemUserModel {
  SystemUserModel({
    this.id = 0,
    this.username = "",
    this.givenName = "",
    this.familyName = "",
    this.address = "",
    this.phoneNumber = "",
    this.birthdate,
    this.gender,
    this.avatar = "",
    this.isCanSetPassword = false,
    this.lockoutEnabled = false,
    this.groupIds = 0,
    this.fullName = "",
    this.isSystem = false,
    this.lockoutEnd,
    this.lockoutEndTime,
    this.createdDate,
    this.systemGroupName = "",
  });

  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: "")
  String username;

  @JsonKey(defaultValue: "")
  String givenName;

  @JsonKey(defaultValue: "")
  String familyName;

  @JsonKey(defaultValue: "")
  String address;

  @JsonKey(defaultValue: "")
  String phoneNumber;

  DateTime? birthdate;

  int? gender;

  @JsonKey(defaultValue: "")
  String avatar;

  @JsonKey(defaultValue: false)
  bool isCanSetPassword;

  @JsonKey(defaultValue: false)
  bool lockoutEnabled;

  @JsonKey(defaultValue: 0)
  int groupIds;

  @JsonKey(defaultValue: "")
  String fullName;

  @JsonKey(defaultValue: false)
  bool isSystem;

  DateTime? lockoutEnd;

  DateTime? lockoutEndTime;

  DateTime? createdDate;

  @JsonKey(defaultValue: "")
  String systemGroupName;

  factory SystemUserModel.fromJson(Map<String, dynamic> json) => _$SystemUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$SystemUserModelToJson(this);
}