import 'package:api/api/commondata_api.dart';
import 'package:common/usecases/news/news_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import 'vn_list_relative_news_state.dart';

class VNListRelativeNewsBloc extends Cubit<VNListRelativeNewsState> {
  VNListRelativeNewsBloc(this._newsUsecases) : super(VNListRelativeNewsInitial());

  final NewsUsecases _newsUsecases;
  int pageSize = 10;
  int pageIndex = 1;
  int contentId = 66;

  Future<void> getData({required ContentRelationFilterResource request}) async {
    request.pageIndex = pageIndex;
    request.pageSize = pageSize;
    // TODO(sonpn): comment lại dòng dưới nếu cần dùng đúng id của bài viết
    // request.contentId = contentId;
    await getListNewsRelative(request: request);
  }

  Future<void> getListNewsRelative({required ContentRelationFilterResource request}) async {
    emit(VNListRelativeNewsLoading());
    final Either<String, ContentResourceFilterResult> data = await _newsUsecases.getNewsListRelative(request);
    data.fold((String failure) => emit(VNListRelativeNewsError(error: failure)), (ContentResourceFilterResult data) {
      pageIndex++;
      emit(VNListRelativeNewsLoaded(data: data));
    });
  }
}
