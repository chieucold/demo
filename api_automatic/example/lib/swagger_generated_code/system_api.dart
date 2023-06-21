import 'system_api_models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
export 'system_api_models.dart';

part 'system_api.g.dart';

// **************************************************************************
// The file is generated automatically. Do not edit files
// **************************************************************************

@RestApi()
abstract class SystemApi {
  factory SystemApi(Dio dio, {String baseUrl}) = _SystemApi;

  ///
  ///@param pageIndex
  ///@param pageSize
  ///@param block
  ///@param version
  @GET('/api/system/v1.0/public/BlockCategoryUser/GetCategoryOfUser')
  Future<List<BlockCategoryUserResource>> blockCategoryUserGetCategoryOfUser(
      {@Query('pageIndex') int? pageIndex, @Query('pageSize') int? pageSize});

  ///
  ///@param blockCategoryId
  ///@param version
  @POST('/api/system/v1.0/public/BlockCategoryUser/SaveCategoryOfUser')
  Future<bool> blockCategoryUserSaveCategoryOfUser(
      {@Query('blockCategoryId') int? blockCategoryId});

  ///
  ///@param keyword
  ///@param version
  @GET('/api/system/v1.0/CacheManager/GetAll')
  Future<dynamic> cacheManagerGetAll({@Query('keyword') String? keyword});

  ///
  ///@param version
  @GET('/api/system/v1.0/CacheManager/InsertTest')
  Future<dynamic> cacheManagerInsertTest();

  ///
  ///@param key
  ///@param version
  @DELETE('/api/system/v1.0/CacheManager/RemoveByKey')
  Future<dynamic> cacheManagerRemoveByKey({@Query('key') String? key});

  ///
  ///@param key
  ///@param version
  @GET('/api/system/v1.0/CacheManager/GetDataByKey')
  Future<String> cacheManagerGetDataByKey({@Query('key') String? key});

  ///
  ///@param version
  @GET('/api/system/v1.0/elasticsearch/indices/all')
  Future<IndexDetailFilterResult> indicesAll();

  ///Lấy tất cả các index được cấu hình theo từng block
  ///@param version
  @GET('/api/system/v1.0/elasticsearch/indices/block')
  Future<List<IndexBlock>> indicesBlock();

  ///Tạo index
  ///@param version
  @POST('/api/system/v1.0/elasticsearch/create')
  Future<String> elasticsearchCreate({@Body() required IndexCreate? body});

  ///
  ///@param index
  ///@param version
  @PUT('/api/system/v1.0/elasticsearch/reindex')
  Future<String> elasticsearchReindex({@Query('index') String? index});

  ///Xóa index trong elastic theo index name
  ///@param id
  ///@param version
  @DELETE('/api/system/v1.0/elasticsearch/indices/{id}')
  Future<String> indicesId({@Path('id') required String? id});

  ///
  ///@param keyword
  ///@param pageIndex
  ///@param pageSize
  ///@param folderId
  ///@param extensions png;jpg;jpeg;gif
  ///@param isGetAll
  ///@param block
  ///@param version
  @GET('/api/system/v1.0/File/GetFilesUser')
  Future<dynamic> fileGetFilesUser(
      {@Query('keyword') String? keyword,
      @Query('pageIndex') int? pageIndex,
      @Query('pageSize') int? pageSize,
      @Query('folderId') int? folderId,
      @Query('extensions') String? extensions,
      @Query('isGetAll') bool? isGetAll});

  ///
  ///@param version
  @POST('/api/system/v1.0/File/Save')
  Future<dynamic> fileSave({@Body() required FileEntity? body});

  ///
  ///@param id
  ///@param version
  @DELETE('/api/system/v1.0/File/Delete')
  Future<dynamic> fileDelete({@Query('id') int? id});

  ///
  ///@param folderId
  ///@param version
  @PUT('/api/system/v1.0/File/MoveFiles')
  Future<dynamic> fileMoveFiles({@Query('folderId') int? folderId});

  ///Webhook dành cho storage call sau khi convert xong video
  ///@param version
  @POST('/api/system/v1.0/File/VideoCallback')
  Future<String> fileVideoCallback(
      {@Body() required FileStorageCallbackResource? body});

  ///Lấy thông tin file theo path
  ///@param path
  ///@param version
  @GET('/api/system/v1.0/File/GetByUrl')
  Future<FileResource> fileGetByUrl({@Query('path') String? path});

  ///Đổi trạng thái về convert lại
  ///@param id
  ///@param version
  @PUT('/api/system/v1.0/File/ReConvert')
  Future<bool> fileReConvert({@Query('id') int? id});

  ///Thay đổi avatar
  ///@param id
  ///@param avatar
  ///@param version
  @PUT('/api/system/v1.0/File/ChangeAvatar')
  Future<bool> fileChangeAvatar(
      {@Query('id') int? id, @Query('avatar') String? avatar});

  ///Lấy danh sách nhóm của tôi
  ///@param blockId
  ///@param isAdmin
  ///@param userId
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/system/v1.0/public/Group/GetMyGroup')
  Future<dynamic> groupGetMyGroup(
      {@Query('blockId') int? blockId,
      @Query('isAdmin') bool? isAdmin,
      @Query('userId') int? userId,
      @Query('pageIndex') int? pageIndex,
      @Query('pageSize') int? pageSize});

