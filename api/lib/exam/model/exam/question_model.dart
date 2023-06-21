import 'dart:convert';

import 'package:api/api/exam_api.dart';
import 'package:core/common/common.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
// part 'question_model.g.dart';

@immutable
// ignore: must_be_immutable
class QuestionModel extends Equatable {
  int id;
  String title;
  String content;
  String questionNumber;
  bool isChooseLate;
  late List<QuestionUserAnswer> userAnswer = <QuestionUserAnswer>[];
  List<String> images;
  List<AnswerModel> answers;
  ExamQuestionTypeEnum type;
  bool isCorrect;
  String answerFile;
  int totalQuestionExplain;
  double mark; // Câu hỏi tự luận điểm
  double maxMark; // Câu hỏi tự luận điểm tối đa
  bool isShow;
  @JsonKey(defaultValue: 0)
  int totalLesson;

  @JsonKey(defaultValue: <int>[])
  List<int>? lessons;

  @JsonKey(defaultValue: "")
  final String videoUrl;

  @JsonKey(defaultValue: "")
  final String soundUrl;

  List<QuestionModel>? childs;

  QuestionModel({
    this.id = 0,
    this.content = "",
    this.questionNumber = "",
    this.isChooseLate = false,
    this.images = const <String>[],
    this.type = ExamQuestionTypeEnum.empty,
    this.isCorrect = false,
    required this.answers,
    this.answerFile = "",
    this.videoUrl = "",
    this.soundUrl = "",
    this.totalQuestionExplain = 0,
    this.title = "",
    this.mark = 0,
    this.maxMark = 0,
    this.childs,
    this.isShow = true,
    this.totalLesson=0,
    this.lessons =const <int>[]
  });

  factory QuestionModel.getFromQuestion(Question question,
      {int questionIndex = 0, List<UserAnswerPublicResource>? userAnswers}) {
    final int questionId = question.id;
    final QuestionModel model = QuestionModel(
      title: question.title,
      id: questionId,
      content: question.content,
      type: Utils.enumFromString<ExamQuestionTypeEnum>(ExamQuestionTypeEnum.values, question.type.camelCase),
      answers: <AnswerModel>[],
      questionNumber: questionIndex.toString(),
      images: !question.imageUrl.isNullOrEmpty ? <String>[question.imageUrl] : <String>[],
      isCorrect: false,
      mark: question.mark, //for gdm1.7
      maxMark: question.mark,
      soundUrl: question.soundUrl,
      videoUrl: question.videoUrl,
      totalLesson: question.totalLesson,
      lessons: question.lessons
    );

    if (question.answers != null) {
      for (final Answer item in question.answers!) {
        bool? isCorrect = item.isCorrect ? true : null;
        if (userAnswers != null) {
          final answerQuestion = userAnswers.firstWhereOrNull((element) => element.questionId == questionId);

          if (answerQuestion != null) {
            model.isCorrect = answerQuestion.isCorrect;
            if (isCorrect != true ||
                model.type == ExamQuestionTypeEnum.answerFillInput ||
                model.type == ExamQuestionTypeEnum.answerFillSelect) {
              isCorrect = (answerQuestion.answer ?? []).firstWhereOrNull((element) => element.id == item.id)?.isCorrect;
            } // Nếu người dùng chọn đáp án thì lấy true false  ở chọn

            if (answerQuestion.answer != null && answerQuestion.answer!.isNotEmpty) {
              model.userAnswer = <QuestionUserAnswer>[];
              for (final item in answerQuestion.answer!) {
                model.userAnswer.add(QuestionUserAnswer.fromExamUserAnswerRequestAnswer(item, model.type));
              }
            }
          }
        }

        final AnswerModel answerModel = AnswerModel(
          item.id,
          item.content,
          isCorrect,
          questionAnswer: item.questionAnswer,
          items: item.items,
          correctId: item.correctId,
          imageUrl: item.imageUrl,
          soundUrl: item.soundUrl,
          videoUrl: item.videoUrl,
        );
        model.answers.add(answerModel);
      }
    }

    if (model.type == ExamQuestionTypeEnum.answerEssay && userAnswers != null) {
      final questionAnswer = userAnswers.firstWhereOrNull((element) => element.questionId == model.id);
      if (questionAnswer != null && questionAnswer.answer != null && questionAnswer.answer!.isNotEmpty) {
        model.userAnswer = [QuestionUserAnswer.fromExamUserAnswerRequestAnswer(questionAnswer.answer![0], model.type)];
      }
    }

    if (question.childs != null && question.childs!.isNotEmpty) {
      model.childs = [];
      for (var item in question.childs!) {
        model.childs!.add(QuestionModel.getFromQuestion(_getQuestionFromQuestionChild(item)));
      }
    }

    return model;
  }

