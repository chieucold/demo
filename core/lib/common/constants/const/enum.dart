extension ParseToStrings on Enum {
  String get getValue => toString().split('.').last;
}

enum LoadingEnum {
  event,
  banner,
  sale,
  blockGrid,
  blockList,
  groupWork,
  exam,
  list,
  loadingDefault,
}

enum ExamTypeEnum { empty, typeDefault, file }

enum CheckBoxTypeEnum { typeDefault, typeHaveNumber }

enum CompetitionFormatType { empty, oneRound, multiRound }

enum VCE10MyCompetitionType { today, waiting, history }

enum ChooseCategoryTypeEnum {
  empty,
  fromExamHome,
  fromCompetitive,
  fromCreateCompetitive,
  fromListExamCompetition,
  fromListExamPackage
}

enum CompetitionStatusEnum { empty, full, joined, future, upcoming, roomMaster }

enum CompetitionApiStatusEnum { notPlay, playing, completed, deleted }

enum CompetitionFormatTypeEnum { empty, oneRound, multiRound }

enum VDE1ExamSetTypeEnum { all, free, fee }

enum VCE10TabTypeEnum {
  toDay,
  pending,
  history,
  invitation,
}

enum CompetitionCreateTypeEnum { empty, oneRound, multiRound, roundOfMulti }

enum ExamQuestionTypeEnum {
  empty,
  questionCombine, //Câu hỏi tổng hợp (câu hỏi cha con)
  answerRadio, // Dạng chọn một đáp án
  answerCheckbox, // Dạng chọn nhiều
  answerFillInput, //Điền từ vào chỗ trống
  answerFillSelect, // Chọn từ vào chỗ trống
  answerOrder, // 'Sắp xếp thành câu hoàn chỉnh'
  answerOrderWord, // 'Sắp xếp từ thành câu hoàn chỉnh'
  answerSelectMeaningful, //'Chọn câu có nghĩa với từ cho trước'
  answerLinking, // 'Nối từ'
  answerClassify, //'Phân loại',
  answerWrite, //'Viết thành câu đầy đủ'
  answerEssay, // Tự luận
  answerFile // 'Tự luận'
}
enum VGE1TabEnum { all, admin }

enum VGE2TabTypeEnum { waitingWork, waitingScore, history }

enum VGE2StatusCompleteExamEnum { waiting, correct, wrong }

enum VGE2StatusWork { delivered, submitted, join }

enum VGE3TimeRequest { oneWeek, oneMonth, twoMonth }

enum VGE5StatusHistory { submitted, unSubmit }

enum VGE6TabTypeEnum { isStudent, isAdmin }

enum VGE6TabDetailPracticeEnum { all, submitted, unSubmit }

enum VGE6StatusTopicEnum { unSubmit, waitingMark, scored }

enum VGE6TabAdminGroupEnum { notExpired, expired }

enum UserInGroupEnum { deleted, active, invited, refuse }

enum OwnerTypeQuestionExplainEnum { empty, system, member }

enum GDM2TypeUpLoad { title, description, totalQuestion, totalScore, duration, typeOfAnswer }

enum CapacityType { B, KB, MB, GB, TB, PB, EB, ZB, YB }

enum EventUserOptionStatus { empty, waiting, accept, refuse } //waiting = 1, accept  =2, refuse = 3

enum TypePastEvent { empty, comingSoon, past, goingOn } // comingSoon = 1, past = 2

enum VEO2TabTypeEnum { join, upcoming, invitation, past, happening }

enum TypeEvent { none, online, offline } // online  =1, offline = 2

enum GDM2TypeShow { all, file }

enum MyExamStoreType { examSet, favoriteExam, createdExam, unfinishedExam, structureExamStore }

enum VHE8HomeEnum { home, group, competition, notification, library }

enum VHS6TypeWebView { info, changePassword, register, forgotPassword }

int incrementPageEnum(int enumIndex) => enumIndex + 1;

enum GroupExamUserStatusEnum {
  // Chờ làm bài

  wait,

  // Đã làm bài tập, Chờ chấm

  didTheHomework,

  // Đã chấm bài
  scored
}
enum TypeShowButtonRegisterEnum {
  // Làm bài thi =1
  startExam,
  // Đăng ký thi =2
  register,
  // Hủy đăng ký  =3
  cancelRegister,
  // Bài thi đã đóng =4
  close
}

