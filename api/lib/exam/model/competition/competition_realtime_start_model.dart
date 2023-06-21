import 'package:json_annotation/json_annotation.dart';
part 'competition_realtime_start_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompetitionRealtimeStartModel {
  int id;
  String title;
  int createdBy;
  int countDownWaitingTime;


  CompetitionRealtimeStartModel({this.title = "", this.id = 0, this.createdBy = 0, this.countDownWaitingTime = 0});

  factory CompetitionRealtimeStartModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionRealtimeStartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionRealtimeStartModelToJson(this);
}
