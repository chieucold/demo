import 'package:api/id/id_rest_api.dart';
import 'package:api/system/model/system_index.dart';
import 'package:common/common/injection_common.dart';
import 'package:core/common/common.dart';
import 'package:core/common/core_module.dart';
import 'package:flutter/foundation.dart';
import 'package:vitan_edu/core/common/deep_link.dart';
import 'injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vitan_edu/core/common/vitan_user.dart';

final GetIt getItSuper = GetIt.instance;

@injectableInit
void configureInjection() {
  registCoreModule(getItSuper);
  injectionCommon(getItSuper);
  getItSuper.registerLazySingleton<IdResAPI>(
      () => IdResAPI(getItSuper(), baseUrl: kDebugMode ? ApiPath.Id : ApiPathRelease.Id));
  getItSuper.registerLazySingleton<SystemRestAPI>(
      () => SystemRestAPI(getItSuper(), baseUrl: kDebugMode ? ApiPath.SYSTEM : ApiPathRelease.SYSTEM));
  getItSuper.registerLazySingleton<DeepLink>(() => DeepLink());
  // getItSuper.registerLazySingleton<PaymentAPI>(() => PaymentAPI(getItSuper()));
  getItSuper.registerLazySingleton<VitanUser>(
      () => VitanUser(getItSuper(), getItSuper(), getItSuper(), getItSuper(), getItSuper()));
  $initGetIt(getItSuper);
}
