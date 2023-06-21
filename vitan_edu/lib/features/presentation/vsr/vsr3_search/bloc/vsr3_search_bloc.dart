import 'dart:async';

import 'package:common/usecases/search/search_use_cases.dart';
import 'package:core/common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/bloc/vsr3_search_state.dart';
import 'package:api/api/commondata_api.dart';
import 'package:dartz/dartz.dart';

class VSR3SearchBloc extends Cubit<VSR3SearchState> {
  VSR3SearchBloc(this._searchUseCases) : super(VSR3SearchInitial());

  final SearchUseCases _searchUseCases;
  final SearchSearchRequest _request = SearchSearchRequest(pageSize: 20, page: 1);
  
  StreamController<BlockModel> blockStreamController = StreamController();
  
  void init() {
    _request.page = 1;
  }

  Future<void> getData(String keyword, int blockId) async {
    // emit(VSR3SearchLoading());
    _request
      ..page = 1
      ..blockId = blockId;
    if (keyword == '') return;
    _request.keySearch = keyword;
    final Either<String, SearchFilterResult> data = await _searchUseCases.searchSearch(_request);
    data.fold((l) => null, (r) {
      emit(VSR3SearchLoaded(data: r));
    });
  }

  Future<List<SearchResource>?> getMoreData() async {
    _request.page++;
    final Either<String, SearchFilterResult> data = await _searchUseCases.searchSearch(_request);
    List<SearchResource>? temp;
    data.fold((l) {
      temp = null;
    }, (r) {
      temp = r.data;
    });
    return temp;
  }
}
