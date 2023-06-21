import 'package:api/api/commondata_api.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_overview_news_state.dart';
import 'package:common/usecases/news/news_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

class VNListOverviewNewsBloc extends Cubit<VNListOverviewNewsState> {
  VNListOverviewNewsBloc(this._newsUsecases) : super(VNListOverviewNewsInitial());

  final NewsUsecases _newsUsecases;
  final ContentBasicFilterResource _request = ContentBasicFilterResource(
    pageSize: 20,
    pageIndex: 1,
    isHot: false,
  );

  void init(int blockId) {
    _request.blockId = blockId; // TODO
  }

  Future<void> getData() async {
    _request.pageIndex = 1;
    await getcontentGetListBasic(newsRequest: _request);
  }

  Future<void> getcontentGetListBasic({required ContentBasicFilterResource newsRequest}) async {
      emit(VNListOverviewNewsLoading());

    final Either<String, ContentListPublicResource> data = await _newsUsecases.contentGetListBasic(newsRequest);
    data.fold((String failure) => emit(VNListOverviewNewsError(error: failure)), (ContentListPublicResource data) {
      _request.pageIndex++;
      emit(VNListOverviewNewsLoaded(data: data));
    });
  }

  Future<List<ContentListResource>?> getMoreData() async {
    final Either<String, ContentListPublicResource> data = await _newsUsecases.contentGetListBasic(_request);
    List<ContentListResource>? temp;
    data.fold((String l) {
      temp = null;
    }, (ContentListPublicResource r) {
      _request.pageIndex++;
      temp = r.listContentOther!.data;
    });
    return temp;
  }
}
