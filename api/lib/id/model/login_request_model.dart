import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: true)
class LoginRequestModel {
  @JsonKey(name: "username", defaultValue: "")
  String username;
  @JsonKey(name: "password", defaultValue: "")
  String password;
  @JsonKey(name: "rememberLogin", defaultValue: false)
  bool rememberLogin;
  @JsonKey(name: "returnUrl", defaultValue: "")
  String returnUrl;
  @JsonKey(name: "sessionId", defaultValue: "")
  String sessionId;
  @JsonKey(name: "captcha", defaultValue: "")
  String captcha;
  @JsonKey(name: "clientId", defaultValue: "")
  String clientId;

  LoginRequestModel({
    this.username = '',
    this.password = '',
    this.captcha = '',
    this.returnUrl = '',
    this.sessionId = '',
    this.rememberLogin = false,
    this.clientId = '',
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

@JsonSerializable()
class LoginTwoFactorRequestModel {
  @JsonKey(name: "twoFactorCode", defaultValue: "")
  String twoFactorCode;
  @JsonKey(name: "rememberMachine", defaultValue: false)
  bool rememberMachine;
  @JsonKey(name: "userName", defaultValue: "")
  String userName;
  @JsonKey(name: "clientId", defaultValue: "")
  String clientId;

  LoginTwoFactorRequestModel(
      {this.twoFactorCode = '', this.rememberMachine = false, this.userName = '', this.clientId = ''});

  factory LoginTwoFactorRequestModel.fromJson(Map<String, dynamic> json) => _$LoginTwoFactorRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginTwoFactorRequestModelToJson(this);
}

@JsonSerializable()
class LoginRecoveryCodeTwoFactorRequestModel {
  @JsonKey(name: "recoveryCode", defaultValue: "")
  String recoveryCode;
  @JsonKey(name: "userName", defaultValue: "")
  String userName;
  @JsonKey(name: "clientId", defaultValue: "")
  String clientId;

  LoginRecoveryCodeTwoFactorRequestModel({this.recoveryCode = '', this.userName = '', this.clientId = ''});

  factory LoginRecoveryCodeTwoFactorRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRecoveryCodeTwoFactorRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRecoveryCodeTwoFactorRequestModelToJson(this);
}

@JsonSerializable()
class TwoFactorSendCode {
  @JsonKey(name: "codeReceiveMethod", defaultValue: "")
  String codeReceiveMethod;
  @JsonKey(name: "userName", defaultValue: "")
  String userName;

  TwoFactorSendCode({this.codeReceiveMethod = '', this.userName = ''});

  factory TwoFactorSendCode.fromJson(Map<String, dynamic> json) => _$TwoFactorSendCodeFromJson(json);

  Map<String, dynamic> toJson() => _$TwoFactorSendCodeToJson(this);
}

@JsonSerializable()
class AcceptPromptRequestModel {
  @JsonKey(name: "key", defaultValue: "")
  String key;
  @JsonKey(name: "userId", defaultValue: 0)
  int userId;

  AcceptPromptRequestModel({
    this.key = '',
    this.userId = 0,
  });

  factory AcceptPromptRequestModel.fromJson(Map<String, dynamic> json) => _$AcceptPromptRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AcceptPromptRequestModelToJson(this);
}
