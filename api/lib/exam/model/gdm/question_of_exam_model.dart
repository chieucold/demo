import 'package:json_annotation/json_annotation.dart';

part 'question_of_exam_model.g.dart';

@JsonSerializable()
class CreateExamModel extends CreateExamModelCommon {
  CreateExamModel({
    required this.data,
    int examStructureId = 0,
    int examCategoryId = 0,
    int duration = 0,
    String? title,
    int examLevel = 0,
    String? description,
    int examType = 0,
    int type = 0,
    int? examLimit,
    int? shareMode,
    int totalMark = 0,
    int totalQuestion = 0,
    bool? isFree,
    DateTime? examTimeFrom,
    DateTime? examTimeTo,
    int? examLimitNumber,
    List<int>? tags,
    int status = 0,
    List<int>? propertyDetails,
    bool isSave = false,
  }) : super(
            examStructureId: examStructureId,
            examCategoryId: examCategoryId,
            duration: duration,
            title: title,
            examLevel: examLevel,
            description: description,
            examType: examType,
            type: type,
            examLimit: examLimit ?? 0,
            shareMode: shareMode ?? 0,
            totalMark: totalMark,
            totalQuestion: totalQuestion,
            isFree: isFree ?? false,
            examTimeFrom: examTimeFrom,
            examTimeTo: examTimeTo,
            examLimitNumber: examLimitNumber ?? 0,
            tags: tags ?? [],
            status: status,
            propertyDetails: propertyDetails,
            isSave: isSave);

  @JsonKey(defaultValue: null)
  QuestionOfExamModel data;

  factory CreateExamModel.fromJson(Map<String, dynamic> json) => _$CreateExamModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateExamModelToJson(this);
}

@JsonSerializable()
class CreateExamModelCommon {
  CreateExamModelCommon(
      {this.examStructureId = 0,
      this.examCategoryId = 0,
      this.duration = 0,
      this.title,
      this.examLevel = 0,
      this.description,
      this.examType = 1,
      this.type = 2,
      this.examLimit = 0,
      this.shareMode = 1,
      this.totalMark = 0,
      this.totalQuestion = 0,
      this.isFree = false,
      this.examTimeFrom,
      this.examTimeTo,
      this.examLimitNumber = 0,
      required this.tags,
      this.status = 1, // 1 là tạo và sử dụng đc , 2 tạo nháp, 0 là xoá
      this.propertyDetails,
      this.isSave = false});

  int examStructureId;
  int examCategoryId;
  int duration;
  String? title;
  int examLevel;
  String? description;
  int examType;
  int type;
  int examLimit;
  int shareMode;
  int totalMark;
  int totalQuestion;
  bool isFree;
  DateTime? examTimeFrom;
  DateTime? examTimeTo;
  int examLimitNumber;
  List<int> tags;
  int status;
  List<int>? propertyDetails;
  bool isSave;

  factory CreateExamModelCommon.fromJson(Map<String, dynamic> json) => _$CreateExamModelCommonFromJson(json);

  Map<String, dynamic> toJson() => _$CreateExamModelCommonToJson(this);
}

@JsonSerializable(includeIfNull: true)
class CreateExamRequestModel extends CreateExamModelCommon {
  CreateExamRequestModel(
      {int examStructureId = 0,
      int examCategoryId = 0,
      int duration = 0,
      String? title,
      int examLevel = 0,
      String? description,
      int? examType,
      int? examLimit,
      int? shareMode,
      int totalMark = 0,
      int totalQuestion = 0,
      bool? isFree,
      DateTime? examTimeFrom,
      DateTime? examTimeTo,
      int? examLimitNumber,
      List<int>? tags,
      int status = 0,
      List<int>? propertyDetails,
      bool isSave = false,
      required this.data,
      required int type})
      : super(
            examStructureId: examStructureId,
            examCategoryId: examCategoryId,
            duration: duration,
            title: title,
            examLevel: examLevel,
            description: description,
            examType: examType ?? 0,
            type: type,
            examLimit: examLimit ?? 0,
            shareMode: shareMode ?? 0,
            totalMark: totalMark,
            totalQuestion: totalQuestion,
            isFree: isFree ?? false,
            examTimeFrom: examTimeFrom,
            examTimeTo: examTimeTo,
            examLimitNumber: examLimitNumber ?? 0,
            tags: tags ?? [],
            status: status,
            propertyDetails: propertyDetails,
            isSave: isSave);

  @JsonKey(defaultValue: "")
  String data;

  factory CreateExamRequestModel.fromJson(Map<String, dynamic> json) => _$CreateExamRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateExamRequestModelToJson(this);
}

@JsonSerializable()
class QuestionOfExamModel {
  QuestionOfExamModel({
    required this.questions,
    this.displayType = 2,
    this.totalMark = 0,
    this.numberOfQuestion = 0,
    this.path,
  });

  List<QuestionOfExam> questions;
  int displayType;
  int totalMark;
  int numberOfQuestion;
  String? path;

  factory QuestionOfExamModel.fromJson(Map<String, dynamic> json) => _$QuestionOfExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionOfExamModelToJson(this);
}

@JsonSerializable()
class QuestionOfExam {
  QuestionOfExam(
      {required this.id,
      required this.answerType,
      required this.mark,
      required this.answers,
      this.isAnswered = 0,
      this.contentExplain,
      this.title});

  int id;
  String answerType;
  double mark;
  int isAnswered;
  String? questionExplainId;
  String? title;
  String? contentExplain;
  List<Answer> answers;

  factory QuestionOfExam.fromJson(Map<String, dynamic> json) => _$QuestionOfExamFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionOfExamToJson(this);
}

enum AnswerType { answerRadio, answerCheckBox }

final EnumValues<AnswerType> answerTypeValues = EnumValues<AnswerType>({"answer-radio": AnswerType.answerRadio});

@JsonSerializable()
class Answer {
  Answer({required this.id, this.isCorrect = false, this.isDelete = false, required this.label});

  String id;
  bool isCorrect;
  bool isDelete;
  String label;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
