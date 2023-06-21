import 'package:json_annotation/json_annotation.dart';

part 'tab_exams_store_model.g.dart';

@JsonSerializable(includeIfNull: true)
class TabExamsStoreModel {
  @JsonKey(name: "Active", defaultValue: 0)
  int countCreatedExam;

  @JsonKey(name: "Draft", defaultValue: 0)
  int countCreatedUnfinished;

  @JsonKey(name: "ExamSet", defaultValue: 0)
  int countExamSet;

  @JsonKey(name: "Favorite", defaultValue: 0)
  int countFavoriteExam;

  @JsonKey(name: "countExamSetStructure", defaultValue: 0)
  int countExamSetStructure;

  TabExamsStoreModel({
    this.countCreatedExam = 0,
    this.countCreatedUnfinished = 0,
    this.countExamSet = 0,
    this.countFavoriteExam = 0,
    this.countExamSetStructure = 0,
  });

  factory TabExamsStoreModel.fromJson(Map<String, dynamic> json) =>
      _$TabExamsStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$TabExamsStoreModelToJson(this);
}
