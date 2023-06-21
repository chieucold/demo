import 'package:json_annotation/json_annotation.dart';
part 'otp_user_model.g.dart';

@JsonSerializable(includeIfNull: true)
class OtpUserModel {
  OtpUserModel({
    this.value,
    this.expiry,
    this.expirySecond,
  });

  @JsonKey(defaultValue: '')
  String? value;

  DateTime? expiry;

  @JsonKey(defaultValue: 0)
  int? expirySecond;

  factory OtpUserModel.fromJson(Map<String, dynamic> json) => _$OtpUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$OtpUserModelToJson(this);
}
