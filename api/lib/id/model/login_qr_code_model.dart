import 'package:json_annotation/json_annotation.dart';

part 'login_qr_code_model.g.dart';

@JsonSerializable(includeIfNull: true)
class LoginQRCodeModel {
  LoginQRCodeModel({
    this.ip = "",
    this.browserName = "",
    this.address = "",
  });

  @JsonKey(defaultValue: "")
  String ip;

  @JsonKey(defaultValue: "")
  String browserName;

  @JsonKey(defaultValue: "")
  String address;

  factory LoginQRCodeModel.fromJson(Map<String, dynamic> json) => _$LoginQRCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginQRCodeModelToJson(this);
}

