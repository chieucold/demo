import 'package:api/api/exam_api_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competition_model.g.dart';

@JsonSerializable(includeIfNull: true)
class CompetitionModel {
  @JsonKey(defaultValue: 0)
  int id;

  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: 0)
  int examId;

  @JsonKey(defaultValue: 0)
  int examCategoryId;

  @JsonKey(defaultValue: 0)
  int type;

  @JsonKey(defaultValue: 0)
  int status;

  @JsonKey(defaultValue: 0)
  int ownerType;

  @JsonKey(defaultValue: 0)
  int maxUser;

  @JsonKey(defaultValue: false)
  bool isPrivate;

  @JsonKey(defaultValue: <SimpleUserEntity>[])
  List<SimpleUserEntity> listUserInCompetition;

  DateTime? startDate;

  @JsonKey(defaultValue: 0)
  int formatType;

  @JsonKey(defaultValue: 0)
  int roundCount;

  @JsonKey(defaultValue: false)
  bool isJoined;

  @JsonKey(defaultValue: <String>[])
  List<String> propertyDetailName;

  @JsonKey(defaultValue: "")
  String categoryName;

  @JsonKey(defaultValue: false)
  bool playNow;

  @JsonKey(defaultValue: 0)
  double duration;

  @JsonKey(defaultValue: 0)
  double totalMark;

  @JsonKey(defaultValue: 0)
  int rank;

  @JsonKey(defaultValue: "")
  String examCategoryName; // Phòng đấu của tôi

  @JsonKey(defaultValue: 0)
  int competitionRoundId;

  @JsonKey(defaultValue: <int>[])
  List<int> listUserInCompetitionIds;

  @JsonKey(defaultValue: <String>[])
  List<String> categoryNames;

  @JsonKey(defaultValue: 0)
  int competitionUserCount;

  @JsonKey(defaultValue: "")
  String typeName;

  @JsonKey(defaultValue: "")
  String statusName;

  @JsonKey(defaultValue: <int>[])
  List<int> categoryIds;

  @JsonKey(defaultValue: <int>[])
  List<int> examIds;

  @JsonKey(defaultValue: 0)
  int competitionRoundPlayingId;

  @JsonKey(defaultValue: 0)
  int totalUserInCompetitionIds;

  CompetitionModel({
    this.id = 0,
    this.title = "",
    this.startDate,
    this.formatType = 0,
    this.categoryNames = const <String>[],
    this.examId = 0,
    this.examCategoryId = 0,
    this.type = 0,
    this.status = 0,
    this.ownerType = 0,
    this.isPrivate = false,
    this.maxUser = 0,
    this.listUserInCompetition = const <SimpleUserEntity>[],
    this.roundCount = 0,
    this.isJoined = false,
    this.propertyDetailName = const <String>[],
    this.categoryName = "",
    this.playNow = false,
    this.duration = 0,
    this.competitionRoundId = 0,
    this.totalMark = 0,
    this.rank = 0,
    this.examCategoryName = "",
    this.listUserInCompetitionIds = const <int>[],
    this.examIds = const <int>[],
    this.categoryIds = const <int>[],
    this.statusName = "",
    this.typeName = "",
    this.competitionUserCount = 0,
    this.competitionRoundPlayingId = 0,
    this.totalUserInCompetitionIds = 0
  });

  factory CompetitionModel.fromJson(Map<String, dynamic> json) => _$CompetitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionModelToJson(this);
}
