import 'package:api/api/commondata_api.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_news_state.dart';
import 'package:common/usecases/news/news_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

class VNListNewsBloc extends Cubit<VNListNewsState> {
  VNListNewsBloc(this._newsUsecases) : super(VNListNewsInitial());

  final NewsUsecases _newsUsecases;
  final ContentBasicFilterResource _request = ContentBasicFilterResource(
    pageSize: 20,
    pageIndex: 1,
    keyWord: "",
    isHot: false,
  );

  void init(int blockId, {bool isHot = false}) {
    _request.blockId = blockId; // TODO
    _request.isHot = isHot;
  }

  Future<void> getData() async {
    _request.pageIndex = 1;
    _request.keyWord = "";
    await getListNews(newsRequest: _request);
  }

  Future<void> getDataBySearch(String keyWord) async {
    _request.pageIndex = 1;
    _request.keyWord = keyWord;
    await getListNews(newsRequest: _request);
  }

  Future<void> getListNews({required ContentBasicFilterResource newsRequest}) async {
    if (newsRequest.keyWord == '') {
      emit(VNListNewsLoading());
    }

    final Either<String, ContentListResourceFilterResult> data = await _newsUsecases.getNewsList(newsRequest);
    data.fold((String failure) => emit(VNListNewsError(error: failure)), (ContentListResourceFilterResult data) {
      _request.pageIndex++;
      emit(VNListNewsLoaded(data: data));
    });
  }

  Future<List<ContentListResource>?> getMoreData() async {
    final Either<String, ContentListResourceFilterResult> data = await _newsUsecases.getNewsList(_request);
    List<ContentListResource>? temp;
    data.fold((String l) {
      temp = null;
    }, (ContentListResourceFilterResult r) {
      _request.pageIndex++;
      temp = r.data;
    });
    return temp;
  }
}
