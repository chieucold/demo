import 'exam_api_models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'exam_api_enums.dart' as enums;
export 'exam_api_enums.dart';
export 'exam_api_models.dart';

part 'exam_api.g.dart';

// **************************************************************************
// The file is generated automatically. Do not edit files
// **************************************************************************

@RestApi()
abstract class ExamApi {
  factory ExamApi(Dio dio, {String baseUrl}) = _ExamApi;

  ///Lấy config hệ thống
  ///@param version
  @GET('/api/exam/v1.0/AppSetting/Init')
  Future<dynamic> appSettingInit();

  ///Lấy phiên bản trả về client (để thông báo cho người dùng cập nhật)
  ///@param version
  @GET('/api/exam/v1.0/AppSetting/Version')
  Future<dynamic> appSettingVersion();

  ///Force GC
  ///@param version
  @GET('/api/exam/v1.0/AppSetting/GC')
  Future<dynamic> appSettingGC();

  ///Lấy config hệ thống
  ///@param version
  @GET('/api/exam/v1.0/public/AppSetting/Init')
  Future<dynamic> appSettingInit();

  ///Lấy phiên bản trả về client (để thông báo cho người dùng cập nhật)
  ///@param version
  @GET('/api/exam/v1.0/public/AppSetting/Version')
  Future<dynamic> appSettingVersion();

