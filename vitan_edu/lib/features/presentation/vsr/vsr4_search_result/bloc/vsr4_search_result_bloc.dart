import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';
import 'package:common/usecases/search/search_use_cases.dart';
import 'package:core/common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/bloc/vsr4_search_result_state.dart';
import 'package:dartz/dartz.dart';

class VSR4SearchResultBloc extends Cubit<VSR4SearchResultState> {
  final SearchUseCases _searchUseCases;

  VSR4SearchResultBloc(this._searchUseCases) : super(VSR4SearchResultInitial());

  late SearchSearchDetailRequest _request;

  void init(int objectType, int blockId,String keySearch) {
    // logger.d('objectType $objectType');
    emit(VSR4SearchResultLoading());
    _request = SearchSearchDetailRequest(
        pageSize: AppConfig.pageSize, version: '1.0', blockId: blockId, keySearch: keySearch, objectType: objectType, page: 1);
    searchData();
  }


  Future<void> refresh(int blockId) async {
    emit(VSR4SearchResultLoading());
    logger.d(blockId);
    _request..blockId = blockId;
    await resetPage();
    await searchData();
  }

  Future<void> resetPage() async {
    _request.page = 1;
  }

  void _incrementPage() {
    _request.page++;
  }

  Future<Either<String, SearchFilterResultModel>> _getData() async {
    return _searchUseCases.searchResultDetail(_request);
  }

  Future<List<DataSearch>> loadMore() async {
    List<DataSearch> _listData = [];
    final Either<String, SearchFilterResultModel> data = await _getData();
    data.fold((l) => emit(VSR4SearchResultError()), (data) {
      _listData = data.data;
      if (data != null) _incrementPage();
    });
    return _listData;
  }

  Future<void> searchData() async {
    final Either<String, SearchFilterResultModel> data = await _getData();
    data.fold((l) => emit(VSR4SearchResultError()), (SearchFilterResultModel data) {
      if (data != null) _incrementPage();
      emit(VSR4SearchResultLoaded(data));
    });
  }
}
