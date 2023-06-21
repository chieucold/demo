import 'package:core/common/api/custom_interceptor.dart';
import 'package:core/common/common.dart';
import 'package:core/common/core_module.dart';
import 'package:core/components/core_component.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(),
);

@module
abstract class RegisterCommonModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.addAll(kDebugMode
        ? [CustomInterceptor(), BNDAlice.setAndGetAlice(navigatorKey).getDioInterceptor()]
        : [CustomInterceptor()])
    ..options = BaseOptions(
      receiveTimeout: AppConfig.timerTimeOut,
      connectTimeout: AppConfig.timerTimeOut,
      sendTimeout: AppConfig.timerTimeOut,
    );
}
