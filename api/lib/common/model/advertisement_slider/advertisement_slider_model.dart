import 'package:json_annotation/json_annotation.dart';

part 'advertisement_slider_model.g.dart';

@JsonSerializable()
class AdvertisementSliderResModel {
  int? numberItem;
  int? position;
  // int? block;
  // String? version;
  AdvertisementSliderResModel({this.numberItem, this.position});

  factory AdvertisementSliderResModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementSliderResModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementSliderResModelToJson(this);
}
