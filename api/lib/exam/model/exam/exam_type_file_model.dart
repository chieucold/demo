import 'package:json_annotation/json_annotation.dart';

part 'exam_type_file_model.g.dart';

class ExamTypeFileModel {
  final int duration;
  final String? path;
  final String title;
  final double? mark;
  final int answerTypeView;
  List<ExamTypeFileQuestionModel> questions;
  ExamTypeFileModel(this.duration, this.path, this.questions, this.title,
      {this.mark = 0, required this.answerTypeView});
}

@JsonSerializable(explicitToJson: true)
class ExamTypeFileQuestionModel {
  int id;
  bool isCheckLate;
  bool isCorrect;
  List<String> userAnswer = <String>[];
  List<ExamTypeFileAnswerModel> answers;
  String? titleQuestion;
  int? duration; // input seconds
  ExamTypeFileQuestionModel(
    this.answers, {
    this.isCheckLate = false,
    required this.id,
    this.isCorrect = false,
    this.titleQuestion,
    this.duration,
  });

  factory ExamTypeFileQuestionModel.fromJson(Map<String, dynamic> json) => _$ExamTypeFileQuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamTypeFileQuestionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExamTypeFileAnswerModel {
  int index;
  int showType;
  String id; // is title
  ExamTypeFileAnswerModel(this.index, this.id, {this.showType = 0});

  factory ExamTypeFileAnswerModel.fromJson(Map<String, dynamic> json) => _$ExamTypeFileAnswerModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExamTypeFileAnswerModelToJson(this);
}
