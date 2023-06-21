import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';

class SearchRepository {
  final CommondataApi _commondataApi;

  SearchRepository(this._commondataApi);

  Future<SearchFilterResult> searchSearch(SearchSearchRequest request) async {
    return await _commondataApi.searchSearch(request);
  }

  Future<List<SearchStatisticsResource>> searchStatisticsGetTop(int page, int pageSize) async {
    return await _commondataApi.searchStatisticsGetTop(page, pageSize);
  }

  Future<List<SearchStatisticsResource>> searchStatisticsGetRecent(int page, int pageSize) async {
    return await _commondataApi.searchStatisticsGetRecent(page, pageSize);
  }

  Future<SearchFilterResultModel> searchResultDetail(SearchSearchDetailRequest request) async {
    return await _commondataApi.searchSearchDetail(request);
  }
}
