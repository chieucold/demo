import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class LoginResponseModel {
  @JsonKey(name: "isErrorMulti", defaultValue: false)
  bool isErrorMulti;
  @JsonKey(name: "redirectUrl", defaultValue: '')
  String redirectUrl;
  @JsonKey(name: "isOk", defaultValue: false)
  bool isOk;
  @JsonKey(name: "isRegister", defaultValue: false)
  bool isRegister;
  @JsonKey(name: "accessToken", defaultValue: '')
  String accessToken;
  @JsonKey(name: "refreshToken", defaultValue: '')
  String? refreshToken;
  UserInfo? userInfo;

  @JsonKey(name: "requiresTwoFactor", defaultValue: false)
  bool requiresTwoFactor;

  @JsonKey(name: "twoFactorTypes", defaultValue: <TwoFactorType>[])
  List<TwoFactorType>? twoFactorTypes;

  LoginResponseModel(
      {this.isErrorMulti = false,
      this.isOk = false,
      this.redirectUrl = '',
      this.accessToken = '',
      this.refreshToken = '',
      this.requiresTwoFactor = false,
      this.isRegister = false,
      this.userInfo,
      this.twoFactorTypes});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class TwoFactorType {
  TwoFactorType({
    this.type = '',
    this.title = '',
  });

  @JsonKey(name: "type", defaultValue: '')
  String type;

  @JsonKey(name: "title", defaultValue: '')
  String title;

  factory TwoFactorType.fromJson(Map<String, dynamic> json) => _$TwoFactorTypeFromJson(json);

  Map<String, dynamic> toJson() => _$TwoFactorTypeToJson(this);
}

@JsonSerializable()
class TwoFactorSendCodeResponse {
  TwoFactorSendCodeResponse({
    this.successed = false,
    this.data,
    this.code = '',
    this.message = '',
    this.totalRows = 0,
  });

  @JsonKey(name: "successed", defaultValue: false)
  bool successed;
  @JsonKey(name: "data")
  Data? data;
  @JsonKey(name: "code", defaultValue: '')
  String code;
  @JsonKey(name: "message", defaultValue: '')
  String message;
  @JsonKey(name: "totalRows", defaultValue: 0)
  int totalRows;

  factory TwoFactorSendCodeResponse.fromJson(Map<String, dynamic> json) => _$TwoFactorSendCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TwoFactorSendCodeResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.value = '',
    this.expiry,
    this.expirySecond = 0,
    this.accessToken = '',
    this.refreshToken = '',
  });

  @JsonKey(name: "value", defaultValue: '')
  String value;
  @JsonKey(name: "expiry")
  DateTime? expiry;
  @JsonKey(name: "expirySecond", defaultValue: 0)
  int expirySecond;
  @JsonKey(name: "accessToken", defaultValue: '')
  String accessToken;
  @JsonKey(name: "refreshToken", defaultValue: '')
  String refreshToken;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class UserInfo {
  UserInfo({
    this.firstName='',
    this.lastName='',
    this.fullName='',
    this.address='',
    this.birthdate,
    this.gender=0,
    this.avatar='',
    this.id=0,
    this.userName='',
    this.phoneNumber=0,
    this.email=''
  });
  @JsonKey(name: "firstName", defaultValue: '')
  String firstName;
  @JsonKey(name: "lastName", defaultValue: '')
  String lastName;
  @JsonKey(name: "fullName", defaultValue: '')
  String fullName;
  @JsonKey(name: "address", defaultValue: '')
  String address;
  DateTime? birthdate;
  @JsonKey(name: "gender", defaultValue: 0)
  int gender;
  @JsonKey(name: "avatar", defaultValue: '')
  String avatar;
  @JsonKey(name: "id", defaultValue: 0)
  int id;
  @JsonKey(name: "userName", defaultValue: '')
  String userName;
  @JsonKey(name: "email", defaultValue: '')
  String email;
  @JsonKey(name: "phoneNumber", defaultValue: 0)
  int phoneNumber;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);


}
