import 'dart:async';
import 'dart:convert';
import 'package:api/id/model/login_external_model.dart';
import 'package:api/id/model/login_request_model.dart';
import 'package:api/id/model/login_response_model.dart';
import 'package:api/id/model/update_account_request.dart';
import 'package:core/common/common.dart';
import 'package:core/common/constants/user_settings.dart';
import 'package:core/common/core_module.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:core/components/bnd_recaptcha.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/user/bnd_user.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:vitan_edu/core/common/vitan_user.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/domain/usecases/user/user_use_cases.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: '1029208064132-08v3kmlp0dnhdqdai0utbmfmdjtadsn7.apps.googleusercontent.com',
  scopes: <String>[
    'email',
  ],
);

class VHS3LoginUserBloc {
  AccessToken? _accessToken;
  final UserUseCases _userUseCases;
  final AuthenticateApp _authenticateApp;
  final VitanUser _vitanUser;
  final BNDLog _bndLog;
  LoginExternalModel _request = LoginExternalModel(clientId: AppConfig.idAppName);

  VHS3LoginUserBloc(this._userUseCases, this._vitanUser, this._authenticateApp, this._bndLog) : super();

  StreamController<bool> streamBackController = StreamController<bool>();

  Future<void> loginAppleId() async {
    try {
      final AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      if (credential.identityToken != null)
        _loginExternal(LoginType.Apple, credential.authorizationCode, credential.email ?? '',
            familyName: credential.familyName ?? '', givenName: credential.givenName ?? '');
    } catch (e) {
      _bndLog.logError("Login Apple Error $e");
    }
  }

  Future<void> loginFB() async {
    try {
      final bool _isLoginFB = await FacebookAuth.instance.accessToken != null;
      if (_isLoginFB) await logOutFb();

      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile']); // by default we request the email and the public profile
      final data = await FacebookAuth.instance.getUserData();
      final String email = data['email'] ?? '';
      if (result.status == LoginStatus.success) {
        _accessToken = result.accessToken;
        // checkIfIsLogged();
        logger.d(email);
        _loginExternal(LoginType.Facebook, _accessToken?.token, email);
      }
    } catch (e) {
      _bndLog.logError("Login FB Error $e");
    }
  }

