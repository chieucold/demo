import 'package:common/components/block/bloc/block_bloc.dart';
import 'package:common/components/event/event_bloc/event_bloc.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_list_event_bloc.dart';
import 'package:common/components/event/veo/veo2_list_event/bloc/veo2_tab_bloc.dart';
import 'package:common/components/event/veo/veo5_event_detail/bloc/veo5_event_detail_bloc.dart';
import 'package:common/components/event/veo/veo6_list_member_event/bloc/veo6_list_member_event_bloc.dart';
import 'package:common/components/news/vn/vn_detail_news/bloc/vn_detail_news_bloc.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_news_bloc.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_overview_news_bloc.dart';
import 'package:common/components/news/vn/vn_relative_news/bloc/vn_list_relative_news_bloc.dart';
import 'package:common/repositories/category/category_repository.dart';
import 'package:common/repositories/event/event_repository.dart';
import 'package:common/repositories/news/news_repository.dart';
import 'package:common/usecases/category/category_use_cases.dart';
import 'package:common/usecases/event/event_use_cases.dart';
import 'package:common/usecases/news/news_usecases.dart';
import 'package:get_it/get_it.dart';

import '../components/choose_category/bloc/choose_category_bloc.dart';
import '../components/choose_category/bloc/choose_category_item_bloc.dart';
import '../components/search/vsr3_search/bloc/vsr3_search_statistics_bloc.dart';
import '../repositories/search/search_repository.dart';
import '../usecases/search/search_use_cases.dart';

void injectionCommon(GetIt getIt) {
  // News
  getIt.registerLazySingleton<NewsRepository>(() => NewsRepository(getIt()));
  getIt.registerLazySingleton<NewsUsecases>(() => NewsUsecases(getIt(), getIt()));
  getIt.registerFactory<VNListRelativeNewsBloc>(() => VNListRelativeNewsBloc(getIt()));
  getIt.registerFactory<VNDetailNewsBloc>(() => VNDetailNewsBloc(getIt()));

  getIt.registerFactory<VNListNewsBloc>(() => VNListNewsBloc(getIt()));
  getIt.registerFactory<VNListOverviewNewsBloc>(() => VNListOverviewNewsBloc(getIt()));

  // Event
  getIt.registerFactory<EventBloc>(() => EventBloc(getIt()));
  getIt.registerFactory<VEO5EventDetailBloc>(() => VEO5EventDetailBloc(getIt(), getIt()));
  getIt.registerFactory<VEO6ListMemberEventBloc>(() => VEO6ListMemberEventBloc(getIt()));
  getIt.registerFactory<VEO2TabBloc>(() => VEO2TabBloc(getIt()));
  getIt.registerFactory<VEO2ListEventBloc>(() => VEO2ListEventBloc(getIt()));

  getIt.registerLazySingleton<EventUseCases>(() => EventUseCases(getIt(), getIt()));
  getIt.registerLazySingleton<EventRepository>(() => EventRepository(getIt()));

  // Choose Category
  getIt.registerFactory<ChooseCategoryBloc>(() => ChooseCategoryBloc());
  getIt.registerFactory<ChooseCategoryItemBloc>(() => ChooseCategoryItemBloc(getIt(), getIt()));
  getIt.registerFactory<CategoryRepository>(() => CategoryRepository(getIt()));
  getIt.registerFactory<CategoryUseCases>(() => CategoryUseCases(getIt(), getIt()));

  // VSR3
  getIt.registerFactory<SearchRepository>(() => SearchRepository(getIt()));
  getIt.registerFactory<SearchUseCases>(() => SearchUseCases(getIt(), getIt()));
  getIt.registerFactory<VSR3SearchStatisticsBloc>(() => VSR3SearchStatisticsBloc(getIt()));

  // Choose Category
  getIt.registerFactory<BlockBloc>(() => BlockBloc());
}
