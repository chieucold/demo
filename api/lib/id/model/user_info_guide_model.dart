import 'package:json_annotation/json_annotation.dart';
part 'user_info_guide_model.g.dart';

@JsonSerializable()
class UserInfoGuideModel {
  UserInfoGuideModel({
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.address = '',
    this.phoneNumber = '',
    this.birthdate,
    this.gender = 0,
    this.avatar = '',
    this.language = '',
    this.timezone = '',
    this.isCanSetPassword = false,
    this.groupIds = 0,
  });

  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: '')
  String? username;
  @JsonKey(defaultValue: '')
  String? firstName;
  @JsonKey(defaultValue: '')
  String? lastName;
  @JsonKey(defaultValue: '')
  String? address;
  @JsonKey(defaultValue: '')
  String? phoneNumber;
  
  DateTime? birthdate;
  @JsonKey(defaultValue: 0)
  int? gender;
  @JsonKey(defaultValue: '')
  String? avatar;
  @JsonKey(defaultValue: '')
  String? language;
  @JsonKey(defaultValue: '')
  String? timezone;
  @JsonKey(defaultValue: false)
  bool? isCanSetPassword;
  @JsonKey(defaultValue: 0)
  int? groupIds;

  factory UserInfoGuideModel.fromJson(Map<String, dynamic> json) => _$UserInfoGuideModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoGuideModelToJson(this);
}
