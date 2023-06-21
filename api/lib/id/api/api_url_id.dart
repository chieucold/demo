import 'package:core/common/common.dart';
import 'package:flutter/foundation.dart';

class ApiUrlId {
  static const String userInfo = "/connect/userinfo";
  static const String setUserType = '/api/v1.0/public/User/SetUserType';
  static const String refreshToken = 'connect/token';
  static const String checkQRCode = '/api/v1.0/Account/CheckQRCode';
  static const String getLoginQRCodeInfo = '/api/v1.0/Account/GetLoginQRCodeInfo';
  static const String setUserMobileToken = '/api/v1/public/UserMobileToken/Create';
  static const String userInfoPage = '${kDebugMode ? ApiPath.Id : ApiPathRelease.Id}/info?token=';
  static const String userChangePasswordPage = '${kDebugMode ? ApiPath.Id : ApiPathRelease.Id}/change-password?token=';
  static const String userRegister = '${kDebugMode ? ApiPath.Id : ApiPathRelease.Id}/register';
  static const String userForgotPassword = '${kDebugMode ? ApiPath.Id : ApiPathRelease.Id}/forgot-password';
  static const String getOTPUser = '/api/v1.0/public/User/GetOTP';
  static const String checkAccount = '/api/v1.0/Account/CheckAccount';
  static const String loginAccount = '/api/v1/Account/Login';
  static const String loginExternal = '/api/v1.0/Account/LoginExternal';
  static const String updateAccount = '/api/v1.0/Account/Update';
  static const String twoFactorSendCode = '/api/v1.0/twoFactorAuthentication/SendCode';
  static const String twoFactorLogin = '/api/v1.0/twoFactorAuthentication/login';
  static const String twoFactorLoginWithRecovery = '/api/v1.0/twoFactorAuthentication/loginWithRecovery';
  static const String getLoginOTPSupport = '/api/v1.0/Account/GetLoginOTPSupport';
  static const String acceptPrompt = '/api/v1/Account/AcceptPrompt';
  static const String guideUpdateInfo = '/api/v1/UserMananger/GuideUpdateInfo';
  static const String guideGetUserInfo = '/api/v1.0/UserMananger/GetUserInfo';
}
