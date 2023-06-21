import 'package:api/api/commondata_api.dart';
import 'package:api/api/exam_api.dart';
import 'package:api/api/guide_api.dart';
import 'package:api/api/learn_api.dart';
import 'package:api/api/realtime_api.dart';
import 'package:api/api/system_api.dart';
import 'package:api/api/payment_auto_api.dart';
import 'package:api/guide/model/guide_custom_api.dart';
import 'package:api/payment/model/payment_api.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/common.dart';
import 'package:core/common/in_app_purchase/in_app_purchase_service.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:core/common/tracking/tracking.dart';
import 'package:core/components/advertisement_slider_widget/bloc/advertisement_slider_bloc.dart';
import 'package:core/components/comment/bloc/bnd_comment_bloc.dart';
import 'package:core/components/comment/bloc/bnd_comment_reply_bloc.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/notification/bloc/noti_count_bloc.dart';
import 'package:core/components/payment/payment_cart/bloc/payment_bloc.dart';
import 'package:core/components/upload/bloc/bnd_upload_file_bloc.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_bloc.dart';
import 'package:core/components/vhs9_notification/bloc/vhs9_notification_filter_bloc.dart';
import 'package:core/repositories/advertisement_repository/advertisement_repository.dart';
import 'package:core/repositories/app/app_repository.dart';
import 'package:core/repositories/comment/comment_news_repository.dart';
import 'package:core/repositories/core_user_repository.dart';
import 'package:core/repositories/core_user_repository_impl.dart';
import 'package:core/repositories/notification/notification_repository.dart';
import 'package:core/repositories/object/object_repository.dart';
import 'package:core/repositories/otp/otp_repository.dart';
import 'package:core/repositories/payment/payment_repository.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:core/usecases/advertisement/advertisement_cases.dart';
import 'package:core/usecases/app/app_usecase.dart';
import 'package:core/usecases/comment/comment_news_usecase.dart';
import 'package:core/usecases/notification/notification_usecases.dart';
import 'package:core/usecases/object/object_usecases.dart';
import 'package:core/usecases/otp/otp_usecases.dart';
import 'package:core/usecases/payment/payment_usecases.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:api/api/event_api.dart';

import '../components/curved_navigation_bar/custom_navigator/bloc/hide_appear_navigator_bloc.dart';
import 'connectivity/connectivity_core.dart';

final GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

