import 'package:api/api/commondata_api.dart';
import 'package:common/components/news/vn/vn_detail_news/bloc/vn_detail_news_state.dart';
import 'package:common/usecases/news/news_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VNDetailNewsBloc extends Cubit<VNDetailNewsState> {
  VNDetailNewsBloc(this._newsUsecases) : super(VNDetailNewsInitial());

  final NewsUsecases _newsUsecases;

  Future<void> getData(int id, String? path) async {
    await getDetailNews(id, path);
  }

  Future<void> getDetailNews(int id, String? path) async {
    emit(VNDetailNewsLoading());
    final Either<String, ContentResource> data = await _newsUsecases.getNewsDetail(id, path);
    data.fold((String failure) => emit(VNDetailNewsError(error: failure)), (ContentResource data) {
      emit(VNDetailNewsLoaded(newsDetail: data));
    });
  }
}
