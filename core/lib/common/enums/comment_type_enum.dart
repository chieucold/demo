// ignore_for_file: constant_identifier_names

enum CommentTypeEnum {
  Empty,
  Exam,
  Question,
  Event,
  Content,
  QuestionExplain,
  Course,
  ContestCriteria,
  ContestSubmission,
  GroupExamUser,
  ExamSet,
  GroupExam,
  Comment,
  ExamPackage,
  Contest,
  ExamResult,
  Competition,
  Group,
  File,
  BusinessLineTestCategory,
  ContestSubmissionPrivate,
  Author,
  CoursePackage, // Combo khóa học
  MessengerGroup,
  User,
  Guide,
  ContentInCategory
}

extension ParseToString on CommentTypeEnum {
  String getValueToString() {
    return toString().split('.').last;
  }
}
