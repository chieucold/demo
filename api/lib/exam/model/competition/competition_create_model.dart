import 'package:api/api/commondata_api.dart';
import 'package:api/api/exam_api_models.dart';
import 'package:api/exam/model/exam/exam_index.dart';
import 'package:json_annotation/json_annotation.dart';
part 'competition_create_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompetitionCreateModel {
  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: 0)
  int? examCategoryId;

  List<String> examCategoryIds;

  @JsonKey(defaultValue: 0)
  int? type;

  @JsonKey(defaultValue: 0)
  int status; // 0- Chưa Thi đấu , 1, 2,3

  @JsonKey(defaultValue: 0)
  int ownerType; // 0- System, 1- User

  DateTime? startDate;

  DateTime? endDate;

  @JsonKey(defaultValue: 0)
  int maxUser;

  @JsonKey(defaultValue: false)
  bool? isPrivate;

  @JsonKey(defaultValue: 0)
  int? formatType;

  @JsonKey(defaultValue: 0)
  int duration;

  @JsonKey(defaultValue: <int>[])
  List<PropertyFilter> propertyDetailIds;

  @JsonKey(defaultValue: <ExamFilterLevel>[])
  List<ExamFilterLevel> propertyDetails; //hiển thị nhiều vòng

  @JsonKey(defaultValue: <CompetitionCreateModel>[])
  List<CompetitionCreateModel> rounds;

  @JsonKey(defaultValue: false)
  bool isMobile;
  @JsonKey(defaultValue: 0)
  int? userId; // set user// Id later

  @JsonKey(defaultValue: false)
  bool? playNow;

  @JsonKey(defaultValue: 0)
  int? numberOfQuestions;

  int? roundIndex; //Thông tin vòng đấu

  BlockCategoryResource? category;

  int? examId;

  ExamBaseResource? examData;

  bool isYourChoice;

  CompetitionCreateModel(
      {this.title = "",
      this.examCategoryId,
      this.examCategoryIds = const <String>[],
      this.type,
      this.status = 0,
      this.ownerType = 1,
      this.startDate,
      this.endDate,
      this.maxUser = 0,
      this.isPrivate,
      this.formatType,
      this.duration = 0,
      this.propertyDetailIds = const <PropertyFilter>[],
      this.rounds = const <CompetitionCreateModel>[],
      this.isMobile = true,
      this.userId,
      this.playNow = false,
      this.numberOfQuestions = 0,
      this.propertyDetails = const <ExamFilterLevel>[],
      this.roundIndex,
      this.category,
      this.examId,
      this.examData, this.isYourChoice = false});

  factory CompetitionCreateModel.fromJson(Map<String, dynamic> json) => _$CompetitionCreateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionCreateModelToJson(this);
}
