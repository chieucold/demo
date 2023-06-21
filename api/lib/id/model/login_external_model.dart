import 'package:json_annotation/json_annotation.dart';

part 'login_external_model.g.dart';

@JsonSerializable()
class LoginExternalModel {
  @JsonKey(defaultValue: '')
  String username;
  @JsonKey(defaultValue: '')
  String password;
  @JsonKey(defaultValue: '')
  String returnUrl;
  @JsonKey(defaultValue: true)
  bool rememberLogin;
  @JsonKey(defaultValue: '')
  String clientId;
  @JsonKey(defaultValue: '')
  String familyName;
  @JsonKey(defaultValue: '')
  String givenName;

  LoginExternalModel(
      {this.username = '',
      this.password = '',
      this.rememberLogin = true,
      this.returnUrl = '',
      this.clientId = '',
      this.familyName = '',
      this.givenName = ''});

  factory LoginExternalModel.fromJson(Map<String, dynamic> json) => _$LoginExternalModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginExternalModelToJson(this);
}
