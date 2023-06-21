import 'package:common/components/search/vsr3_search/bloc/vsr3_search_statistics_state.dart';
import 'package:common/usecases/search/search_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api/api/commondata_api.dart';
import 'package:dartz/dartz.dart';

class VSR3SearchStatisticsBloc extends Cubit<VSR3SearchStatisticsState> {
  VSR3SearchStatisticsBloc(this._searchUseCases) : super(VSR3SearchStatisticsInitial());

  final SearchUseCases _searchUseCases;
  final SearchSearchRequest _request = SearchSearchRequest(pageSize: 8, page: 1);
  void init({int? pageSize}) => _request
    ..page = 1
    ..pageSize = pageSize ?? 8;

  Future<void> getData() async {
    List<SearchStatisticsResource> _searchRecent = [];
    List<SearchStatisticsResource> _searchTop = [];
    final Either<String, List<SearchStatisticsResource>> searchRecent =
        await _searchUseCases.searchStatisticsGetRecent(_request);
    searchRecent.fold((l) => null, (r) {
      _searchRecent = r;
    });
    final Either<String, List<SearchStatisticsResource>> searchTop =
        await _searchUseCases.searchStatisticsGetTop(_request);
    searchTop.fold((l) => null, (r) {
      _searchTop = r;
    });
    emit(VSR3SearchStatisticsLoaded(searchRecent: _searchRecent, searchTop: _searchTop));
  }
}
