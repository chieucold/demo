import 'package:api/api/system_api_models.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import 'api/api_url_system.dart';
part 'system_rest_api.g.dart';

@RestApi()
abstract class SystemRestAPI {
  factory SystemRestAPI(Dio dio, {String baseUrl}) = _SystemRestAPI;

  @GET(ApiUrlGuide.getResultUserByCode)
  Future<UserResourceFilterResult> userGetListMember(
    @Query('KeyWord') String keyWord,
    @Query('PageSize') int pageSize,
    @Query('PageIndex') int pageIndex,
    @Query('isExact') bool isExact,
  );
}
