class ApiUrlExam {
  //---
  static const String getPropertyFilterForExam =
      "/Exam/GetPropertyFilterForExam";
  static const String getRanking = "/UserExamResult/GetAll";
  static const String getUserExamNumberTimeResult =
      "/UserExamResult/GetUserExamNumberTimeResult";
  static const String getExamByEXamSet = "/ExamSet/GetExamByExamSet";
  static const String getRateInExam = "/UserExamResult/GetAllRateByExamId";
  static const String getExamStructureDetailByExamId =
      "/Exam/GetExamStructureDetailByExamId";
  static const String getUserRank = "/UserExamResult/GetUserExamResult";
  static const String getRateByUserExamId = "/Exam/GetRateByUserExamId";
  static const String createRate = "/Exam/AddRate";
  static const String updateRate = "/Exam/UpdateRate";
  static const String getDetailInfoExam = '/Exam/GetDetailInfoExam';
  static const String examAddResult = '/UserExamResult/CreateUserExamResult';
  static const String getReviewExamResult = '/Exam/GetReviewTheAnswerExam';
  static const String getAllExam = "/Exam/GetAll";
  static const String getAllExamSet = "/ExamSet/GetAll";
  static const String getExamResultByUser =
      "/UserExamResult/GetExamResultByUser";
  static const String getAllGroupHomework = '/Exam/GetAllGroupHomework';
  static const String examReaction = '/Exam/ReactionExam';
  static const String getUserExamResult = "/UserExamResult/GetUserExamResult";
  static const String getQuestionVersionById =
      "/Question/GetQuestionVersionById";
  static const String getQuestionExplainById =
      "/QuestionExplain/GetQuestionExplainById";
  static const String getQuestionExplain = "/QuestionExplain/GetById";
  static const String createQuestionExplain = "/QuestionExplain/Create";
  static const String updateQuestionExplain = "/QuestionExplain/Update";
  static const String reactionQuestionExplain =
      "/QuestionExplain/ReactionQuestionExplain";
  static const String registerExam = "/Exam/RegisterExam";
  static const String cancelRegisterExam = "/Exam/CancelRegisterExam";

  //-----
  static const String getCompetition = "/Competition/GetAllCompetition";
  static const String getCompetitionDetail =
      '/Competition/GetCompetitionDetail';
  static const String createCompetition = "/Competition/CreateCompetition";
  static const String getListUserRequest = "/Competition/GetListUserRequest";
  static const String getCompetitionUser = "/Competition/GetCompetitionUser";
  static const String getTotalCompetitionUser =
      "/Competition/GetTotalCompetitionUser";
  static const String getCompetitionNow =
      "/Competition/GetTimeCompetitionAlready";
  static const String countCompetitionInDay =
      "/Competition/CountCompetitionInDay";
  static const String joinCompetition = "/Competition/JoinCompetition";
  static const String getUserResultInCompetition =
      "/Competition/GetUerResultInCompetition";
  static const String getListUserResultInCompetition =
      "/Competition/GetListUerResultInCompetition";
  static const String getCompetitionRoundsInfo =
      "/Competition/GetCompetitionRoundsInfo";
  static const String getUserResultInCompetitionRound =
      "/Competition/GetUerResultInCompetitionRound";
  static const String getListUserResultInCompetitionRound =
      "/Competition/GetListUerResultInCompetitionRound";
  static const String createCompetitionInvite =
      "/Competition/CreateCompetitionInvite";
  static const String quitCompetition = "/Competition/QuitCompetition";
  static const String competitionDetailExam = "/Competition/GetDetailInfoExam";
  static const String competitionSendAnswer = "/Competition/SendAnswer";
  static const String competitionAcceptRequest =
      "/Competition/CompetitionAcceptRequest";
  static const String competitionDeclineRequest =
      "/Competition/CompetitionDeclineRequest";
  static const String checkInOtherCompetition = "/Competition/CheckWarning";
  static const String getUsersInCompetition =
      "/Competition/GetCompetitionUserPage";
  static const String startCompetition = "/Competition/StartCompetition";
  static const String kickUserFromCompetition =
      "/Competition/KickUserFromCompetition";

//----/exam_user.
  static const String getListMyGroup = "/GroupExam/GetListMyGroup";
  static const String getListExamByLimitation =
      "/GroupExam/getListExamByLimitation";
  static const String getGroupById = "/GroupExam/GetGroupById";
  static const String leaveGroup = "/GroupExam/LeaveGroup";
  static const String getExamsOfGroup = "/GroupExam/GetExamsOfGroup";
  static const String getInfoPersonalUser = "/GroupExam/GetInfoPersonalUser";
  static const String getListHistoryOfCurrentUser =
      "/GroupExam/GetListHistoryOfCurrentUser";
  static const String getCountExamByTab = "/GroupExam/CountExamByTab";
  static const String getCountExamByTabAdmin = "/GroupExam/CountExamByTabAdmin";
  static const String getListUserCompetedExam =
      "/GroupExam/GetListUserCompetedExam";
  static const String getListUserByGroupExamId =
      "/GroupExam/GetListUserByGroupExamId";
  static const String getCountUserByStatusOnGroupExam =
      "/GroupExam/CountUserByStatusOnGroupExam";
  static const String changeTimeDeadline = "/GroupExam/ChangeTimeDeadline";
  static const String commentExam = "/GroupExam/CommentExam";
  static const String inviteUserGroup = "/GroupExam/GroupInviteUser";
  static const String getListHistoryOfUser =
      "/GroupExam/GetListHistoryOfCurrentUser";
  static const String createExam = "/GroupExam/CreateExam";
  static const String reAssignExam = "/GroupExam/ReAssigneUsers";
  static const String assignUsers = "/GroupExam/AssigneUsers";
  static const String getInfoGroupExamUserResult =
      "/GroupExam/GetInfoGroupExamUserResult";
  static const String groupExamUserComment = "/GroupExam/CommentExam";
  static const String groupExamMarkQuestion = "/GroupExam/MarkQuestion";
  static const String groupExamCreateUserExamResult =
      "/GroupExam/CreateUserExamResult";
  static const String getInfoGroupExamUser = "/GroupExam/GetInfoGroupExamUser";
  static const String getDataAfterCompleteExam =
      "/GroupExam/GetDataAfterCompleteExam";
  static const String getAllExamNeedWork = "/GroupExam/GetAllExamNeedWork";

  //VHE10
  static const String getCountMyStore = "/ProfileMember/CountMyStore";
  static const String getCountTotal = "/ProfileMember/CountTotal";
  static const String countExamInMyStore = "/Exam/CountExamForTabInMyStore";
  static const String getListExamFavorite = "/Exam/GetListExamFavorite";
  static const String getInfoPersonalUserForChart =
      "/GroupExam/GetInfoPersonalUserForChart";

  //VHE12
  static const String getCountExamForTabInMyStore =
      '/Exam/CountExamForTabInMyStore';
  static const String getListMyExam = '/Exam/GetListMyExam';

  //MPP
  static const String getListExamPackage = '/ExamPackage/GetList';
  static const String getExamPackageDetail = '/ExamPackage/GetById';

  //VNH14
  static const String getListIsBuy = '/ExamPackage/GetListIsBuy';
}