enum ExamBelongEnum {
  free,
  examSet,
  examPackage
} // Free - tự do =0, examset - Thuộc nhóm bài thi = 1, ExamPackage = 2, thuộc gói thi

enum ExamStatusEnum {
  deleted,
  active,
  draft // delete = 0, active = 1, draft =2
}

enum CompetitionTypeEnum {
  input,
  file,
  competition
} // input  = 1 - Nhập tay, file = 2 - Tải file, competition =3 - Thi đấu

enum CompetitionRoundStatusEnum {
  notPlay,
  playing,
  hasCompleted,
  deleted
} // notPlay = 0 - chua thi dau,  playing = 1 - đang thi đấu, hasCompleted  =2 - đã thi đấu, deleted = 3 - đã xóa

enum CompetitionLimitUserEnum { noLimit, limit }

enum typeFilterDoExamEnum { empty, notDo, checkLate }

enum typeFilterViewExamEnum { empty, correct, incorrect, notDo, essay }

enum LoginType { Facebook, Google, Apple }

enum RankingTypeEnum {
  realTimeRanking,
  competitionRoundRanking,
  examRanking,
  historyRanking,
  categoryRanking,
  examResultRanking
}

enum SearchAllAppEnum { showTopKeyword, showSearchKeyword, showSearchResult }

enum ResultTypeEnum {
  empty,
  resultHistoryCompetition, // Kết quả cuộc thi đấu vce12
  resultCompetitionRound, // Kết quả của vòng đấu//vce15
  resultExamPractice, // sau khi hoàn thành bài thi luyện tập //vde9
  resultExamComplete, // Sau khi hoàn thành xong 1 đề //vge2
  resultExamHistory, // Kết quả lịch sử đã làm (đã được chấm điểm) vge4
  resultWaitingScore, // Các bài đã làm chờ nhận điểm - vge5,

}

enum ExamFromModuleEnum {
  practice,
  competition,
  group
} // UserExamResult/GetAll - formatType = Luyện tập, thi đấu, nhóm

enum DISCEnum { other, yes, no }

enum HollandEnumType { iAm, iCan, iLike }

enum MultiChoiceEnum { Holland, DISC, MBTI, MI, YGPI, HollandForParent, IQ }

enum GenderEnum { none, male, female, unknown }

enum AVL2TypeEnum { empty, author, partner } //tác giả, đối tác

enum TypeAuthorEnum { empty, personal, organization } //Cá nhân, tổ chúw

enum MessengerMessageFilterDirectionEnum { empty, before, after }

enum MessageSendingStatus {
  /// Message is being sent
  sending,

  /// Message is being updated
  updating,

  /// Message is being deleted
  deleting,

  /// Message failed to send
  failed,

  /// Message failed to updated
  // ignore: constant_identifier_names
  failed_update,

  /// Message failed to delete
  // ignore: constant_identifier_names
  failed_delete,

  /// Message correctly sent
  sent,
}

enum MessageTypeEnum {
  Text,
  File,
  Recall, //Thu hồi
  Location, //Vị trí
  Orther,
  Link,
  // Contact,
}

enum MessageActionTypeEnum {
  Read // Đã đọc
}

enum TwoFactorTypeEnum { authenticator, email, recovery, app, prompt }

enum MediaType { mp4, svgLocal, svgNetwork, pngLocal, pngNetwork, jpgNetwork, file, waiting, sticker }

enum StatusUpdateGroupEnum {
  none,
  leaveGroup,
  infoGroup,
}

enum TypeChooseGuideEnum { none, category, object }

enum MyCoursePublicType {
  none,
  all,
  active,
  wait,
}

enum CourseStyleEnum {
  none,
  free, //Miễn phí
  fee, //Trả phí
}

enum PaymentType {
  none,
  apple,
  web,
}

enum deviceTypeEnum {
  phone,
  tablet,
}

enum CalendarFormat { month, twoWeeks, week }

enum StartDayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

enum GuideDescriptionTypeEnum { none, CareerDirection, CareerHelp, CareerDictionary }

enum ReasonChooseCareerEnum { none, Care, CareerDevelopment, CareerLineDevelopment, Lastest }

enum jobSurveyStatus { none, hasJob, noJobYet }

enum RoleEvent { personal, organization }

enum FollowStatus {
  none,
  // Gửi yêu cầu
  Send,
  // Đang theo dõi
  Follow,
  // Từ chối yêu cầu
  Refuse,
}
