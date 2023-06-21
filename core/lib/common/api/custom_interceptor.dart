import 'dart:convert';

import 'package:core/common/common.dart';
import 'package:core/common/connectivity/connectivity_core.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/constants/user_settings.dart';
import 'package:core/common/core_module.dart';
import 'package:core/components/bnd_message.dart';
import 'package:core/components/user/bnd_token.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/repositories/core_user_repository.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

List<String> _excludeAddBlockUrls = <String>[
  "/AppSetting/Init",
  // "/SearchStatistics/GetTop",
];

class CustomInterceptor extends InterceptorsWrapper {
  int retryCount = 0;
  int currentShowErrorTimeout = 0;

  @override
  // ignore: avoid_void_async
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final ConnectivityCore connectivityCore = GetIt.I();
    // if (!await connectivityCore.checkConnect()) {
    //   print('No Internet');
    //   return showDisconnectInternet();
    // }
    final int _blockIdRequest = options.queryParameters['blockId'] ?? 0;

    final int blockId = LocalStoreManager.getInt(BlockSettings.blockKey);
    options.headers = <String, dynamic>{
      "Content-type": "application/json",
      "blocktype": blockId,
    };
    final String token = LocalStoreManager.getString(UserSettings.tokenUser);
    if (token.isNotEmpty) options.headers["Authorization"] = "Bearer $token";

    final String method = options.method.toLowerCase();
    if (method == 'get' || method == 'put') {
      // xử lý double request đá .0
      options.queryParameters.forEach((String key, dynamic value) {
        if (value != null && value is double && Utils.getDecimal(value) == 0) {
          options.queryParameters[key] = value.toInt();
        }
      });

      if (blockId > 0 &&
          _blockIdRequest == 0 &&
          !_excludeAddBlockUrls
              .any((String element) => options.uri.path.toLowerCase().contains(element.toLowerCase()))) {
        options.queryParameters.addAll(<String, int>{"block": blockId});
        options.queryParameters.addAll(<String, int>{"blockId": blockId});
      }
    }

    return super.onRequest(options, handler);
  }

  @override
  // ignore: always_specify_types
  onResponse(Response response, ResponseInterceptorHandler handler) {
    final bool isObject = response.data.runtimeType.toString() == "_InternalLinkedHashMap<String, dynamic>";
    if (isObject && response.data["serverTime"] != null) {
      Utils.setServerTime(response.data["serverTime"].toString());
    }
    if (response.data.runtimeType.toString().toLowerCase() == "string") response.data = json.decode(response.data);
    try {
      if (response.data["result"] != null) response.data = response.data["result"];
    } catch (_) {}

    if (retryCount > 0) {
      retryCount = 0;
    }
    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    if (retryCount >= 3) {
      return;
    }
    if (err != null && err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      retryCount++;
      final Dio dio = GetIt.I();
      final RequestOptions options = err.requestOptions;
      dio.lock();
      dio.interceptors.requestLock.lock();
      dio.interceptors.responseLock.lock();

      final CoreUserRepository sessionRepository = GetIt.I();
      final Token? token = await sessionRepository.refreshToken(
          clientId: UserSettings.oidcClientId, refreshToken: LocalStoreManager.getString(UserSettings.refreshToken));
      if (token == null) {
        // final AuthenticateApp authenticateApp = GetIt.I();
        // await authenticateApp.authenticate(UserSettings.oidcClientId, <String>["profile", "email", "offline_access"]);
        await Navigator.pushNamedAndRemoveUntil(
            navigatorKey!.currentState!.context, vhs3LoginUser, (Route<dynamic> route) => false);
      } else {
        dio.unlock();
        dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.unlock();
        options.headers = <String, dynamic>{
          "Content-type": "application/json",
          "Authorization": "Bearer ${LocalStoreManager.getString(UserSettings.tokenUser)}"
        };
        await dio.fetch<dynamic>(options);
      }
    }

    final dynamic errorData = err.response?.data;
    //&& err.response?.statusCode == 400
    if (err != null && errorData != null && errorData["responseException"] != null) {
      final dynamic temp = errorData["responseException"]["exceptionMessage"];
      try {
        if (temp != null && temp["error"] != null)
          err.response?.data = temp["error"];
        else
          err.response?.data = temp;
      } catch (e) {
        err.response?.data = temp;
      }
    }
    if (err.type == DioErrorType.receiveTimeout ||
        err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.sendTimeout) {
      if (currentShowErrorTimeout == 0) {
        currentShowErrorTimeout = 1;
        hideLoading();
        showErrorMessage(AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('an_error_plese_try_app'));
        currentShowErrorTimeout = 0;
      }
    }

    if (err.type == DioErrorType.other && err.message.contains('Connection failed')) {
      return showDisconnectInternet();
    }
    return super.onError(err, handler);
  }
}
