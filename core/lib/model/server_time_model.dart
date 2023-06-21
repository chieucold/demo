import 'package:json_annotation/json_annotation.dart';

part 'server_time_model.g.dart';

@JsonSerializable()
class ServerTimeModel {
  DateTime serverTime;
  DateTime clientTime;

  ServerTimeModel(this.serverTime, this.clientTime);

  factory ServerTimeModel.fromJson(Map<String, dynamic> json) => _$ServerTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServerTimeModelToJson(this);
}
