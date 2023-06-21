import 'package:json_annotation/json_annotation.dart';
part 'user_info.g.dart';

class UserInfo {
  late double id;
  late String name;
  late String? email;
  late int? userType;
  late String? avatar;
  late int? gender;
  late String? dateOfBirth;

  UserInfo({
    required this.id,
    required this.name,
    this.email,
    this.userType,
    this.avatar,
    this.gender,
    this.dateOfBirth,
  });

  // UserInfo.fromOAuth(oidc.UserInfo userInfo) {
  //   id = double.tryParse(userInfo.subject) ?? 0;
  //   name = userInfo.name ?? "";
  //   email = userInfo.email ?? "";
  //   // avatar = userInfo.picture?.ur ?? "";
  //   userType = userInfo.getTyped<int>(
  //         "user_type",
  //         factory: (dynamic v) => int.tryParse(v) ?? 0,
  //       ) ??
  //       0;
  // }

  UserInfo.fromAPI(UserInfoApiModel userInfo) {
    id = double.tryParse(userInfo.sub) ?? 0;
    name = userInfo.fullName;
    email = userInfo.email;
    avatar = userInfo.avatar;
    userType = int.tryParse(userInfo.userType) ?? 0;
    gender = int.tryParse(userInfo.gender) ?? 0;
    dateOfBirth = userInfo.dateOfBirth;
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        userType: json["userType"],
        avatar: json["avatar"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "name": name,
        "email": email,
        "userType": userType,
        "avatar": avatar,
        "gender": gender,
        "date_of_birth": dateOfBirth
      };
}

@JsonSerializable(includeIfNull: true)
class UserInfoApiModel {
  UserInfoApiModel({
    this.sub = "",
    this.zoneinfo = "",
    this.preferredUsername = "",
    this.name = "",
    this.email = "",
    this.emailVerified = false,
    this.userType = "",
    this.phone = "",
    this.avatar = "",
    this.fullName = "",
    this.gender = "",
    this.dateOfBirth = "",
  });

  @JsonKey(defaultValue: "")
  String sub;

  @JsonKey(defaultValue: "")
  String zoneinfo;

  @JsonKey(defaultValue: "")
  String preferredUsername;

  @JsonKey(defaultValue: "")
  String name;

  @JsonKey(defaultValue: "")
  String email;

  @JsonKey(defaultValue: false)
  bool emailVerified;

  @JsonKey(defaultValue: "")
  String userType;

  @JsonKey(defaultValue: "")
  String phone;

  @JsonKey(defaultValue: "")
  String avatar;

  @JsonKey(defaultValue: "", name: "full_name")
  String fullName;

  @JsonKey(defaultValue: "")
  String gender;

  @JsonKey(defaultValue: "", name: "date_of_birth")
  String dateOfBirth;

  factory UserInfoApiModel.fromJson(Map<String, dynamic> json) => _$UserInfoApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoApiModelToJson(this);
}
