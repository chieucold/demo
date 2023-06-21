import 'dart:convert';
import 'dart:io';

import 'package:core/common/common.dart';
import 'package:core/components/user/bnd_token.dart';
import 'package:core/model/user_info.dart';
import 'package:core/repositories/core_user_repository.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CoreUserRepositoryImpl extends CoreUserRepository {
  final String grantTypeRefreshToken = "refresh_token";
  final String grantType = "grant_type";
  final String clientID = "client_id";
  final String idPath = kDebugMode ? ApiPath.Id : ApiPathRelease.Id;
  String get tokenEndpoint => '$idPath/connect/token';
  String get userInfoEndpoint => '$idPath/connect/userinfo';
  final String contentTypeFormUrlEncoded = 'application/x-www-form-urlencoded';

  @override
  Future<Token?> refreshToken({String clientId = UserSettings.oidcClientId, String refreshToken = ''}) async {
    // ignore: parameter_assignments
    if (refreshToken.isEmpty) refreshToken = LocalStoreManager.getString(UserSettings.refreshToken);
    final Map<String, String> body = <String, String>{
      clientID: clientId,
      grantType: grantTypeRefreshToken,
      grantTypeRefreshToken: refreshToken
    };
    try {
      return http
          .post(Uri.parse(tokenEndpoint), headers: _getHeaders(), body: body)
          .then((http.Response response) => handleJsonResponse(response))
          .then((Map<String, dynamic>? value) {
        if (value != null) {
          final Token token = Token.fromJsonMap(value);
          LocalStoreManager.setString(UserSettings.tokenUser, token.accessToken);
          LocalStoreManager.setString(UserSettings.refreshToken, token.refreshToken);
          return token;
        }
      });
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  @override
  bool get isLogin => LocalStoreManager.getString(UserSettings.tokenUser).isNotEmpty;

  @override
  Future<void> setIsLogin() {
    throw UnimplementedError();
  }

  Map<String, String> _getHeaders() {
    // ignore: always_specify_types
    return {
      'Content-Type': contentTypeFormUrlEncoded,
      "Authorization": 'Bearer ${LocalStoreManager.getString(UserSettings.tokenUser)}'
    };
  }

  static const List<int> _okStatus = <int>[HttpStatus.ok, HttpStatus.created, HttpStatus.accepted];

  Map<String, dynamic>? handleJsonResponse(http.Response response, [String endpoint = '']) {
    if (_okStatus.contains(response.statusCode)) {
      return json.decode(response.body);
    }
    if (response.statusCode == HttpStatus.unauthorized) {
      return null;
    } else {
      return null;
    }
  }

  @override
  Future<UserInfoApiModel?> getUserInfo() async {
    try {
      return http
          .get(Uri.parse(userInfoEndpoint), headers: _getHeaders())
          .then((http.Response response) => handleJsonResponse(response))
          .then((Map<String, dynamic>? value) {
        if (value != null) {
          final UserInfoApiModel userInfo = UserInfoApiModel.fromJson(value);
          return userInfo;
        }
      });
    } catch (ex) {
      print(ex);
    }

    return null;
  }
}
