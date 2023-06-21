import 'package:api/api/guide_api_models.dart';
import 'package:api/guide/api/api_url_guide.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'guide_custom_api.g.dart';

@RestApi()
abstract class GuideCustomAPI {
  factory GuideCustomAPI(Dio dio, {String baseUrl}) = _GuideCustomAPI;

  @GET(ApiUrlGuide.getResultUserByCode)
  Future<List<PersonalityGroupPointResource>?> getResultUserByCode(
      @Query('code') String code, @Query('userId') int userId);
}