  ///
  ///@param Id
  ///@param version
  @GET('/api/system/v1.0/public/Group/GetById')
  Future<ApiResponse> groupGetById({@Query('Id') int? id});

  ///
  ///@param version
  @POST('/api/system/v1.0/public/Group/Save')
  Future<ApiResponse> groupSave({@Body() required GroupUpdateResource? body});

  ///
  ///@param id
  ///@param version
  @DELETE('/api/system/v1.0/public/Group/Delete')
  Future<ApiResponse> groupDelete({@Query('id') int? id});

  ///
  ///@param UserId
  ///@param GroupId
  ///@param RoleId
  ///@param version
  @PUT('/api/system/v1.0/public/Group/AddUser')
  Future<ApiResponse> groupAddUser(
      {@Query('UserId') int? userId,
      @Query('GroupId') int? groupId,
      @Query('RoleId') int? roleId});

  ///Lấy danh sách user trong group
  ///@param version
  @PUT('/api/system/v1.0/public/Group/GetListUser')
  Future<ApiResponse> groupGetListUser(
      {@Body() required UserInGroupFilterResource? body});

  ///Bật tắt nhận thông báo
  ///@param GroupId
  ///@param Off
  ///@param version
  @PUT('/api/system/v1.0/public/Group/OnOffReceiveNotification')
  Future<ApiResponse> groupOnOffReceiveNotification(
      {@Query('GroupId') int? groupId, @Query('Off') bool? off});

  ///Xóa user khỏi group
  ///@param UserId
  ///@param GroupId
  ///@param version
  @PUT('/api/system/v1.0/public/Group/RemoveUser')
  Future<ApiResponse> groupRemoveUser(
      {@Query('UserId') int? userId, @Query('GroupId') int? groupId});

  ///Mời người dùng vào nhóm
  ///@param UserId
  ///@param GroupId
  ///@param CreatedBy
  ///@param version
  @PUT('/api/system/v1.0/public/Group/InviteUser')
  Future<ApiResponse> groupInviteUser(
      {@Query('UserId') int? userId,
      @Query('GroupId') int? groupId,
      @Query('CreatedBy') int? createdBy});

  ///Hủy mời vào nhóm
  ///@param UserId
  ///@param GroupId
  ///@param version
  @PUT('/api/system/v1.0/public/Group/CancelInviteUser')
  Future<dynamic> groupCancelInviteUser(
      {@Query('UserId') int? userId, @Query('GroupId') int? groupId});

  ///Chấp nhận lời mời
  ///@param GroupId
  ///@param Accept
  ///@param version
  @PUT('/api/system/v1.0/public/Group/ReplyToInvitation')
  Future<ApiResponse> groupReplyToInvitation(
      {@Query('GroupId') int? groupId, @Query('Accept') bool? accept});

  ///Lấy ra danh sách nhóm được mời
  ///@param pageIndex
  ///@param pageSize
  ///@param version
  @GET('/api/system/v1.0/public/Group/GetUserGroupInvited')
  Future<dynamic> groupGetUserGroupInvited(
      {@Query('pageIndex') int? pageIndex, @Query('pageSize') int? pageSize});

  ///Đếm tổng số lời mời vào nhóm
  ///@param version
  @GET('/api/system/v1.0/public/Group/CountUserGroupInvited')
  Future<dynamic> groupCountUserGroupInvited();

  ///
  ///@param blockId
  ///@param version
  @GET('/api/system/v1.0/SEO/GetByBlock')
  Future<dynamic> sEOGetByBlock({@Query('blockId') int? blockId});

  ///
  ///@param version
  @POST('/api/system/v1.0/SEO/Save')
  Future<dynamic> sEOSave({@Body() required SEODetailEntity? body});

  ///
  ///@param version
  @GET('/api/system/v1.0/public/Server/GetAll')
  Future<dynamic> serverGetAll();

  ///
  ///@param version
  @GET('/api/system/v1.0/public/Server/GetUploadServer')
  Future<dynamic> serverGetUploadServer();

  ///Lấy ra thông tin người dùng theo danh sách ids
  ///@param ids
  ///@param version
  @GET('/api/system/v1.0/public/User/GetByIds')
  Future<dynamic> userGetByIds({@Query('ids') String? ids});

  ///Lấy ra danh sách người dùng
  ///@param KeyWord
  ///@param Status
  ///@param GroupId
  ///@param UserIds
  ///@param IsSystem
  ///@param SortExpression
  ///@param PageSize
  ///@param PageIndex
  ///@param version
  @GET('/api/system/v1.0/public/User/GetUsers')
  Future<dynamic> userGetUsers(
      {@Query('KeyWord') String? keyWord,
      @Query('Status') bool? status,
      @Query('GroupId') int? groupId,
      @Query('UserIds') List<int>? userIds,
      @Query('IsSystem') bool? isSystem,
      @Query('SortExpression') String? sortExpression,
      @Query('PageSize') int? pageSize,
      @Query('PageIndex') int? pageIndex});

  ///
  ///@param version
  @GET('/api/system/v1.0/public/UserType/GetAll')
  Future<dynamic> userTypeGetAll();

  ///
  ///@param version
  @GET('/api/system/v1.0/public/UserType/SetUserType')
  Future<dynamic> userTypeSetUserType();
}
