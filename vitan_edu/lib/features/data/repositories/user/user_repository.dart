import 'package:api/id/id_rest_api.dart';
import 'package:api/id/model/login_external_model.dart';
import 'package:api/id/model/login_request_model.dart';
import 'package:api/id/model/login_response_model.dart';
import 'package:api/id/model/update_account_request.dart';
import 'package:api/id/model/user_index.dart';

class UserRepository {
  final IdResAPI _idResAPI;

  UserRepository(this._idResAPI);

  Future<UserInfoModel> getUserInfo() async {
    return await _idResAPI.getUserInfo();
  }

  Future<bool> setRoleOfUser(int userType) async {
    return _idResAPI.setRoleOfUser(userType);
  }

  Future<bool> checkQRCode(String key) async {
    return _idResAPI.checkQRCode(key);
  }

  Future<LoginQRCodeModel> getLoginQRCodeInfo(String key) async {
    return _idResAPI.getLoginQRCodeInfo(key);
  }

  Future<DeviceTokenModel> setUserMobileToken(TokenRequest request) async {
    return _idResAPI.setUserMobileToken(request);
  }

  Future<LoginResponseModel> loginExternal(LoginExternalModel loginExternalModel) async {
    return _idResAPI.loginExternal(loginExternalModel);
  }

  Future<LoginResponseModel> checkAccount(LoginRequestModel request) async {
    return _idResAPI.checkAccount(request);
  }

  Future<LoginResponseModel> loginAccount(LoginRequestModel request) async {
    return _idResAPI.loginAccount(request);
  }

  Future<dynamic> updateAccount(UpdateAccountRequest request) async {
    return _idResAPI.updateAccount(request);
  }

  Future<TwoFactorSendCodeResponse> twoFactorSendCode(TwoFactorSendCode request) async {
    return _idResAPI.twoFactorSendCode(request);
  }

  Future<TwoFactorSendCodeResponse> twoFactorLogin(LoginTwoFactorRequestModel request) async {
    return _idResAPI.twoFactorLogin(request);
  }

  Future<TwoFactorSendCodeResponse> twoFactorLoginWithRecovery(LoginRecoveryCodeTwoFactorRequestModel request) async {
    return _idResAPI.twoFactorLoginWithRecovery(request);
  }

  Future<List<TwoFactorType>> getLoginOTPSupport(String username) async {
    return _idResAPI.getLoginOTPSupport(username);
  }

  Future<bool> acceptPrompt(AcceptPromptRequestModel request) async {
    return _idResAPI.acceptPrompt(request);
  }
}
