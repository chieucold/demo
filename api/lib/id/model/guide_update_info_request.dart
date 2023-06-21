import 'package:json_annotation/json_annotation.dart';

part 'guide_update_info_request.g.dart';

@JsonSerializable()
class GuideUpdateInfoRequest {
  @JsonKey(defaultValue: 0)
  int gender;
  @JsonKey(defaultValue: '')
  String birthdate;

  GuideUpdateInfoRequest({
    this.gender = 0,
    this.birthdate = '',
  });

  factory GuideUpdateInfoRequest.fromJson(Map<String, dynamic> json) => _$GuideUpdateInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GuideUpdateInfoRequestToJson(this);
}