void registCoreModule(GetIt getIt) {
  getIt.registerLazySingleton<CoreUserRepository>(() => CoreUserRepositoryImpl());
  getIt.registerLazySingleton<AuthenticateApp>(() => AuthenticateApp(getIt()));
  getIt.registerFactory<BNDUploadFileBloc>(() => BNDUploadFileBloc());
  getIt.registerLazySingleton<Tracking>(() => Tracking());
  getIt.registerLazySingleton<BNDLog>(() => BNDLog(getIt()));
  getIt.registerLazySingleton<GlobalVariableResource>(() => GlobalVariableResource());
  getIt.registerLazySingleton<AppSettings>(() => AppSettings(getIt()));

  //------- API ------

  getIt.registerLazySingleton<SystemApi>(
      () => SystemApi(getIt(), baseUrl: kDebugMode ? ApiPath.SYSTEM : ApiPathRelease.SYSTEM));
  getIt.registerLazySingleton<CommondataApi>(
      () => CommondataApi(getIt(), baseUrl: kDebugMode ? ApiPath.COMMON_DATA : ApiPathRelease.COMMON_DATA));
  getIt
      .registerLazySingleton<ExamApi>(() => ExamApi(getIt(), baseUrl: kDebugMode ? ApiPath.EXAM : ApiPathRelease.EXAM));
  getIt.registerLazySingleton<GuideApi>(
      () => GuideApi(getIt(), baseUrl: kDebugMode ? ApiPath.GUIDE : ApiPathRelease.GUIDE));

  getIt.registerLazySingleton<LearnApi>(
      () => LearnApi(getIt(), baseUrl: kDebugMode ? ApiPath.LEARN : ApiPathRelease.LEARN));

  getIt.registerLazySingleton<PaymentAPI>(
      () => PaymentAPI(getIt(), baseUrl: kDebugMode ? ApiPath.payment : ApiPathRelease.payment));

  getIt.registerLazySingleton<GuideCustomAPI>(
      () => GuideCustomAPI(getIt(), baseUrl: kDebugMode ? ApiPath.payment : ApiPathRelease.payment));

  getIt.registerLazySingleton<RealtimeApi>(
      () => RealtimeApi(getIt(), baseUrl: kDebugMode ? ApiPath.REALTIME : ApiPathRelease.REALTIME));

  getIt.registerLazySingleton<PaymentAutoApi>(
      () => PaymentAutoApi(getIt(), baseUrl: kDebugMode ? ApiPath.payment : ApiPathRelease.payment));
  getIt.registerLazySingleton<EventApi>(
      () => EventApi(getIt(), baseUrl: kDebugMode ? ApiPath.event : ApiPathRelease.event));
  //------- Các phần dùng chung ------

  //end Event

  getIt.registerLazySingleton<AdvertisementRepository>(() => AdvertisementRepository(getIt()));
  getIt.registerLazySingleton<AdvertisementUseCases>(() => AdvertisementUseCases(getIt()));
  getIt.registerFactory<AdvertisementSliderBloc>(() => AdvertisementSliderBloc(getIt()));

  // Payment
  getIt.registerLazySingleton<PaymentRepository>(() => PaymentRepository(getIt(), getIt()));
  getIt.registerLazySingleton<PaymentUsecases>(() => PaymentUsecases(getIt(), getIt()));
  getIt.registerLazySingleton<PaymentBloc>(() => PaymentBloc(getIt()));

  // connectivity
  getIt.registerLazySingleton<ConnectivityCore>(() => ConnectivityCore());

  // OTP
  getIt.registerLazySingleton<OtpRepository>(() => OtpRepository(getIt()));
  getIt.registerLazySingleton<OtpUsecases>(() => OtpUsecases(getIt(), getIt()));

  // Share
  getIt.registerLazySingleton<AppRepository>(() => AppRepository(getIt()));
  getIt.registerLazySingleton<AppUseCases>(() => AppUseCases(getIt(), getIt()));

  // Notification count
  getIt.registerLazySingleton<NotiCountBloc>(() => NotiCountBloc(getIt()));
  getIt.registerLazySingleton<NotificationUsecases>(() => NotificationUsecases(getIt()));
  getIt.registerLazySingleton<NotificationRepository>(() => NotificationRepository(getIt()));

  // Comment
  getIt.registerFactory<BNDCommentBloc>(() => BNDCommentBloc(getIt()));
  getIt.registerFactory<BNDCommentReplyBloc>(() => BNDCommentReplyBloc());
  getIt.registerLazySingleton<CommentNewsUsecase>(() => CommentNewsUsecase(getIt(), getIt()));
  getIt.registerLazySingleton<CommentNewsRepository>(() => CommentNewsRepository(getIt()));

  // // News
  // getIt.registerLazySingleton<NewsRepository>(() => NewsRepository(getIt()));
  // getIt.registerLazySingleton<NewsUsecases>(() => NewsUsecases(getIt(), getIt()));
  // getIt.registerFactory<ListRelativeNewsBloc>(() => ListRelativeNewsBloc(getIt()));
  // getIt.registerFactory<DetailNewsBloc>(() => DetailNewsBloc(getIt()));

  // VHS9 Notification
  getIt.registerFactory<VHS9NotificationBloc>(() => VHS9NotificationBloc(getIt()));
  getIt.registerFactory<VHS9NotificationFilterBloc>(() => VHS9NotificationFilterBloc());

  //object
  getIt.registerLazySingleton<ObjectRepository>(() => ObjectRepository(getIt()));
  getIt.registerLazySingleton<ObjectUseCases>(() => ObjectUseCases(getIt()));

  // HideAppearNavigatorBloc
  getIt.registerLazySingleton<HideAppearNavigatorBloc>(() => HideAppearNavigatorBloc());

  // InAppPurchaseBloc
  getIt.registerLazySingleton<InAppPurchaseService>(() => InAppPurchaseService(getIt(), getIt()));
}
