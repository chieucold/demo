import 'package:api/api/commondata_api.dart';

abstract class VSR3SearchStatisticsState {}

class VSR3SearchStatisticsInitial extends VSR3SearchStatisticsState {}

class VSR3SearchStatisticsLoading extends VSR3SearchStatisticsState {}

class VSR3SearchStatisticsLoaded extends VSR3SearchStatisticsState {
  final List<SearchStatisticsResource> searchRecent;
  final List<SearchStatisticsResource> searchTop;
  VSR3SearchStatisticsLoaded({required this.searchRecent, required this.searchTop});
}

class VSR3SearchStatisticsError extends VSR3SearchStatisticsState {
  final String error;
  VSR3SearchStatisticsError({required this.error});
}
