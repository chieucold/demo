import 'package:json_annotation/json_annotation.dart';
part 'competition_realtime_user_quit_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompetitionRealtimeUserQuitModel {
  int id;
  int userId;

  CompetitionRealtimeUserQuitModel({this.id = 0, this.userId = 0});

  factory CompetitionRealtimeUserQuitModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionRealtimeUserQuitModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionRealtimeUserQuitModelToJson(this);
}
