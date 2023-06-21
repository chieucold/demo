import 'package:api/id/model/login_response_model.dart';
import 'package:core/common/common.dart';
import 'package:core/common/tracking/tracking.dart';
import 'package:core/components/user/bnd_token.dart';
import 'package:core/model/user_info.dart' as bndUser;
import 'package:core/repositories/core_user_repository.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';

typedef void onRefreshTokenComplete(bool value);

class AuthenticateApp {
  final CoreUserRepository _coreUserRepository;

  AuthenticateApp(this._coreUserRepository);

  bool get isLogin => LocalStoreManager.getString(UserSettings.tokenUser).isNotEmpty == true;

  // Future<void> authenticate(String clientId, List<String> scopes, {LoginResponseModel? loginResponseModel}) async {
  // final FlutterAppAuth appAuth = FlutterAppAuth();
  // print(scopes);
  // final AuthorizationTokenRequest request = AuthorizationTokenRequest(
  //   clientId,
  //   'localhost:4000',
  //   discoveryUrl: 'https://id.bndtech.vn/.well-known/openid-configuration',
  //   scopes: scopes,
  // );

  // final AuthorizationTokenResponse? result = await appAuth.authorizeAndExchangeCode(request);

  // final bndUser.UserInfo info = bndUser.UserInfo(email: "12313", id: 7, name: "123", userType: 1);
  // return info;

  //starts the authentication
  // credential = await getCredential(clientId, scopes);
  // final TokenResponse token = await credential.getTokenResponse();
  // await LocalStoreManager.setString(UserSettings.tokenUser, loginResponseModel?.accessToken ?? '');
  // await LocalStoreManager.setString(UserSettings.refreshToken, loginResponseModel?.refreshToken ?? '');
  // await LocalStoreManager.setBool(SharedPreferenceKey.isFirstRun, true);
  // await closeWebView();

  // await updateUserInfo();
  // }

  Future<void> saveToken(LoginResponseModel? loginResponseModel) async {
    print(loginResponseModel?.accessToken);
    await LocalStoreManager.setString(UserSettings.tokenUser, loginResponseModel?.accessToken ?? '');
    await LocalStoreManager.setString(UserSettings.refreshToken, loginResponseModel?.refreshToken ?? '');
    await LocalStoreManager.setBool(SharedPreferenceKey.isFirstRun, true);
    // await LocalStoreManager.remove(UserSettings.isLoginBiometric);
  }

  Future<void> updateUserInfo() async {
    final bndUser.UserInfoApiModel? userInfo = await _coreUserRepository.getUserInfo();
    if (userInfo != null) {
      final bndUser.UserInfo info = bndUser.UserInfo.fromAPI(userInfo);
      Tracking().initialize(userId: info.id.toString());
      await LocalStoreManager.setObject(UserSettings.userInfo, info.toJson());
      await LocalStoreManager.setString(UserSettings.keyUserName, info.email??'');
      print(info.toJson());
    }
  }

  bndUser.UserInfo? getUserInfo() {
    final Map<String, dynamic>? temp = LocalStoreManager.getObject(UserSettings.userInfo);
    if (temp != null) return bndUser.UserInfo.fromJson(temp);
    return null;
  }

  int getCurrentUserId() {
    return getUserInfo()?.id.toInt() ?? 0;
  }

  Future<bool> refreshToken({String? clientId, List<String>? scopes}) async {
    try {
      final Token? token = await _coreUserRepository.refreshToken(clientId: AppConfig.idAppName);
      if (token != null) {
        print(token.accessToken);
        await LocalStoreManager.setString(UserSettings.tokenUser, token.accessToken);
        await LocalStoreManager.setString(UserSettings.refreshToken, token.refreshToken);
      }

      return token != null;
    } catch (e) {
      return false;
    }
  }

  bndUser.UserInfo? setUserType(int userType) {
    final bndUser.UserInfo? userInfo = getUserInfo();
    if (userInfo != null) {
      userInfo.userType = userType;
      LocalStoreManager.setObject(UserSettings.userInfo, userInfo.toJson());
      return userInfo;
    }
    return null;
  }

  Future<void> clearData() async {
    await LocalStoreManager.remove(UserSettings.tokenUser);
    await LocalStoreManager.remove(UserSettings.refreshToken);
    await LocalStoreManager.remove(UserSettings.userInfo);
    await LocalStoreManager.remove(UserSettings.isLoginBiometric);
    await LocalStoreManager.remove(UserSettings.keyUserName);
    await LocalStoreManager.remove(UserSettings.transactionWithBiometric);
    await LocalStoreManager.remove(UserSettings.keyLockTime);
    await LocalStoreManager.remove(UserSettings.keyCurrentTimeLock);
    await LocalStoreManager.remove(UserSettings.keyPassCode);
  }

  Future<bool> logOut(String clientId, List<String> scopes) async {
    await LocalStoreManager.remove(UserSettings.tokenUser);
    // await LocalStoreManager.remove(UserSettings.refreshToken);
    // await LocalStoreManager.remove(UserSettings.userInfo);
    // await LocalStoreManager.remove(UserSettings.isLoginBiometric);
    // await LocalStoreManager.remove(UserSettings.keyUserName);
    // await LocalStoreManager.remove(UserSettings.transactionWithBiometric);
    // await LocalStoreManager.remove(UserSettings.keyLockTime);
    // await LocalStoreManager.remove(UserSettings.keyCurrentTimeLock);
    // await LocalStoreManager.remove(UserSettings.keyPassCode);
    // await LocalStoreManager.clear();
    //credential = await getCredential(clientId, scopes);\
    // await launch(ApiPath.Id + "/logout", forceWebView: true, enableJavaScript: true, enableDomStorage: true);
    // await closeWebView();

    return true;
  }
}
