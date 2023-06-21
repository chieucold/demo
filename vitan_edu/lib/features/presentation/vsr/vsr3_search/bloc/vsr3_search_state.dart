import 'package:api/api/commondata_api.dart';

abstract class VSR3SearchState {}

class VSR3SearchInitial extends VSR3SearchState {}

class VSR3SearchLoading extends VSR3SearchState {}

class VSR3SearchLoaded extends VSR3SearchState {
  final SearchFilterResult data;
  VSR3SearchLoaded({required this.data});
}

class VSR3SearchError extends VSR3SearchState {
  final String error;
  VSR3SearchError({required this.error});
}