  @override
  List<Object> get props => <Object>[id, isChooseLate];
}

Question _getQuestionFromQuestionChild(Question question) {
  return Question(
    id: question.id,
    title: question.title,
    content: question.content,
    type: question.type,
    mark: question.mark,
    imageUrl: question.imageUrl,
    videoUrl: question.videoUrl,
    soundUrl: question.soundUrl,
    answers: question.listAnswers,
    childs: question.childs,
  );
}

class AnswerModel {
  String id;
  String content;
  bool? isCorrect; // đáp án đúng của đáp án
  String questionAnswer; // Dùng cho dạng nối
  String imageUrl;
  String soundUrl;
  String videoUrl;
  List<AnswerItems>? items; // Dạng Fill select
  String correctId;
  AnswerModel(this.id, this.content, this.isCorrect,
      {this.questionAnswer = "",
      this.imageUrl = "",
      this.items,
      this.correctId = "",
      this.soundUrl = "",
      this.videoUrl = ""});
}

// @JsonSerializable(includeIfNull: true)
// class AnswerTypeFillSelectItemModel {
//   String id;
//   String content;
//   AnswerTypeFillSelectItemModel(
//     this.id,
//     this.content,
//   );

//   factory AnswerTypeFillSelectItemModel.fromJson(Map<String, dynamic> json) =>
//       _$AnswerTypeFillSelectItemModelFromJson(json);
//   Map<String, dynamic> toJson() => _$AnswerTypeFillSelectItemModelToJson(this);
// }

class QuestionLinkModel {
  String id;
  String content;
  List<AnswerModel> answers;
  List<String>? images;
  String soundUrl;
  String videoUrl;

  QuestionLinkModel({
    this.id = "",
    this.content = "",
    required this.answers,
    this.images,
    this.soundUrl = "",
    this.videoUrl = "",
  });
  factory QuestionLinkModel.getFromAnswer(AnswerModel question) {
    final QuestionLinkModel model = QuestionLinkModel(
      id: question.id,
      content: question.content,
      answers: <AnswerModel>[],
      soundUrl: question.soundUrl,
      videoUrl: question.videoUrl,
      images: question.imageUrl.isNotEmpty ? [question.imageUrl] : null,
    );

    return model;
  }
}

class QuestionUserAnswer {
  int questionId; // Đối với câu hỏi tổng hợp
  String id;
  String answer;
  QuestionUserAnswer(this.id, {this.answer = "", this.questionId = 0});

  factory QuestionUserAnswer.fromExamUserAnswerRequestAnswer(
      AnswerUser userAnswerRequestAnswer, ExamQuestionTypeEnum type) {
    String answer = userAnswerRequestAnswer.data?.id ?? "";
    if (answer.isEmpty || type == ExamQuestionTypeEnum.answerFillInput || type == ExamQuestionTypeEnum.answerEssay) {
      answer = userAnswerRequestAnswer.data?.content ?? "";
    }
    return QuestionUserAnswer(userAnswerRequestAnswer.id, answer: answer);
  }
}
