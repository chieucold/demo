import 'dart:async';

import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/common_index.dart';
import 'package:common/usecases/search/search_use_cases.dart';
import 'package:core/common/core_module.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:dartz/dartz.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/bloc/vsr4_tab_state.dart';

class VSR4TabBloc extends Cubit<VSR4TabState> {
  final SearchUseCases _searchUseCases;

  VSR4TabBloc(this._searchUseCases) : super(VSR4TabInitial());

  late GroupByObjectType _categorySelected;

  GroupByObjectType get categorySelected => _categorySelected;

  List<GroupByObjectType> _listCategory = [];

  List<GroupByObjectType> get listCategory => _listCategory;

  SearchSearchDetailRequest _request = SearchSearchDetailRequest(
      pageSize: 10, version: '1.0', blockId: 2, keySearch: '', objectType: 0, page: 1);

  final StreamController<int> lengthPage = StreamController<int>();

  // final StreamController<bool> isSetState = StreamController<bool>();

  late String keySearch;

  late int _blockId;

  int get blockId => _blockId;

  Future<void> changeFilter(GroupByObjectType filterType) async {
    _categorySelected = filterType;
    _request.objectType = filterType.objectType;
    emit(VSR4TabLoaded(state.searchFilterResultModel));
  }

  void init(String keyWord, int blockId, {bool isAddStreamController = true}) {
    keySearch = keyWord;
    _blockId = blockId;
    _request
      ..keySearch = keySearch
      ..objectType = 0
      ..blockId = _blockId;
    _categorySelected = GroupByObjectType(objectType: 0);
    _listCategory.clear();
    _listCategory.insert(
        0,
        GroupByObjectType(
            objectType: 0, title: AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('all')));

    getCountTab(isAddStreamController: isAddStreamController);
  }

  void setBlockId(int blockId) {
    _blockId = blockId;
  }

  Future<Either<String, SearchFilterResultModel>> _getData() async {
    return _searchUseCases.searchResultDetail(_request);
  }

  Future<void> getCountTab({bool isAddStreamController = true}) async {
    final Either<String, SearchFilterResultModel> data = await _getData();
    data.fold((l) {
      logger.d(l);
      emit(VSR4TabError());
      lengthPage.add(0);
    }, (SearchFilterResultModel data) {
      logger.d(data.totalRows);
      _listCategory.first.total = data.totalRows;
      _listCategory.addAll(data.groupByObjectType);
      lengthPage.add(data.groupByObjectType.length+1);
      emit(VSR4TabLoaded(data));
    });
  }
}
