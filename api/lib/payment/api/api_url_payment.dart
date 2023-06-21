import 'package:core/common/common.dart';
import 'package:core/components/core_component.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class ApiUrlPayment {
  static String goToWebviewCart = (kDebugMode
          ? (ApiPath.payment + '/checkout/cart/')
          : (ApiPathRelease.payment + '/checkout')) +
      '?rel=bnd-app&token=${LocalStoreManager.getString(UserSettings.tokenUser)}&sub=${GetIt.I<AuthenticateApp>().getCurrentUserId()}&id='; //&password=bndtechok
  static const String addExamPackageToCart = '/api/checkout/v1.0/Cart/Create';
  static const String getExamPackageCart = '/api/checkout/v1/Cart/Get';
  static const String password = '&password=bndtechok';
}
