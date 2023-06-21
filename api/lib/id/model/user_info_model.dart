
import 'package:json_annotation/json_annotation.dart';
part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  UserInfoModel({
    this.sub,
    this.zoneinfo,
    this.preferredUsername,
    this.name,
    this.email,
    this.emailVerified,
    this.userType,
    this.phone,
  });

  String? sub;
  String? zoneinfo;
  String? preferredUsername;
  String? name;
  String? email;
  bool? emailVerified;
  String? userType;
  String? phone;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}