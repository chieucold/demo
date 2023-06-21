
import 'package:json_annotation/json_annotation.dart';
part 'device_token_model.g.dart';

@JsonSerializable(includeIfNull: true)
class DeviceTokenModel {
  DeviceTokenModel({
    this.id,
    this.userId,
    this.deviceToken,
    this.os,
    this.createdDate,
  });
  @JsonKey(defaultValue: 0)
  int? id;
  @JsonKey(defaultValue: 0)
  int? userId;
  @JsonKey(defaultValue: "")
  String? deviceToken;
  @JsonKey(defaultValue: "")
  String? os;
  DateTime? createdDate;


  factory DeviceTokenModel.fromJson(Map<String, dynamic> json) => _$DeviceTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceTokenModelToJson(this);

}

@JsonSerializable()
class TokenRequest {
  int id;
  String? deviceToken;
  String os;
  int userId;
  DateTime? createdDate;

  TokenRequest({this.deviceToken, required this.os, this.id = 0, this.userId = 0, this.createdDate});

  factory TokenRequest.fromJson(Map<String, dynamic> json) => _$TokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TokenRequestToJson(this);
}