  Future<bool> logOutFb() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    return true;
  }

  Future<void> _loginExternal(LoginType userName, String? password, String email,
      {String givenName = '', String familyName = ''}) async {
    showLoading();
    _request
      ..username = userName.toString().split('.').last
      ..password = password ?? ''
      ..givenName = givenName
      ..familyName = familyName;
    final Either<String, LoginResponseModel> result = await _userUseCases.loginExternal(_request);
    result.fold((String l) {
      showErrorMessage(AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('an_error_occurred'));
      _bndLog.logError("Login  Error $l");
    }, (LoginResponseModel loginResponseModel) async {
      if (!loginResponseModel.isRegister) {
        if (loginResponseModel.isOk) {
          // await _saveInfo(loginResponseModel);
          // await _authenticateApp.updateUserInfo();
          _initFirstLogin(loginResponseModel, email);

          // init app and update userInfo
          // await  getItSuper<AuthenticateApp>().updateUserInfo();
          // await  getItSuper<VitanUser>().initApp(navigatorKey!.currentState!.context);
          logger.d(loginResponseModel.isOk);
          // Update Success
        } else {
          showErrorMessage(AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('an_error_occurred'));
        }
      } else {
        /// Chưa nhập thông tin cá  nhân
        final bool _isUpdate =
            await goToRegisterInformation(navigatorKey!.currentState!.context, loginResponseModel: loginResponseModel);
        if (_isUpdate) {
          _initFirstLogin(loginResponseModel, email);
        }
      }
    });
    hideLoading();
  }

  Future<void> loginGoogle() async {
    try {
      final isLogin = await _googleSignIn.isSignedIn();
      if (isLogin) await logoutGoogle();
      final GoogleSignInAccount? data = await _googleSignIn.signIn();
      print(data);
      if (data != null)
        await data.authentication.then((value) async {
          logger.d(value.idToken);
          await _loginExternal(LoginType.Google, value.idToken, data.email);
        });
    } catch (error) {
      _bndLog.logError("Login Google Error $error");
    }
  }

  Future<void> logoutGoogle() => _googleSignIn.disconnect();

  Future<bool> checkLogin(String username) async {
    showLoading();
    bool check = false;
    final Either<String, LoginResponseModel> res =
        await _userUseCases.checkAccount(LoginRequestModel(username: username));
    res.fold((String failure) {
      showErrorMessage(failure);
    }, (LoginResponseModel _data) {
      check = true;
    });
    hideLoading();
    return check;
  }

  Future<List<TwoFactorType>> login(LoginRequestModel request, BuildContext context, Function successCaptcha) async {
    showLoading();
    List<TwoFactorType> twoFactorTypes = <TwoFactorType>[];
    request.clientId = UserSettings.oidcClientId;
    final Either<String, LoginResponseModel> res = await _userUseCases.loginAccount(request);
    res.fold((String failure) {
      if (failure == 'error_multi_time') {
        showModalCaptcha(
          context,
          loadingColor: CustomTheme.supperAppThemeColor,
          onSuccess: (String token) => successCaptcha(token),
        );
      } else {
        showErrorMessage(failure);
      }
    }, (LoginResponseModel _data) async {
      if (_data.requiresTwoFactor) {
        twoFactorTypes = _data.twoFactorTypes ?? <TwoFactorType>[];
        twoFactorTypes.removeWhere((element) =>
            element.type == TwoFactorTypeEnum.app.getValue || element.type == TwoFactorTypeEnum.prompt.getValue);
        twoFactorTypes.add(TwoFactorType(
            title: AppLocalizations.of(navigatorKey!.currentState!.context)!.translate("use_recovery_code"),
            type: TwoFactorTypeEnum.recovery.getValue));
      } else {
        _initFirstLogin(_data, request.username);
      }
    });
    hideLoading();
    return twoFactorTypes;
  }

  Future<List<TwoFactorType>> getLoginOTPSupport(String username) async {
    List<TwoFactorType> res = [];
    final Either<String, List<TwoFactorType>> data = await _userUseCases.getLoginOTPSupport(username);
    data.fold((String failure) {
      showErrorMessage(failure);
    }, (List<TwoFactorType> _data) {
      res = _data.where((element) => element.type != TwoFactorTypeEnum.app.getValue && element.type != TwoFactorTypeEnum.prompt.getValue ).toList();
      // res.removeWhere((element) =>
      //     element.type == TwoFactorTypeEnum.app.getValue || element.type == TwoFactorTypeEnum.promt.getValue);
    });
    return res;
  }

  Future<TwoFactorSendCodeResponse> twoFactorSendCode(TwoFactorSendCode request) async {
    showLoading();
    TwoFactorSendCodeResponse res = TwoFactorSendCodeResponse();
    final Either<String, TwoFactorSendCodeResponse> data = await _userUseCases.twoFactorSendCode(request);
    data.fold((String failure) {
      showErrorMessage(failure);
    }, (TwoFactorSendCodeResponse _data) {
      res = _data;
    });
    hideLoading();
    return res;
  }

  Future<void> loginTwoFactor(String twoFactorType, String username, String code) async {
    showLoading();
    final String clientId = UserSettings.oidcClientId;
    Either<String, TwoFactorSendCodeResponse> res;
    if (twoFactorType == TwoFactorTypeEnum.authenticator.getValue ||
        twoFactorType == TwoFactorTypeEnum.email.getValue) {
      LoginTwoFactorRequestModel request =
          LoginTwoFactorRequestModel(twoFactorCode: code, userName: username, clientId: clientId);
      res = await _userUseCases.twoFactorLogin(request);
    } else {
      // With recovery
      LoginRecoveryCodeTwoFactorRequestModel request =
          LoginRecoveryCodeTwoFactorRequestModel(recoveryCode: code, userName: username, clientId: clientId);
      res = await _userUseCases.twoFactorLoginWithRecovery(request);
    }
    res.fold((String failure) {
      showErrorMessage(failure);
    }, (TwoFactorSendCodeResponse _data) {
      _initFirstLogin(
          LoginResponseModel(accessToken: _data.data!.accessToken, refreshToken: _data.data!.refreshToken), username);
    });
    hideLoading();
  }

  Future<void> _initFirstLogin(LoginResponseModel _data, String userName) async {
    showLoading();
    await _authenticateApp.saveToken(_data);
    await _authenticateApp.updateUserInfo();
    await _vitanUser.initApp(navigatorKey!.currentState!.context);
    // LocalStoreManager.setString(UserSettings.keyUserName, userName);

    hideLoading();
  }

  Future<void> updateAccount(UpdateAccountRequest accountRequest) async {
    showLoading();
    Either<String, dynamic> res = await _userUseCases.updateAccount(accountRequest);
    res.fold((l) => showErrorMessage, (result) {
      if (result != null) {
        Navigator.pop(navigatorKey!.currentState!.context, true);
      }
    });
    hideLoading();
  }
}
