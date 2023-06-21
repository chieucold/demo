import 'package:api/system/model/system_index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competition_realtime_model.g.dart';

@JsonSerializable(includeIfNull: true)
class CompetitionRealtimeRankingModel {
  CompetitionRealtimeRankingModel({this.userId = 0, this.totalMark = 0, this.duration = 0, this.rank = 0, this.user});

  @JsonKey(defaultValue: 0)
  int userId;

  @JsonKey(defaultValue: 0)
  double totalMark;

  @JsonKey(defaultValue: 0)
  int duration;

  @JsonKey(defaultValue: 0)
  int rank;

  CommonUserModel? user;

  factory CompetitionRealtimeRankingModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionRealtimeRankingModelFromJson(json);
  Map<String, dynamic> toJson() => _$CompetitionRealtimeRankingModelToJson(this);
}

@JsonSerializable(includeIfNull: true)
class CompetitionRealtimeModel {
  CompetitionRealtimeModel(
      {this.userId = 0,
      this.questionNumber = 0,
      this.isCorrect = false,
      this.listRanking,
      this.roundId = 0,
      this.totalUser = 0,
      this.numberOfUsersInQuestion = 0});

  @JsonKey(defaultValue: 0)
  int questionNumber;

  @JsonKey(defaultValue: 0)
  int userId;

  @JsonKey(defaultValue: false)
  bool isCorrect;

  @JsonKey(defaultValue: 0)
  int roundId;

  List<CompetitionRealtimeRankingModel>? listRanking;

  @JsonKey(defaultValue: 0)
  int totalUser;

  @JsonKey(defaultValue: 0)
  int numberOfUsersInQuestion;

  factory CompetitionRealtimeModel.fromJson(Map<String, dynamic> json) => _$CompetitionRealtimeModelFromJson(json);
  Map<String, dynamic> toJson() => _$CompetitionRealtimeModelToJson(this);
}
