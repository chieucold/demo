import 'package:api/id/api/api_url_id.dart';
import 'package:api/id/model/guide_update_info_request.dart';
import 'package:api/id/model/login_response_model.dart';
import 'package:api/id/model/update_account_request.dart';
import 'package:api/id/model/user_info_guide_model.dart';

import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:api/id/model/user_index.dart';

import 'model/login_external_model.dart';
import 'model/login_request_model.dart';
import 'model/otp_user_model.dart';
part 'id_rest_api.g.dart';

@RestApi()
abstract class IdResAPI {
  factory IdResAPI(Dio dio, {String baseUrl}) = _IdResAPI;

  @GET(ApiUrlId.userInfo)
  Future<UserInfoModel> getUserInfo();

  @GET(ApiUrlId.setUserType)
  Future<bool> setRoleOfUser(@Query('userType') int userType);

  @GET(ApiUrlId.checkQRCode)
  Future<bool> checkQRCode(@Query('key') String key);

  @GET(ApiUrlId.getLoginQRCodeInfo)
  Future<LoginQRCodeModel> getLoginQRCodeInfo(@Query('key') String key);

  @POST(ApiUrlId.setUserMobileToken)
  Future<DeviceTokenModel> setUserMobileToken(@Body() TokenRequest request);

  @GET(ApiUrlId.getOTPUser)
  Future<OtpUserModel> getOtpUser();

  @POST(ApiUrlId.checkAccount)
  Future<LoginResponseModel> checkAccount(@Body() LoginRequestModel request);

  @POST(ApiUrlId.loginAccount)
  Future<LoginResponseModel> loginAccount(@Body() LoginRequestModel request);

  @POST(ApiUrlId.updateAccount)
  Future<dynamic> updateAccount(@Body() UpdateAccountRequest request);

  @POST(ApiUrlId.loginExternal)
  Future<LoginResponseModel> loginExternal(@Body() LoginExternalModel loginExternalModel);

  @POST(ApiUrlId.twoFactorSendCode)
  Future<TwoFactorSendCodeResponse> twoFactorSendCode(@Body() TwoFactorSendCode codeReceiveMethod);

  @POST(ApiUrlId.twoFactorLogin)
  Future<TwoFactorSendCodeResponse> twoFactorLogin(@Body() LoginTwoFactorRequestModel request);

  @POST(ApiUrlId.twoFactorLoginWithRecovery)
  Future<TwoFactorSendCodeResponse> twoFactorLoginWithRecovery(
      @Body() LoginRecoveryCodeTwoFactorRequestModel codeReceiveMethod);

  @GET(ApiUrlId.getLoginOTPSupport)
  Future<List<TwoFactorType>> getLoginOTPSupport(@Query('userName') String username);

  @POST(ApiUrlId.acceptPrompt)
  Future<bool> acceptPrompt(@Body() AcceptPromptRequestModel request);

  @POST(ApiUrlId.guideUpdateInfo)
  Future<String> guideUpdateInfo(@Body() GuideUpdateInfoRequest request);

  @GET(ApiUrlId.guideGetUserInfo)
  Future<UserInfoGuideModel> guideGetUserInfo();

  // @POST(ApiUrlId.refreshToken)
  // @FormUrlEncoded()
  // Future<TokenResponse> refreshToken(
  //     @Header('Content-Type') String contentType,
  //     @Field() String clientId,
  //     @Field() String refreshToken,
  //     @Field() String grantType);
}
