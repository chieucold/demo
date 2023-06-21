import 'package:api/common/model/common_index.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:dartz/dartz.dart';
import 'package:api/api/commondata_api.dart';

import '../../repositories/search/search_repository.dart';

class SearchUseCases {
  final SearchRepository _searchRepository;
  final BNDLog _log;

  SearchUseCases(this._searchRepository, this._log);

  Future<Either<String, SearchFilterResult>> searchSearch(SearchSearchRequest params) async {
    try {
      final SearchFilterResult data = await _searchRepository.searchSearch(params);
      return Right<String, SearchFilterResult>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, SearchFilterResult>(ex.toString());
    }
  }

  Future<Either<String, SearchFilterResultModel>> searchResultDetail(SearchSearchDetailRequest params) async {
    try {
      final SearchFilterResultModel data = await _searchRepository.searchResultDetail(params);
      return Right<String, SearchFilterResultModel>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, SearchFilterResultModel>(ex.toString());
    }
  }

  Future<Either<String, List<SearchStatisticsResource>>> searchStatisticsGetTop(SearchSearchRequest request) async {
    try {
      final List<SearchStatisticsResource> data =
          await _searchRepository.searchStatisticsGetTop(request.page, request.pageSize);
      return Right<String, List<SearchStatisticsResource>>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, List<SearchStatisticsResource>>(ex.toString());
    }
  }

  Future<Either<String, List<SearchStatisticsResource>>> searchStatisticsGetRecent(SearchSearchRequest request) async {
    try {
      final List<SearchStatisticsResource> data =
          await _searchRepository.searchStatisticsGetRecent(request.page, request.pageSize);
      return Right<String, List<SearchStatisticsResource>>(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, List<SearchStatisticsResource>>(ex.toString());
    }
  }
}