  ///lấy danh sách phòng đấu
  ///@param Title
  ///@param Type
  ///@param Status
  ///@param ExamCategoryIds
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/Competition/GetAll')
  Future<CompetitionResourceFilterResult> competitionGetAll(
      {@Query('Title') String? title,
      @Query('Type') int? type,
      @Query('Status') int? status,
      @Query('ExamCategoryIds') List<String>? examCategoryIds,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///lấy thông tin phòng đấu
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/Competition/GetById')
  Future<CompetitionResource> competitionGetById({@Query('id') int? id});

  ///thêm mới phòng đấu
  ///@param version
  @POST('/api/exam/v1.0/Competition/CreateCompetition')
  Future<int> competitionCreateCompetition(
      {@Body() required CompetitionCreateResource? body});

  ///cập nhật phòng đấu
  ///@param version
  @PUT('/api/exam/v1.0/Competition/UpdateCompetition')
  Future<int> competitionUpdateCompetition(
      {@Body() required CompetitionUpdateResource? body});

  ///xóa phòng đấu
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/Competition/DeleteCompetition')
  Future<CompetitionResource> competitionDeleteCompetition(
      {@Query('id') int? id});

  ///lấy danh sách người dùng trong phòng
  ///@param Id
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/Competition/GetUserByCompetitionId')
  Future<dynamic> competitionGetUserByCompetitionId(
      {@Query('Id') int? id,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Lấy thuộc tính theo cây thư mục theo thuộc tính cha
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetPropertyTreeByParentPropertyId')
  Future<TreePropertyResource> competitionGetPropertyTreeByParentPropertyId(
      {@Query('id') int? id});

  ///Lấy thuộc tính theo danh mục
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetPropertyByCategoryId')
  Future<PropertyPublicResource> competitionGetPropertyByCategoryId(
      {@Query('id') int? id});

  ///Api lấy danh sách phòng thi đấu cho mobile
  ///@param PropertyIds
  ///@param FormatType
  ///@param UserId
  ///@param examCategoryId
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetAllCompetition')
  Future<CompetitionListPublicResourceFilterResult>
      competitionGetAllCompetition(
          {@Query('PropertyIds') List<int>? propertyIds,
          @Query('FormatType') int? formatType,
          @Query('UserId') int? userId,
          @Query('examCategoryId') int? examCategoryId,
          @Query('SortExpression') String? sortExpression,
          @Query('PageSize') int? pageSize,
          @Query('PageIndex') int? pageIndex});

  ///Lấy thời gian phòng thi đấu đã tham gia và sắp thi đấu gần nhất
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetTimeCompetitionAlready')
  Future<CompetitionAllReadyResource> competitionGetTimeCompetitionAlready();

  ///Api lấy danh sách phòng thi đấu cho mobile
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetCompetitionDetail')
  Future<CompetitionPublicDetailResource> competitionGetCompetitionDetail(
      {@Query('id') int? id});

  ///Api lấy danh sách phòng thi đấu dạng paging
  ///@param Id
  ///@param UserId
  ///@param KeyWord
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetCompetitionUserPage')
  Future<CompetitionUserPublicDetailResourceFilterResult>
      competitionGetCompetitionUserPage(
          {@Query('Id') int? id,
          @Query('UserId') int? userId,
          @Query('KeyWord') String? keyWord,
          @Query('SortExpression') String? sortExpression,
          @Query('PageSize') int? pageSize,
          @Query('PageIndex') int? pageIndex});

  ///Lấy danh sách tất cả user trong phòng thi đấu
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetCompetitionUserById')
  Future<List<CompetitionUserPublicDetailResource>>
      competitionGetCompetitionUserById({@Query('id') int? id});

  ///lấy thông tin phòng đấu
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetById')
  Future<CompetitionResource> competitionGetById({@Query('id') int? id});

  ///Tạo cuộc thi
  ///@param version
  @POST('/api/exam/v1.0/public/Competition/CreateCompetition')
  Future<int> competitionCreateCompetition(
      {@Body() required CompetitionCreateResource? body});

  ///Update cuộc thi
  ///@param version
  @PUT('/api/exam/v1.0/public/Competition/UpdateCompetition')
  Future<int> competitionUpdateCompetition(
      {@Body() required CompetitionUpdateResource? body});

  ///Xóa cuộc thi
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/public/Competition/DeleteCompetition')
  Future<CompetitionResource> competitionDeleteCompetition(
      {@Query('id') int? id});

  ///Xem lại đáp án của đề thi
  ///@param userExamResultId
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetReviewTheAnswerExam')
  Future<ExamInfoDetailPublicResource> competitionGetReviewTheAnswerExam(
      {@Query('userExamResultId') int? userExamResultId});

  ///Trả về dữ liệu cho biểu đồ
  ///@param userId
  ///@param competitonId
  ///@param fromDate
  ///@param toDate
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetInfoPersonalUserForChart')
  Future<dynamic> competitionGetInfoPersonalUserForChart(
      {@Query('userId') int? userId,
      @Query('competitonId') int? competitonId,
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate});

  ///Chấp nhận lời mời
  ///@param competitionId Id của vòng đấu
  ///@param version
  @PUT('/api/exam/v1.0/public/Competition/CompetitionAcceptRequest')
  Future<bool> competitionCompetitionAcceptRequest(
      {@Query('competitionId') int? competitionId});

  ///Join phòng đấu
  ///@param competitionId
  ///@param isInvited Là vào từ lời mời
  ///@param version
  @PUT('/api/exam/v1.0/public/Competition/JoinCompetition')
  Future<bool> competitionJoinCompetition(
      {@Query('competitionId') int? competitionId,
      @Query('isInvited') bool? isInvited});

  ///Bắt đầu phòng thi đấu
  ///@param competitionId
  ///@param version
  @PUT('/api/exam/v1.0/public/Competition/StartCompetition')
  Future<bool> competitionStartCompetition(
      {@Query('competitionId') int? competitionId});

  ///Check có đang ở trong 1 phòng nào đó ko? Nếu như đang tham gia phòng nào đó rồi mà phòng
  ///sắp tham gia nằm trong khoảng thời gian của phòng cũ thì trả về true không thì trả về false
  ///@param competitionId Id của phòng đấu sắp chuyển
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/CheckWarning')
  Future<bool> competitionCheckWarning(
      {@Query('competitionId') int? competitionId});

  ///Kick 1 user nào đó ra khỏi phòng (còn cần realtime)
  ///@param competitionId
  ///@param userId
  ///@param version
  @PUT('/api/exam/v1.0/public/Competition/KickUserFromCompetition')
  Future<bool> competitionKickUserFromCompetition(
      {@Query('competitionId') int? competitionId,
      @Query('userId') int? userId});

  ///Từ chối lời mời
  ///@param competitionId
  ///@param version
  @PUT('/api/exam/v1.0/public/Competition/CompetitionDeclineRequest')
  Future<bool> competitionCompetitionDeclineRequest(
      {@Query('competitionId') int? competitionId});

  ///Thêm lời mời
  ///@param version
  @POST('/api/exam/v1.0/public/Competition/CreateCompetitionInvite')
  Future<int> competitionCreateCompetitionInvite(
      {@Body() required CompetitionInvitedResource? body});

  ///Lấy danh sách user để mời
  ///@param KeyWord Từ khóa tìm kiếm
  ///@param CompetitionId Id phòng đấu
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetListUserRequest')
  Future<CompetitionUserPublicDetailResourceFilterResult>
      competitionGetListUserRequest(
          {@Query('KeyWord') String? keyWord,
          @Query('CompetitionId') int? competitionId,
          @Query('pageIndex') int? pageIndex,
          @Query('pageSize') int? pageSize});

  ///Lấy danh sách user để mời
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetListUserOnline')
  Future<dynamic> competitionGetListUserOnline();

  ///Thoát phòng đấu
  ///@param CompetitionId
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/QuitCompetition')
  Future<int> competitionQuitCompetition(
      {@Query('CompetitionId') int? competitionId});

  ///lấy danh sách phòng đấu của user
  ///@param StartDate
  ///@param EndDate
  ///@param Type
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetCompetitionUser')
  Future<CompetitionUserPublicResourceFilterResult>
      competitionGetCompetitionUser(
          {@Query('StartDate') String? startDate,
          @Query('EndDate') String? endDate,
          @Query('Type') int? type,
          @Query('SortExpression') String? sortExpression,
          @Query('PageSize') int? pageSize,
          @Query('PageIndex') int? pageIndex});

  ///lấy tổng số phòng đấy của user
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetTotalCompetitionUser')
  Future<CompetitionDataResource> competitionGetTotalCompetitionUser();

  ///đếm số lượng phòng đấu trong ngày
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/CountCompetitionInDay')
  Future<int> competitionCountCompetitionInDay();

  ///lưu thông tin trả lời của user
  ///@param version
  @POST('/api/exam/v1.0/public/Competition/SendAnswer')
  Future<bool> competitionSendAnswer(
      {@Body() required CompetitionQuestionUser? body});

  ///Lấy ra đề thi của phòng đấu
  ///@param competitionId Id của phòng đấu
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetDetailInfoExam')
  Future<dynamic> competitionGetDetailInfoExam(
      {@Query('competitionId') int? competitionId});

  ///Lấy thông tin phòng đấu và điểm của user hiện tại
  ///@param compettionId
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetUerResultInCompetition')
  Future<CompettionResultResource> competitionGetUerResultInCompetition(
      {@Query('compettionId') int? compettionId});

  ///Lấy danh sách điểm, rank, thời gian của người tham gia trong phòng đấu
  ///@param competitionId
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetListUerResultInCompetition')
  Future<CompetitionUsersResultResource>
      competitionGetListUerResultInCompetition(
          {@Query('competitionId') int? competitionId,
          @Query('SortExpression') String? sortExpression,
          @Query('PageSize') int? pageSize,
          @Query('PageIndex') int? pageIndex});

  ///Lấy thông tin vòng đấu và điểm của user hiện tại
  ///@param compettionId
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetCompetitionRoundsInfo')
  Future<List<CompetitionRoundListResource>>
      competitionGetCompetitionRoundsInfo(
          {@Query('compettionId') int? compettionId});

  ///Lấy thông tin vòng đấu và điểm của user hiện tại
  ///@param compettionRoundId
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetUerResultInCompetitionRound')
  Future<CompettionResultResource> competitionGetUerResultInCompetitionRound(
      {@Query('compettionRoundId') int? compettionRoundId});

  ///Lấy danh sách điểm, rank, thời gian của người tham gia trong vòng đấu
  ///@param competitionRoundId
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/GetListUerResultInCompetitionRound')
  Future<CompetitionUsersResultResource>
      competitionGetListUerResultInCompetitionRound(
          {@Query('competitionRoundId') int? competitionRoundId,
          @Query('SortExpression') String? sortExpression,
          @Query('PageSize') int? pageSize,
          @Query('PageIndex') int? pageIndex});

  ///Đếm số lượng trận đấu mà user đã tham gia
  ///@param version
  @GET('/api/exam/v1.0/public/Competition/CountCompetitionUser')
  Future<int> competitionCountCompetitionUser();

  ///Lấy danh sách cuộc thi
  ///@param Title
  ///@param Organizer
  ///@param StartDate
  ///@param EndDate
  ///@param Status
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/Contest/GetAll')
  Future<ContestResourceFilterResult> contestGetAll(
      {@Query('Title') String? title,
      @Query('Organizer') String? organizer,
      @Query('StartDate') String? startDate,
      @Query('EndDate') String? endDate,
      @Query('Status') int? status,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Tạo mới cuộc thi
  ///@param version
  @POST('/api/exam/v1.0/Contest/Create')
  Future<int> contestCreate({@Body() required ContestCreateResource? body});

  ///Chỉnh sửa cuộc thi
  ///@param version
  @PUT('/api/exam/v1.0/Contest/Update')
  Future<int> contestUpdate({@Body() required ContestUpdateResource? body});

  ///Xóa cuộc thi (chỉ cập nhật lại trạng thái)
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/Contest/Delete')
  Future<int> contestDelete({@Query('id') int? id});

  ///Lấy thông tin cuộc thi
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/Contest/GetById')
  Future<ContestUpdateResource> contestGetById({@Query('id') int? id});

  ///Lấy danh sách bài dự thi
  ///@param Title
  ///@param Status
  ///@param ContestId
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/ContestSubmission/GetAll')
  Future<ContestSubmissionResourceFilterResult> contestSubmissionGetAll(
      {@Query('Title') String? title,
      @Query('Status') int? status,
      @Query('ContestId') int? contestId,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Tạo mới bài dự thi
  ///@param version
  @POST('/api/exam/v1.0/ContestSubmission/Create')
  Future<int> contestSubmissionCreate(
      {@Body() required ContestSubmissionCreateResource? body});

  ///Lấy thông tin bài dự thi
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/ContestSubmission/GetById')
  Future<ContestSubmissionUpdateResource> contestSubmissionGetById(
      {@Query('id') int? id});

  ///Chỉnh sửa thông tin bài dự thi
  ///@param version
  @PUT('/api/exam/v1.0/ContestSubmission/Update')
  Future<int> contestSubmissionUpdate(
      {@Body() required ContestSubmissionUpdateResource? body});

  ///Xóa bài dự thi (chỉ cập nhật lại trạng thái)
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/ContestSubmission/Delete')
  Future<int> contestSubmissionDelete({@Query('id') int? id});

  ///lấy ra danh sách sự kiện trong hệ thống
  ///@param version
  @POST('/api/exam/v1.0/public/Event/GetAllEvent')
  Future<List<EventResourcePublic>> eventGetAllEvent(
      {@Body() required EventPublicFilterResource? body});

  ///lấy danh sách đề thi
  ///@param Ids
  ///@param Title
  ///@param Duration
  ///@param ExamLevel
  ///@param ShareMode
  ///@param ExamLimit
  ///@param ExamCategory
  ///@param ExamType
  ///@param KeyWord
  ///@param Status
  ///@param Type
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/Exam/GetAll')
  Future<ExamResourceFilterResult> examGetAll(
      {@Query('Ids') List<int>? ids,
      @Query('Title') String? title,
      @Query('Duration') int? duration,
      @Query('ExamLevel') int? examLevel,
      @Query('ShareMode') int? shareMode,
      @Query('ExamLimit') int? examLimit,
      @Query('ExamCategory') List<int>? examCategory,
      @Query('ExamType') int? examType,
      @Query('KeyWord') String? keyWord,
      @Query('Status') int? status,
      @Query('Type') int? type,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///lấy thông tin đề thi
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/Exam/GetById')
  Future<ExamResource> examGetById({@Query('id') int? id});

  ///xem thông tin đề thi
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/Exam/GetPreviewById')
  Future<ExamPreviewResource> examGetPreviewById({@Query('id') int? id});

  ///thêm mới đề thi
  ///@param version
  @POST('/api/exam/v1.0/Exam/CreateExam')
  Future<int> examCreateExam({@Body() required ExamCreateResource? body});

  ///cập nhật đề thi
  ///@param version
  @PUT('/api/exam/v1.0/Exam/UpdateExam')
  Future<int> examUpdateExam({@Body() required ExamUpdateResource? body});

  ///xóa đề thi
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/Exam/DeleteExam')
  Future<ExamResource> examDeleteExam({@Query('id') int? id});

  ///sinh câu hỏi tự động
  ///@param version
  @POST('/api/exam/v1.0/Exam/GetAutoQuestionForStruct')
  Future<List<ExamStructureQuestion>> examGetAutoQuestionForStruct(
      {@Body() required List<ExamStructureQuestion>? body});

  ///Init ElasticSearch
  ///@param isCreate
  ///@param version
  @PUT('/api/exam/v1.0/Exam/InintES')
  Future<int> examInintES({@Query('isCreate') bool? isCreate});

  ///Init ElasticSearch All (Hải test)
  ///@param isCreate
  ///@param version
  @PUT('/api/exam/v1.0/Exam/InintESAll')
  Future<int> examInintESAll({@Query('isCreate') bool? isCreate});

  ///Lấy danh sách đề thi
  ///@param version
  @POST('/api/exam/v1.0/public/Exam/GetAll')
  Future<ExamBaseResourceFilterResult> examGetAll(
      {@Body() required ExamBaseFilterResource? body});

  ///Lấy số lượng đề thi
  ///@param version
  @POST('/api/exam/v1.0/public/Exam/GetAllValueCount')
  Future<int> examGetAllValueCount(
      {@Body() required ExamBaseFilterResource? body});

  ///Lấy thông tin đề thi
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetById')
  Future<ExamBaseDetailResource> examGetById({@Query('id') int? id});

  ///Lấy thông tin question trong đề thi
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetExamQuestionById')
  Future<ExamDetailResource> examGetExamQuestionById({@Query('id') int? id});

  ///Lấy danh sách bài tập về nhà
  ///@param Title
  ///@param Status
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetAllGroupHomework')
  Future<ExamGroupHomeworkResourceFilterResult> examGetAllGroupHomework(
      {@Query('Title') String? title,
      @Query('Status') int? status,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Lấy bộ lọc của đề thi và bộ đề thi
  ///@param examCategoryId
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetPropertyFilterForExam')
  Future<List<PropertyDetailTreeExt>> examGetPropertyFilterForExam(
      {@Query('examCategoryId') int? examCategoryId});

  ///Get danh sách cấu trúc phân loại thuộc tính đề thi, mô tả đề thi, thông tin user theo examid
  ///@param examId
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetExamStructureDetailByExamId')
  Future<ExamInfo> examGetExamStructureDetailByExamId(
      {@Query('examId') int? examId});

  ///Thêm đánh giá
  ///@param version
  @POST('/api/exam/v1.0/public/Exam/AddRate')
  Future<dynamic> examAddRate({@Body() required RateSaveResouce? body});

  ///Chỉnh sửa đánh giá
  ///@param version
  @PUT('/api/exam/v1.0/public/Exam/UpdateRate')
  Future<dynamic> examUpdateRate({@Body() required RateSaveResouce? body});

  ///Lấy đánh giá theo id
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetRateById')
  Future<dynamic> examGetRateById({@Query('id') String? id});

  ///Lấy đánh giá của người dùng trong bài thi. Nếu chưa có đánh giá thì trả về rỗng
  ///@param examId Id Exam
  ///@param userId
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetRateByUserExamId')
  Future<dynamic> examGetRateByUserExamId(
      {@Query('examId') int? examId, @Query('userId') int? userId});

  ///Xóa đánh giá
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/public/Exam/DeleteRate')
  Future<dynamic> examDeleteRate({@Query('id') String? id});

  ///Lấy thông tin chi tiết của đề thi
  ///@param examId
  ///@param isTeacher
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetDetailInfoExam')
  Future<ExamInfoDetailPublicResource> examGetDetailInfoExam(
      {@Query('examId') int? examId, @Query('isTeacher') bool? isTeacher});

  ///Xem lại đáp án của đề thi
  ///@param userExamResultId
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetReviewTheAnswerExam')
  Future<ExamInfoDetailPublicResource> examGetReviewTheAnswerExam(
      {@Query('userExamResultId') int? userExamResultId});

  ///Like và unlike exam
  ///@param ExamId
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/ReactionExam')
  Future<bool> examReactionExam({@Query('ExamId') int? examId});

  ///Đếm số lượng theo tab
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/CountExamForTabInMyStore')
  Future<Object> examCountExamForTabInMyStore();

  ///Trả về danh sách đề thi yêu thích
  ///@param version
  @POST('/api/exam/v1.0/public/Exam/GetListExamFavorite')
  Future<ExamBaseResourceFilterResult> examGetListExamFavorite(
      {@Body() required ExamBaseFilterResource? body});

  ///Trả về danh sách đề của tôi
  ///@param version
  @POST('/api/exam/v1.0/public/Exam/GetListMyExam')
  Future<ExamBaseResourceFilterResult> examGetListMyExam(
      {@Body() required MyExamFilterResource? body});

  ///Trả về dữ liệu cho biểu đồ
  ///@param userId
  ///@param fromDate
  ///@param toDate
  ///@param version
  @GET('/api/exam/v1.0/public/Exam/GetInfoPersonalUserForChart')
  Future<dynamic> examGetInfoPersonalUserForChart(
      {@Query('userId') int? userId,
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate});

  ///Đăng ký thi
  ///@param examId
  ///@param version
  @POST('/api/exam/v1.0/public/Exam/RegisterExam')
  Future<bool> examRegisterExam({@Query('examId') int? examId});

  ///Hủy đăng ký thi
  ///@param examId
  ///@param version
  @POST('/api/exam/v1.0/public/Exam/CancelRegisterExam')
  Future<bool> examCancelRegisterExam({@Query('examId') int? examId});

  ///Trả về danh sách theo bộ lọc
  ///@param version
  @POST('/api/exam/v1.0/public/ExamPackage/GetList')
  Future<dynamic> examPackageGetList(
      {@Body() required ExamPackageFilterResource? body});

  ///Trả về thông tin chi tiết gói thi
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/ExamPackage/GetById')
  Future<ExamPackagePublicResource> examPackageGetById({@Query('id') int? id});

  ///Trả về danh sách người mua gói thi
  ///@param version
  @GET('/api/exam/v1.0/public/ExamPackage/GetListMemberByExamPackageId')
  Future<dynamic> examPackageGetListMemberByExamPackageId(
      {@Body() required MemberInExamPackageFilterResource? body});

  ///Trả ra tree category
  ///@param expandLevel
  ///@param version
  @GET('/api/exam/v1.0/public/ExamPackage/GetListCategoryInExamPackage')
  Future<dynamic> examPackageGetListCategoryInExamPackage(
      {@Query('expandLevel') int? expandLevel});

  ///Trả về danh sách nhóm bài thi
  ///@param KeyWord
  ///@param Status
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/ExamSet/GetAll')
  Future<ExamSetResourceFilterResult> examSetGetAll(
      {@Query('KeyWord') String? keyWord,
      @Query('Status') int? status,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Trả về thông tin chi tiết nhóm bài thi theo Id
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/ExamSet/GetExamSetById')
  Future<ExamUpdateResource> examSetGetExamSetById({@Query('id') int? id});

  ///Trả về danh sách bài thi theo list Id
  ///@param examIds
  ///@param version
  @GET('/api/exam/v1.0/ExamSet/GetExamByIds')
  Future<List<ExamResource>> examSetGetExamByIds(
      {@Query('examIds') List<int>? examIds});

  ///Tạo nhóm bài thi
  ///@param version
  @POST('/api/exam/v1.0/ExamSet/CreateExamSet')
  Future<int> examSetCreateExamSet(
      {@Body() required ExamSetCreateResource? body});

  ///Cập nhật nhóm bài thi
  ///@param version
  @PUT('/api/exam/v1.0/ExamSet/UpdateExamSet')
  Future<int> examSetUpdateExamSet(
      {@Body() required ExamSetUpdateResource? body});

  ///Xóa nhóm bài thi
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/ExamSet/DeleteExamSet')
  Future<ExamResource> examSetDeleteExamSet({@Query('id') int? id});

  ///Trả về danh sách người dùng trong nhóm bài thi theo Id nhóm bài thi
  ///@param MemberId
  ///@param ExamSetId
  ///@param StartDate
  ///@param EndDate
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/ExamSet/GetListMemberInExamSetByExamSetId')
  Future<MemberInExamSetEntity> examSetGetListMemberInExamSetByExamSetId(
      {@Query('MemberId') int? memberId,
      @Query('ExamSetId') int? examSetId,
      @Query('StartDate') String? startDate,
      @Query('EndDate') String? endDate,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Trả về thông tin chi tiết người dùng trong nhóm bài thi theo Id
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/ExamSet/GetMemberInExamSetById')
  Future<MemberInExamSetEntity> examSetGetMemberInExamSetById(
      {@Query('id') int? id});

  ///Thêm người dùng vào nhóm bài thi
  ///@param version
  @POST('/api/exam/v1.0/ExamSet/CreateMemberInExamSet')
  Future<SaveMemberInExamSetResource> examSetCreateMemberInExamSet(
      {@Body() required SaveMemberInExamSetResource? body});

  ///Xóa người dùng trong nhóm bài thi
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/ExamSet/DeleteMemberInExamSet')
  Future<MemberInExamSetEntity> examSetDeleteMemberInExamSet(
      {@Query('id') int? id});

  ///Lấy danh sách bộ đề thi
  ///@param Title
  ///@param IsFree
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/ExamSet/GetAll')
  Future<ExamSetDataResource> examSetGetAll(
      {@Query('Title') String? title,
      @Query('IsFree') bool? isFree,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Lấy danh sách đề thi trong bộ đề
  ///@param ExamIds
  ///@param PropertyDetails
  ///@param ExamSetId
  ///@param ExamCategoryId
  ///@param Status
  ///@param keyWord
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/ExamSet/GetExamByExamSet')
  Future<ExamBaseResourceFilterResult> examSetGetExamByExamSet(
      {@Query('ExamIds') List<int>? examIds,
      @Query('PropertyDetails') List<int>? propertyDetails,
      @Query('ExamSetId') int? examSetId,
      @Query('ExamCategoryId') int? examCategoryId,
      @Query('Status') int? status,
      @Query('keyWord') String? keyWord,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Lấy thông tin bộ đề
  ///@param examSetId
  ///@param version
  @GET('/api/exam/v1.0/public/ExamSet/GetInfoExamSet')
  Future<ExamSetInfoPublicResource> examSetGetInfoExamSet(
      {@Query('examSetId') int? examSetId});

  ///Like và unlike examSet
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/ExamSet/ReactionExamSet')
  Future<bool> examSetReactionExamSet({@Query('id') int? id});

  ///Lấy danh sách cấu trúc đề
  ///@param KeyWord
  ///@param Title
  ///@param OwnerType
  ///@param Status
  ///@param IsPublic
  ///@param ShowAdvanceSearch
  ///@param categoryIds
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/ExamStructure/GetAll')
  Future<List<ExamStructureListResource>> examStructureGetAll(
      {@Query('KeyWord') String? keyWord,
      @Query('Title') String? title,
      @Query('OwnerType') int? ownerType,
      @Query('Status') int? status,
      @Query('IsPublic') int? isPublic,
      @Query('ShowAdvanceSearch') bool? showAdvanceSearch,
      @Query('categoryIds') List<int>? categoryIds,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Lấy chi tiết cấu trúc đề
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/ExamStructure/GetById')
  Future<List<ExamStructureDetailResource>> examStructureGetById(
      {@Query('id') int? id});

  ///Xóa cấu trúc đề
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/ExamStructure/Delete')
  Future<List<ExamStructureListResource>> examStructureDelete(
      {@Query('id') int? id});

  ///Cập nhật dữ liệu cấu trúc đề
  ///@param id
  ///@param version
  @PUT('/api/exam/v1.0/ExamStructure/Update')
  Future<List<ExamStructureListResource>> examStructureUpdate(
      {@Query('id') int? id,
      @Body() required ExamStructureUpdateResource? body});

  ///Thêm mới cấu trúc đề
  ///@param version
  @POST('/api/exam/v1.0/ExamStructure/Create')
  Future<ExamStructureListResource> examStructureCreate(
      {@Body() required ExamStructureCreateResource? body});

  ///Lấy ra danh sách cấu trúc đề theo phân loại
  ///@param examCategoryIds
  ///@param version
  @GET('/api/exam/v1.0/ExamStructure/GetListExamStructure')
  Future<List<SelectExamStructItem>> examStructureGetListExamStructure(
      {@Query('examCategoryIds') List<int>? examCategoryIds});

  ///Trả về danh sách bài thi của nhóm theo từng người dùng
  ///@param groupId
  ///@param filterType GroupExamTabEnum
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetExamsOfGroup')
  Future<GroupExamResourceFilterResult> groupExamGetExamsOfGroup(
      {@Query('groupId') int? groupId,
      @Query('filterType') int? filterType,
      @Query('pageIndex') int? pageIndex,
      @Query('pageSize') int? pageSize});

  ///Tạo mới, cập nhật nhóm
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/Update')
  Future<GroupExamEntity> groupExamUpdate(
      {@Body() required GroupExamEntity? body});

  ///Xóa
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/public/GroupExam/Delete')
  Future<QuestionExplainResource> groupExamDelete({@Query('id') int? id});

  ///Thêm bài thi vào nhóm
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/AddExamToGroup')
  Future<dynamic> groupExamAddExamToGroup(
      {@Body() required AddExamToGroupResource? body});

  ///Thêm nhiều bài thi vào nhóm
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/AddExamsToGroup')
  Future<dynamic> groupExamAddExamsToGroup(
      {@Body() required AddExamToGroupResource? body});

  ///Thêm nhóm
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/SaveGroup')
  Future<bool> groupExamSaveGroup({@Body() required GroupInfoEntity? body});

  ///Trả về danh sách group của user
  ///@param isAdmin
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetListMyGroup')
  Future<MyGroupPagingResource> groupExamGetListMyGroup(
      {@Query('isAdmin') bool? isAdmin,
      @Query('pageIndex') int? pageIndex,
      @Query('pageSize') int? pageSize});

  ///Lấy chi tiết nhóm
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetGroupById')
  Future<GroupDetailEntity> groupExamGetGroupById({@Query('id') int? id});

  ///Thêm người dùng vào group
  ///@param userId
  ///@param groupId
  ///@param roleId
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/GroupAddUser')
  Future<bool> groupExamGroupAddUser(
      {@Query('userId') int? userId,
      @Query('groupId') int? groupId,
      @Query('roleId') int? roleId});

  ///Xóa người dùng khỏi group
  ///@param userId
  ///@param groupId
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/GroupRemoveUser')
  Future<bool> groupExamGroupRemoveUser(
      {@Query('userId') int? userId, @Query('groupId') int? groupId});

  ///Mời bạn bè
  ///@param userId
  ///@param groupId
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/GroupInviteUser')
  Future<bool> groupExamGroupInviteUser(
      {@Query('userId') int? userId, @Query('groupId') int? groupId});

  ///Phản hồi lời mời - lời đề nghị tham gia nhóm
  ///@param userId
  ///@param groupId
  ///@param accept
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/GroupReplyToInvitation')
  Future<bool> groupExamGroupReplyToInvitation(
      {@Query('userId') int? userId,
      @Query('groupId') int? groupId,
      @Query('accept') bool? accept});

  ///Xóa nhóm
  ///@param groupId
  ///@param version
  @DELETE('/api/exam/v1.0/public/GroupExam/RemoveGroup')
  Future<bool> groupExamRemoveGroup({@Query('groupId') int? groupId});

  ///Rời khỏi nhóm
  ///@param groupId
  ///@param version
  @DELETE('/api/exam/v1.0/public/GroupExam/LeaveGroup')
  Future<bool> groupExamLeaveGroup({@Query('groupId') int? groupId});

  ///Trả về thông tin: Thành tích học tập của 1 thành viên trong nhóm
  ///@param userId
  ///@param groupId
  ///@param pageIndex
  ///@param pageSize
  ///@param fromDate
  ///@param toDate
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetInfoPersonalUser')
  Future<GroupExamUserResourceFilterResult> groupExamGetInfoPersonalUser(
      {@Query('userId') int? userId,
      @Query('groupId') int? groupId,
      @Query('pageIndex') int? pageIndex,
      @Query('pageSize') int? pageSize,
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate});

  ///Trả về dữ liệu cho biểu đồ
  ///@param userId
  ///@param groupId
  ///@param fromDate
  ///@param toDate
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetInfoPersonalUserForChart')
  Future<dynamic> groupExamGetInfoPersonalUserForChart(
      {@Query('userId') int? userId,
      @Query('groupId') int? groupId,
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate});

  ///Trả về danh sách người dùng theo trạng thái bài thi: Đã hoàn thành, đã nộp bài chờ chấm...(GroupExamUserStatusEnum)
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/GetListUserByGroupExamId')
  Future<GroupExamUserResourceFilterResult> groupExamGetListUserByGroupExamId(
      {@Body() required GroupExamUserFilterResource? body});

  ///Trả về danh sách user được giao làm bài thi trong nhóm
  ///@param groupExamId
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetListUserAssignedExam')
  Future<List<SimpleUserEntity>> groupExamGetListUserAssignedExam(
      {@Query('groupExamId') int? groupExamId,
      @Query('pageIndex') int? pageIndex,
      @Query('pageSize') int? pageSize});

  ///Trả về thông tin chi tiết đề thi mà user được giao trong nhóm
  ///@param groupExamId
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetInfoGroupExamUser')
  Future<dynamic> groupExamGetInfoGroupExamUser(
      {@Query('groupExamId') int? groupExamId});

  ///Hàm lấy ra thông tin của người dùng trong một bài tập lúc xem kết quả
  ///@param groupExamId
  ///@param userId Nếu không truyền lên sẽ lấy userId hiện tại
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetInfoGroupExamUserResult')
  Future<dynamic> groupExamGetInfoGroupExamUserResult(
      {@Query('groupExamId') int? groupExamId, @Query('userId') int? userId});

  ///Đếm số lượng bài thi theo tab
  ///@param groupId
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/CountExamByTab')
  Future<Object> groupExamCountExamByTab({@Query('groupId') int? groupId});

  ///Trả về lịch sử thi của user
  ///@param groupId
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetListHistoryOfCurrentUser')
  Future<GroupExamUserResourceFilterResult>
      groupExamGetListHistoryOfCurrentUser(
          {@Query('groupId') int? groupId,
          @Query('pageIndex') int? pageIndex,
          @Query('pageSize') int? pageSize});

  ///Like và unlike bài thi trong nhóm
  ///@param groupExamId
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/ReactionExam')
  Future<dynamic> groupExamReactionExam(
      {@Query('groupExamId') int? groupExamId});

  ///Like và unlike bài thi trong nhóm
  ///@param groupExamId
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/IsReaction')
  Future<bool> groupExamIsReaction({@Query('groupExamId') int? groupExamId});

  ///Trả về số lượng nhóm mà user tham gia
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/CountMyGroup')
  Future<int> groupExamCountMyGroup();

  ///Trả về danh sách bài tập cần làm (Cho màn trang chủ)
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetAllExamNeedWork')
  Future<dynamic> groupExamGetAllExamNeedWork(
      {@Query('pageIndex') int? pageIndex, @Query('pageSize') int? pageSize});

  ///Lưu thông tin kết quả thi của người dùng
  ///@param groupExamUserId
  ///@param version
  @PUT('/api/exam/v1.0/public/GroupExam/CreateUserExamResult')
  Future<int> groupExamCreateUserExamResult(
      {@Query('groupExamUserId') int? groupExamUserId,
      @Body() required UserAnswerResultPublicResource? body});

  ///Trả về thông tin sau khi hoàn thành bài thi
  ///@param groupExamUserId
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetDataAfterCompleteExam')
  Future<dynamic> groupExamGetDataAfterCompleteExam(
      {@Query('groupExamUserId') int? groupExamUserId});

  ///Giao bài thi cho thành viên trong nhóm
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/AssigneUsers')
  Future<bool> groupExamAssigneUsers(
      {@Body() required AssigneUsersResource? body});

  ///Giao lại bài thi cho thành viên trong nhóm
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/ReAssigneUsers')
  Future<bool> groupExamReAssigneUsers(
      {@Body() required AssigneUsersResource? body});

  ///Thêm nhận xét cho bài làm
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/CommentExam')
  Future<dynamic> groupExamCommentExam(
      {@Body() required SaveCommentExamResource? body});

  ///Trả về nhận xét
  ///@param groupExamUserId
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/GetCommentExam')
  Future<String> groupExamGetCommentExam(
      {@Query('groupExamUserId') int? groupExamUserId});

  ///Gia hạn thời gian nộp bài
  ///@param groupExamId
  ///@param endDate
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/ChangeTimeDeadline')
  Future<dynamic> groupExamChangeTimeDeadline(
      {@Query('groupExamId') int? groupExamId,
      @Query('endDate') String? endDate});

  ///Chấm điểm cho câu hỏi
  ///@param groupExamUserId
  ///@param version
  @PUT('/api/exam/v1.0/public/GroupExam/MarkQuestion')
  Future<dynamic> groupExamMarkQuestion(
      {@Query('groupExamUserId') int? groupExamUserId,
      @Body() required List<UserAnswerEntity>? body});

  ///Trả về số lượng câu hỏi theo loại (Màn chấm bài thi)
  ///@param groupExamUserId
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/CountQuestionByTab')
  Future<Object> groupExamCountQuestionByTab(
      {@Query('groupExamUserId') int? groupExamUserId});

  ///Đếm số lượng bài thi theo tab màn QTV
  ///@param groupId
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/CountExamByTabAdmin')
  Future<Object> groupExamCountExamByTabAdmin({@Query('groupId') int? groupId});

  ///Đếm số người người dùng theo trạng thái trong 1 bài thi
  ///@param groupExamId
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/CountUserByStatusOnGroupExam')
  Future<Object> groupExamCountUserByStatusOnGroupExam(
      {@Query('groupExamId') int? groupExamId});

  ///Trả về danh sách bài thi cho màn QTV theo thời hạn
  ///@param groupId
  ///@param filterType
  ///@param fromDate
  ///@param toDate
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExam/GetListExamByLimitation')
  Future<dynamic> groupExamGetListExamByLimitation(
      {@Query('groupId') int? groupId,
      @Query('filterType') int? filterType,
      @Query('fromDate') String? fromDate,
      @Query('toDate') String? toDate,
      @Query('pageIndex') int? pageIndex,
      @Query('pageSize') int? pageSize});

  ///Tạo đề thi bằng file trong nhóm
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExam/CreateExam')
  Future<int> groupExamCreateExam({@Body() required ExamCreateResource? body});

  ///chỉnh sửa
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExamUser/Update')
  Future<GroupExamUserEntity> groupExamUserUpdate(
      {@Body() required GroupExamUserEntity? body});

  ///Thêm mới
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExamUser/Create')
  Future<GroupExamUserEntity> groupExamUserCreate(
      {@Body() required GroupExamUserEntity? body});

  ///Xóa
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/public/GroupExamUser/Delete')
  Future<int> groupExamUserDelete({@Query('id') int? id});

  ///Cập nhật trạng thái
  ///@param groupExamUserId
  ///@param status
  ///@param version
  @POST('/api/exam/v1.0/public/GroupExamUser/UpdateStatus')
  Future<bool> groupExamUserUpdateStatus(
      {@Query('groupExamUserId') int? groupExamUserId,
      @Query('status') int? status});

  ///
  ///@param groupId
  ///@param userId
  ///@param version
  @GET('/api/exam/v1.0/public/GroupExamUser/GetListByUserId')
  Future<dynamic> groupExamUserGetListByUserId(
      {@Query('groupId') int? groupId, @Query('userId') int? userId});

  ///Tạo index vào elastic search
  ///@param version
  @POST('/api/exam/v1.0/indices/create')
  Future<IActionResult> indicesCreate({@Body() required IndexCreate? body});

  ///Reindex: Đồng bộ lại toàn bộ dữ liệu vào index elastic search
  ///@param index
  ///@param version
  @PUT('/api/exam/v1.0/indices/reindex')
  Future<int> indicesReindex({@Query('index') String? index});

  ///lấy thông tin danh sách sản phẩm
  ///@param version
  @POST('/api/exam/v1.0/public/Product/GetProductByObject')
  Future<List<ProductResource>> productGetProductByObject(
      {@Body() required List<ProductRequest>? body});

  ///Đếm số lượng màn cá nhân (Thông tin thành viên)
  ///@param version
  @GET('/api/exam/v1.0/public/ProfileMember/CountTotal')
  Future<dynamic> profileMemberCountTotal();

  ///Lấy ra tât cả
  ///@param version
  @GET('/api/exam/v1.0/Property/GetAll')
  Future<List<PropertyListResource>> propertyGetAll();

  ///Lấy list Property theo parentId
  ///@param version
  @POST('/api/exam/v1.0/Property/GetListPropertyByParent')
  Future<List<PropertyListResource>> propertyGetListPropertyByParent(
      {@Body() required PropertyFilterResouce? body});

  ///Tạo mới thuộc tính
  ///@param version
  @POST('/api/exam/v1.0/Property/Create')
  Future<PropertyCreateResource> propertyCreate(
      {@Body() required PropertyCreateResource? body});

  ///Cập nhập thuộc tính
  ///@param version
  @PUT('/api/exam/v1.0/Property/UpdateProperty')
  Future<dynamic> propertyUpdateProperty(
      {@Body() required PropertyUpdateResource? body});

  ///Lấy thông tin thuộc tính
  ///@param Id
  ///@param version
  @GET('/api/exam/v1.0/Property/GetById')
  Future<PropertyDetailResource> propertyGetById({@Query('Id') int? id});

  ///Lấy danh sách thuộc tính theo phân loại
  ///@param ids
  ///@param includeChildren
  ///@param type
  ///@param version
  @GET('/api/exam/v1.0/Property/GetByCategoryIds')
  Future<PropertyListResource> propertyGetByCategoryIds(
      {@Query('ids') String? ids,
      @Query('includeChildren') bool? includeChildren,
      @Query('type') int? type});

  ///Lấy danh sách chi tiết thuộc tính theo id cha
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/Property/GetByDetailParentId')
  Future<PropertyListResource> propertyGetByDetailParentId(
      {@Query('id') int? id});
////// Lấy danh sách thuộc tính theo id cha
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/Property/GetByPropertyParentId')
  Future<PropertyListResource> propertyGetByPropertyParentId(
      {@Query('id') int? id});

  ///Xóa thuộc tính
  ///@param Id
  ///@param version
  @DELETE('/api/exam/v1.0/Property/Delete')
  Future<int> propertyDelete({@Query('Id') int? id});

  ///Lấy thông tin chi tiết thuộc tính
  ///@param Id
  ///@param version
  @GET('/api/exam/v1.0/Property/GetDetailById')
  Future<PropertyDetailResource> propertyGetDetailById({@Query('Id') int? id});

  ///Cập nhật phân loại cho thuộc tính
  ///@param version
  @PUT('/api/exam/v1.0/Property/UpdatePropertyByCategory')
  Future<dynamic> propertyUpdatePropertyByCategory(
      {@Body() required PropertyByCategoryUpdateResource? body});

  ///Lấy danh sách phân loại theo thuộc tính
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/Property/GetCategoryByProperty')
  Future<dynamic> propertyGetCategoryByProperty({@Query('id') int? id});

  ///Lấy danh sách thuộc tính theo phân loại
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/Property/GetPropertyByCategoryId')
  Future<PropertyListResource> propertyGetPropertyByCategoryId(
      {@Query('id') int? id});

  ///Lấy danh sách thuộc tính trả về dạng cây theo thuộc tính cha
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/Property/GetPropertyTreeByParentPropertyId')
  Future<PropertyListResource> propertyGetPropertyTreeByParentPropertyId(
      {@Query('id') int? id});

  ///Lấy danh sách thuộc tính dạng cây phục vụ ma trận
  ///@param version
  @POST('/api/exam/v1.0/Property/GetPropertyColumns')
  Future<ExamStructureColumnsResource> propertyGetPropertyColumns(
      {@Body() required PropertyColumns? body});

  ///Lấy danh sách mã thuộc tính theo phân loại
  ///@param categoryId
  ///@param version
  @GET('/api/exam/v1.0/Property/GetListPropertyByCategory')
  Future<List<Int64SelectItem>> propertyGetListPropertyByCategory(
      {@Query('categoryId') List<int>? categoryId});

  ///Láy ra 2 cây tiêu chí và data
  ///@param categoryId
  ///@param version
  @GET('/api/exam/v1.0/Property/GetTreePropertyByCategory')
  Future<PropertyByCategoryTree> propertyGetTreePropertyByCategory(
      {@Query('categoryId') List<int>? categoryId});

  ///Lấy ra tất cả thằng của propertyDetail theo parentId
  ///@param parentId
  ///@param version
  @GET('/api/exam/v1.0/Property/GetAllChildPropertyDetailByparent')
  Future<dynamic> propertyGetAllChildPropertyDetailByparent(
      {@Query('parentId') int? parentId});

  ///Lấy danh sách câu hỏi, có phân trang
  ///@param KeyWord
  ///@param Type
  ///@param Title
  ///@param CategoryIds
  ///@param PropertyIds
  ///@param PropertyId
  ///@param Content
  ///@param Level
  ///@param Status
  ///@param ModerationStatus
  ///@param OwnerType
  ///@param CreatedBy
  ///@param EditedBy
  ///@param PublishedBy
  ///@param CurrentUserId
  ///@param ListIds
  ///@param GetAll
  ///@param AproveBy
  ///@param HaveExplain
  ///@param IsFree
  ///@param HasImage
  ///@param HasVideo
  ///@param HasAudio
  ///@param Store
  ///@param createdDateFrom
  ///@param createdDateTo
  ///@param MoreExpression
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/question')
  Future<QuestionResourceFilterResult> v10Question(
      {@Query('KeyWord')
          String? keyWord,
      @Query('Type')
          String? type,
      @Query('Title')
          String? title,
      @Query('CategoryIds')
          List<int>? categoryIds,
      @Query('PropertyIds')
          List<int>? propertyIds,
      @Query('PropertyId')
          int? propertyId,
      @Query('Content')
          String? content,
      @Query('Level')
          int? level,
      @Query('Status')
          int? status,
      @Query('ModerationStatus')
          int? moderationStatus,
      @Query('OwnerType')
          int? ownerType,
      @Query('CreatedBy')
          int? createdBy,
      @Query('EditedBy')
          int? editedBy,
      @Query('PublishedBy')
          int? publishedBy,
      @Query('CurrentUserId')
          int? currentUserId,
      @Query('ListIds')
          List<int>? listIds,
      @Query('GetAll')
          bool? getAll,
      @Query('AproveBy')
          bool? aproveBy,
      @Query('HaveExplain')
          int? haveExplain,
      @Query('IsFree')
          bool? isFree,
      @Query('HasImage')
          bool? hasImage,
      @Query('HasVideo')
          bool? hasVideo,
      @Query('HasAudio')
          bool? hasAudio,
      @Query('Store')
          int? store,
      @Query('createdDateFrom')
          String? createdDateFrom,
      @Query('createdDateTo')
          String? createdDateTo,
      @Query('MoreExpression')
          List<QuestionResourceBooleanFuncExpression>? moreExpression,
      @Query('SortExpression')
          String? sortExpression,
      @Query('PageSize')
          int? pageSize,
      @Query('PageIndex')
          int? pageIndex});

  ///Thêm mới câu hỏi
  ///@param version
  @POST('/api/exam/v1.0/question')
  Future<String> v10Question({@Body() required SaveQuestionResource? body});

  ///
  ///@param KeyWord
  ///@param Type
  ///@param Title
  ///@param CategoryIds
  ///@param PropertyIds
  ///@param PropertyId
  ///@param Content
  ///@param Level
  ///@param Status
  ///@param ModerationStatus
  ///@param OwnerType
  ///@param CreatedBy
  ///@param EditedBy
  ///@param PublishedBy
  ///@param CurrentUserId
  ///@param ListIds
  ///@param GetAll
  ///@param AproveBy
  ///@param HaveExplain
  ///@param IsFree
  ///@param HasImage
  ///@param HasVideo
  ///@param HasAudio
  ///@param Store
  ///@param createdDateFrom
  ///@param createdDateTo
  ///@param MoreExpression
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/question/getListDuplicate')
  Future<QuestionResourceFilterResult> questionGetListDuplicate(
      {@Query('KeyWord')
          String? keyWord,
      @Query('Type')
          String? type,
      @Query('Title')
          String? title,
      @Query('CategoryIds')
          List<int>? categoryIds,
      @Query('PropertyIds')
          List<int>? propertyIds,
      @Query('PropertyId')
          int? propertyId,
      @Query('Content')
          String? content,
      @Query('Level')
          int? level,
      @Query('Status')
          int? status,
      @Query('ModerationStatus')
          int? moderationStatus,
      @Query('OwnerType')
          int? ownerType,
      @Query('CreatedBy')
          int? createdBy,
      @Query('EditedBy')
          int? editedBy,
      @Query('PublishedBy')
          int? publishedBy,
      @Query('CurrentUserId')
          int? currentUserId,
      @Query('ListIds')
          List<int>? listIds,
      @Query('GetAll')
          bool? getAll,
      @Query('AproveBy')
          bool? aproveBy,
      @Query('HaveExplain')
          int? haveExplain,
      @Query('IsFree')
          bool? isFree,
      @Query('HasImage')
          bool? hasImage,
      @Query('HasVideo')
          bool? hasVideo,
      @Query('HasAudio')
          bool? hasAudio,
      @Query('Store')
          int? store,
      @Query('createdDateFrom')
          String? createdDateFrom,
      @Query('createdDateTo')
          String? createdDateTo,
      @Query('MoreExpression')
          List<QuestionResourceBooleanFuncExpression>? moreExpression,
      @Query('SortExpression')
          String? sortExpression,
      @Query('PageSize')
          int? pageSize,
      @Query('PageIndex')
          int? pageIndex});

  ///Kiểm tra trùng nội dung câu hỏi khi nhập thông tin câu hỏi
  ///@param version
  @POST('/api/exam/v1.0/question/suggestbycontent')
  Future<QuestionResourceFilterResult> questionSuggestbycontent(
      {@Body() required CommonSearchRequest? body});

  ///Thống kê câu hỏi theo trạng thái và người tạo
  ///@param UserId
  ///@param EndDate
  ///@param StartDate
  ///@param Type
  ///@param IsCurrentUser
  ///@param CategoryIds
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/question/userstatistical')
  Future<QuestionResourceFilterResult> questionUserstatistical(
      {@Query('UserId') int? userId,
      @Query('EndDate') String? endDate,
      @Query('StartDate') String? startDate,
      @Query('Type') int? type,
      @Query('IsCurrentUser') bool? isCurrentUser,
      @Query('CategoryIds') List<int>? categoryIds,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///
  ///@param UserId
  ///@param EndDate
  ///@param StartDate
  ///@param Type
  ///@param IsCurrentUser
  ///@param CategoryIds
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/question/generalstatistical')
  Future<QuestionResourceFilterResult> questionGeneralstatistical(
      {@Query('UserId') int? userId,
      @Query('EndDate') String? endDate,
      @Query('StartDate') String? startDate,
      @Query('Type') int? type,
      @Query('IsCurrentUser') bool? isCurrentUser,
      @Query('CategoryIds') List<int>? categoryIds,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Thống kê tổng số câu hỏi theo trạng thái
  ///@param UserId
  ///@param EndDate
  ///@param StartDate
  ///@param Type
  ///@param IsCurrentUser
  ///@param CategoryIds
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/question/totalquestionbystatus')
  Future<List<QuestionResource>> questionTotalquestionbystatus(
      {@Query('UserId') int? userId,
      @Query('EndDate') String? endDate,
      @Query('StartDate') String? startDate,
      @Query('Type') int? type,
      @Query('IsCurrentUser') bool? isCurrentUser,
      @Query('CategoryIds') List<int>? categoryIds,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Thống kê tổng số câu hỏi tổng hợp chung
  ///@param UserId
  ///@param EndDate
  ///@param StartDate
  ///@param Type
  ///@param IsCurrentUser
  ///@param CategoryIds
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/question/totalquestiongeneral')
  Future<List<QuestionResource>> questionTotalquestiongeneral(
      {@Query('UserId') int? userId,
      @Query('EndDate') String? endDate,
      @Query('StartDate') String? startDate,
      @Query('Type') int? type,
      @Query('IsCurrentUser') bool? isCurrentUser,
      @Query('CategoryIds') List<int>? categoryIds,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Lấy danh sách câu hỏi mẫu
  ///@param KeyWord
  ///@param UserId
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/question/templates')
  Future<QuestionTemplateResourceFilterResult> questionTemplates(
      {@Query('KeyWord') String? keyWord,
      @Query('UserId') int? userId,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Lấy thông tin câu hỏi theo Id
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/question/{id}')
  Future<List<SaveQuestionResource>> questionId({@Path('id') required int? id});

  ///Xóa câu hỏi theo id
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/question/{id}')
  Future<List<QuestionResource>> questionId({@Path('id') required int? id});

  ///Cập nhật thông tin câu hỏi
  ///@param id
  ///@param version
  @PUT('/api/exam/v1.0/question/{id}')
  Future<List<QuestionResource>> questionId(
      {@Path('id') required int? id,
      @Body() required SaveQuestionResource? body});

  ///Lấy thông tin câu hỏi theo Id
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/question/version/{id}')
  Future<List<SaveQuestionResource>> versionId({@Path('id') required int? id});

  ///Lấy thông tin câu hỏi mẫu theo id
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/question/template/{id}')
  Future<List<SaveQuestionResource>> templateId({@Path('id') required int? id});

  ///Lấy thông tin câu hỏi theo danh sách id
  ///@param ids
  ///@param version
  @GET('/api/exam/v1.0/question/getbyids')
  Future<List<SaveQuestionResource>> questionGetbyids(
      {@Query('ids') String? ids});

  ///Lấy thông tin câu hỏi theo phiên bản versionId
  ///@param ids
  ///@param version
  @GET('/api/exam/v1.0/question/getbyversionids')
  Future<List<SaveQuestionResource>> questionGetbyversionids(
      {@Query('ids') String? ids});

  ///Xóa câu hỏi theo danh sách id
  ///@param ids
  ///@param version
  @DELETE('/api/exam/v1.0/question/delete')
  Future<String> questionDelete({@Query('ids') String? ids});

  ///
  ///@param version
  @PUT('/api/exam/v1.0/question/fixcontendata')
  Future<int> questionFixcontendata();

  ///Lấy câu hỏi check chéo
  ///@param nextQuestionId
  ///@param KeyWord
  ///@param Type
  ///@param Title
  ///@param categoryIds
  ///@param Level
  ///@param Status
  ///@param ModerationStatus
  ///@param OwnerType
  ///@param CreatedBy
  ///@param CurrentUserId
  ///@param IsFree
  ///@param checkType
  ///@param createdDateFrom
  ///@param createdDateTo
  ///@param isSearch
  ///@param HaveExplain
  ///@param MoreExpression
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/question/getCheckQuestion')
  Future<List<SaveQuestionResource>> questionGetCheckQuestion(
      {@Query('nextQuestionId')
          int? nextQuestionId,
      @Query('KeyWord')
          String? keyWord,
      @Query('Type')
          String? type,
      @Query('Title')
          String? title,
      @Query('categoryIds')
          List<int>? categoryIds,
      @Query('Level')
          int? level,
      @Query('Status')
          int? status,
      @Query('ModerationStatus')
          int? moderationStatus,
      @Query('OwnerType')
          int? ownerType,
      @Query('CreatedBy')
          int? createdBy,
      @Query('CurrentUserId')
          int? currentUserId,
      @Query('IsFree')
          bool? isFree,
      @Query('checkType')
          int? checkType,
      @Query('createdDateFrom')
          String? createdDateFrom,
      @Query('createdDateTo')
          String? createdDateTo,
      @Query('isSearch')
          bool? isSearch,
      @Query('HaveExplain')
          int? haveExplain,
      @Query('MoreExpression')
          List<QuestionCheckResourceBooleanFuncExpression>? moreExpression,
      @Query('SortExpression')
          String? sortExpression,
      @Query('PageSize')
          int? pageSize,
      @Query('PageIndex')
          int? pageIndex});

  ///
  ///@param ids
  ///@param version
  @PUT('/api/exam/v1.0/question/aprovesmoderation')
  Future<List<QuestionResource>> questionAprovesmoderation(
      {@Query('ids') String? ids,
      @Body() required QuestionModerationModelResource? body});

  ///
  ///@param questionId
  ///@param version
  @PUT('/api/exam/v1.0/question/addmoderation')
  Future<List<QuestionResource>> questionAddmoderation(
      {@Query('questionId') int? questionId,
      @Body() required QuestionModerationModelResource? body});

  ///
  ///@param isCreate
  ///@param isApprove
  ///@param version
  @GET('/api/exam/v1.0/question/getquestionstatistical')
  Future<List<QuestionStatisticalResource>> questionGetquestionstatistical(
      {@Query('isCreate') bool? isCreate, @Query('isApprove') bool? isApprove});

  ///
  ///@param version
  @GET('/api/exam/v1.0/question/getquestionstatisticalmenu')
  Future<List<QuestionStatisticalUserResource>>
      questionGetquestionstatisticalmenu();

  ///
  ///@param type
  ///@param startDate
  ///@param endDate
  ///@param version
  @GET('/api/exam/v1.0/question/userstatisticalbytype')
  Future<List<QuestionStatisticalUserResource>> questionUserstatisticalbytype(
      {@Query('type') int? type,
      @Query('startDate') String? startDate,
      @Query('endDate') String? endDate});

  ///
  ///@param type
  ///@param version
  @GET('/api/exam/v1.0/question/currentuserstatistical')
  Future<List<QuestionStatisticalUserResource>> questionCurrentuserstatistical(
      {@Query('type') int? type});

  ///
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/question/getlistversionbyid')
  Future<List<Int64SelectItem>> questionGetlistversionbyid(
      {@Query('id') int? id});

  ///
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/question/getquestionhistory')
  Future<List<QuestionHistoryResource>> questionGetquestionhistory(
      {@Query('id') int? id});

  ///lấy danh sách version theo question
  ///@param questionId
  ///@param version
  @GET('/api/exam/v1.0/public/Question/GetQuestionVersionById')
  Future<List<QuestionVersionPublicResource>> questionGetQuestionVersionById(
      {@Query('questionId') int? questionId});

  ///
  ///@param version
  @GET('/api/exam/v1.0/public/QuestionExplain/GetAll')
  Future<List<QuestionExplainResource>> questionExplainGetAll();

  ///
  ///@param version
  @POST('/api/exam/v1.0/public/QuestionExplain/GetList')
  Future<List<QuestionExplainResource>> questionExplainGetList(
      {@Body() required QuestionExplainFilterResource? body});

  ///lấy thông tin chi tiết giải thích đáp án
  ///@param QuestionId
  ///@param KeyWord
  ///@param Status
  ///@param OwnerType
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET(
      '/api/exam/v1.0/public/QuestionExplain/GetDetailQuestionExplainByQuestionId')
  Future<List<QuestionWithQuestionExplainResource>>
      questionExplainGetDetailQuestionExplainByQuestionId(
          {@Query('QuestionId') int? questionId,
          @Query('KeyWord') String? keyWord,
          @Query('Status') int? status,
          @Query('OwnerType') int? ownerType,
          @Query('SortExpression') String? sortExpression,
          @Query('PageSize') int? pageSize,
          @Query('PageIndex') int? pageIndex});

  ///
  ///@param questionId
  ///@param version
  @GET('/api/exam/v1.0/public/QuestionExplain/GetListByQuestionId')
  Future<List<QuestionExplainEntity>> questionExplainGetListByQuestionId(
      {@Query('questionId') int? questionId});

  ///chỉnh sửa giải thích đáp án
  ///@param version
  @POST('/api/exam/v1.0/public/QuestionExplain/Update')
  Future<QuestionExplainResource> questionExplainUpdate(
      {@Body() required SaveQuestionExplainResouce? body});

  ///Lưu giải thích đáp án
  ///@param version
  @POST('/api/exam/v1.0/public/QuestionExplain/Create')
  Future<QuestionExplainResource> questionExplainCreate(
      {@Body() required SaveQuestionExplainResouce? body});

  ///xóa giải thích đáp án
  ///@param id
  ///@param version
  @DELETE('/api/exam/v1.0/public/QuestionExplain/Delete')
  Future<QuestionExplainResource> questionExplainDelete({@Query('id') int? id});

  ///Lấy ra thông tin của đóng góp theo Id
  ///@param id
  ///@param version
  @GET('/api/exam/v1.0/public/QuestionExplain/GetById')
  Future<QuestionExplainPublicResource> questionExplainGetById(
      {@Query('id') int? id});

  ///lấy giải thích đáp án cho câu hỏi
  ///@param questionId
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/exam/v1.0/public/QuestionExplain/GetQuestionExplainById')
  Future<QuestionExplainPublicResourceFilterResult>
      questionExplainGetQuestionExplainById(
          {@Query('questionId') int? questionId,
          @Query('pageIndex') int? pageIndex,
          @Query('pageSize') int? pageSize});

  ///like va dislike giai thich dap an
  ///Like : 1
  ///Dislike : 6
  ///@param questionExplainId
  ///@param typeReaction
  ///@param version
  @PUT('/api/exam/v1.0/public/QuestionExplain/ReactionQuestionExplain')
  Future<bool> questionExplainReactionQuestionExplain(
      {@Query('questionExplainId') int? questionExplainId,
      @Query('typeReaction') int? typeReaction});

  ///Get All Tag
  ///@param pageSize
  ///@param pageIndex
  ///@param version
  @GET('/api/exam/v1.0/Tag/GetAll')
  Future<TagItemResourceFilterResult> tagGetAll(
      {@Query('pageSize') int? pageSize, @Query('pageIndex') int? pageIndex});

  ///Get All Exam By Tag Id
  ///@param tagId
  ///@param pageSize
  ///@param pageIndex
  ///@param version
  @GET('/api/exam/v1.0/Tag/GetExamsByTagId')
  Future<ExamsTagItemResourceFilterResult> tagGetExamsByTagId(
      {@Query('tagId') int? tagId,
      @Query('pageSize') int? pageSize,
      @Query('pageIndex') int? pageIndex});

  ///Get tags by name
  ///@param nameTag
  ///@param pageSize
  ///@param pageIndex
  ///@param version
  @GET('/api/exam/v1.0/Tag/GetByNameTag')
  Future<TagItemResourceFilterResult> tagGetByNameTag(
      {@Query('nameTag') String? nameTag,
      @Query('pageSize') int? pageSize,
      @Query('pageIndex') int? pageIndex});

  ///
  ///@param ids
  ///@param version
  @GET('/api/exam/v1.0/Tag/GetByIds')
  Future<List<TagItemResource>> tagGetByIds({@Query('ids') List<int>? ids});

  ///create new tag
  ///@param version
  @POST('/api/exam/v1.0/Tag/CreateTag')
  Future<TagItemResource> tagCreateTag(
      {@Body() required SaveTagResource? body});

  ///update tag
  ///@param version
  @PUT('/api/exam/v1.0/Tag/UpdateTag')
  Future<dynamic> tagUpdateTag({@Body() required UpdateTagResource? body});

  ///delete tag
  ///@param tagId
  ///@param version
  @DELETE('/api/exam/v1.0/Tag/RemoveTag/{tagId}')
  Future<dynamic> removeTagTagId({@Path('tagId') required int? tagId});

  ///
  ///@param version
  @GET('/api/exam/v1.0/Test/PropertyCached')
  Future<dynamic> testPropertyCached();

  ///
  ///@param version
  @GET('/api/exam/v1.0/Test/PropertyNoCached')
  Future<dynamic> testPropertyNoCached();

  ///
  ///@param version
  @GET('/api/exam/v1.0/Test/PropertyDetailCached')
  Future<dynamic> testPropertyDetailCached();

  ///
  ///@param version
  @GET('/api/exam/v1.0/Test/PropertyDetailNoCached')
  Future<dynamic> testPropertyDetailNoCached();

  ///
  ///@param version
  @GET('/api/exam/v1.0/Test/CheckCache')
  Future<dynamic> testCheckCache();

  ///
  ///@param version
  @GET('/api/exam/v1.0/Test/RemoveCache')
  Future<dynamic> testRemoveCache();

  ///
  ///@param version
  @GET('/api/exam/v1.0/Test/AddGroup')
  Future<dynamic> testAddGroup();

  ///
  ///@param version
  @GET('/api/exam/v1.0/Test/AddReaction')
  Future<dynamic> testAddReaction();

  ///
  ///@param version
  @GET('/api/exam/v1.0/Test/Send')
  Future<dynamic> testSend();

  ///Lấy danh sách bảng xếp hạng user trong đề thi
  ///@param ExamId
  ///@param ExamIds
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/UserExamResult/GetAll')
  Future<UserExamResultPublicResourceFilterResult> userExamResultGetAll(
      {@Query('ExamId') int? examId,
      @Query('ExamIds') List<int>? examIds,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///Lấy thông tin user và xếp hạng
  ///@param examId
  ///@param version
  @GET('/api/exam/v1.0/public/UserExamResult/GetUserExamResult')
  Future<UserExamResultPublicResource> userExamResultGetUserExamResult(
      {@Query('examId') int? examId});

  ///Lấy thông tin user và số lần tham gia thi của đề thi
  ///@param examId
  ///@param version
  @GET('/api/exam/v1.0/public/UserExamResult/GetUserExamNumberTimeResult')
  Future<UserInfoExamResultPublicResource>
      userExamResultGetUserExamNumberTimeResult({@Query('examId') int? examId});

  ///Lấy thông tin kết quả thi của user
  ///@param examResultId
  ///@param version
  @GET('/api/exam/v1.0/public/UserExamResult/GetExamResultByUser')
  Future<UserExamResultPublicResource> userExamResultGetExamResultByUser(
      {@Query('examResultId') int? examResultId});

  ///lưu thông tin kết quả thi của người dùng
  ///@param version
  @POST('/api/exam/v1.0/public/UserExamResult/CreateUserExamResult')
  Future<int> userExamResultCreateUserExamResult(
      {@Body() required UserAnswerResultPublicResource? body});

  ///Get thông tin đánh giá của đề thi, thông tin user, điểm, thời gian thi
  ///@param ExamId
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/exam/v1.0/public/UserExamResult/GetAllRateByExamId')
  Future<UserExamRatePublicResourceFilterResult>
      userExamResultGetAllRateByExamId(
          {@Query('ExamId') int? examId,
          @Query('SortExpression') String? sortExpression,
          @Query('PageSize') int? pageSize,
          @Query('PageIndex') int? pageIndex});

  ///Đếm số lượng đề thi mà user đã làm
  ///@param version
  @GET('/api/exam/v1.0/public/UserExamResult/CountExamUser')
  Future<int> userExamResultCountExamUser();
}
