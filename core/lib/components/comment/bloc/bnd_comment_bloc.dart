import 'package:api/api/commondata_api_models.dart';
import 'package:core/common/common.dart';
import 'package:core/components/core_component.dart';
import 'package:core/usecases/comment/comment_news_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:core/common/extension/string_extension.dart';
import 'package:collection/collection.dart';

import 'bnd_comment_state.dart';

class BNDCommentBloc extends Cubit<BNDCommentState> {
  BNDCommentBloc(this._commentNewsUsecase) : super(BNDCommentInitial());

  final CommentNewsUsecase _commentNewsUsecase;
  late bool maxList;

  CommentPublicResourceFilterResult get _data => state.data;
  List<CommentPublicResource> get _items => _data.data!;

  final CommentGetListByObjectIdRequest _request =
      CommentGetListByObjectIdRequest(objectType: "Exam", pageIndex: 1, pageSize: 10, parentId: "", objectId: 4);

  List<CommentPublicResource> getItem(String? parentId) {
    if (!parentId.isNullOrEmpty) {
      final CommentPublicResource? parent =
          _items.firstWhereOrNull((CommentPublicResource element) => element.id == parentId);
      if (parent != null) {
        parent.childsResource ??= <CommentPublicResource>[];
        return parent.childsResource!;
      }
    }

    return _items;
  }

  void init(int objectId, String objectType) {
    // _request.objectId = "4"; //Todo objectId
    _request.objectId = objectId;
    _request.objectType = objectType;
    // _request.objectType = 'News';
  }

  Future<void> getComment(int id) async {
    _request.pageIndex = 1;
    _request.parentId = "";
    maxList = false;
    await getCommentNews(request: _request);
  }

  Future<void> getMoreComment({String? parentID}) async {
    parentID != null ? await getMoreCommentChild(parentID: parentID) : await getMoreCommentNews();
  }

  Future<void> createComment(String content, String fileUrl, {String? paramParentId}) async {
    final CommentSaveResource request = CommentSaveResource(
        objectId: _request.objectId.toString(),
        objectType: _request.objectType,
        content: content,
        parentId: paramParentId ?? "",
        fileUrls: fileUrl,
        listTagUserId: <MentionInComment>[]);
    await createCommentBloc(request);
  }

  Future<void> createCommentBloc(CommentSaveResource request) async {
    // print(state.data.data.length);
    showLoading();
    final Either<String, CommentPublicResource> data = await _commentNewsUsecase.createCommentNews(request);
    data.fold((String failure) => showErrorMessage(failure), (CommentPublicResource commentNews) {
      hideLoading();
      final List<CommentPublicResource> items = getItem(request.parentId);
      items.add(commentNews);
      if (request.parentId == "") {
        _data.totalRows++;
      } else {
        _data.data!.firstWhere((CommentPublicResource element) => element.id == request.parentId).commentCount++;
      }

      emit(BNDCommentLoaded(data: _data));
    });
  }

  Future<void> getCommentNews({required CommentGetListByObjectIdRequest request}) async {
    emit(BNDCommentLoading());
    final Either<String, CommentPublicResourceFilterResult> data =
        await _commentNewsUsecase.getListCommentNews(request);
    data.fold((String failure) => emit(BNDCommentError(error: failure)), (CommentPublicResourceFilterResult data) {
      _request.pageIndex++;
      emit(BNDCommentLoaded(
        data: data,
      ));
    });
  }

  Future<void> getMoreCommentNews() async {
    final Either<String, CommentPublicResourceFilterResult> data =
        await _commentNewsUsecase.getListCommentNews(_request);
    data.fold((String failure) => showErrorMessage(failure), (CommentPublicResourceFilterResult data) {
      _request.pageIndex++;
      _items.addAll(data.data!);
      emit(BNDCommentLoaded(
        data: _data,
      ));
    });
  }

  Future<void> getMoreCommentChild({String? parentID}) async {
    final CommentGetListByObjectIdRequest request = CommentGetListByObjectIdRequest(
      objectId: _request.objectId,
      objectType: _request.objectType,
      parentId: parentID ?? "",
      pageIndex: 1,
      pageSize: 100,
    );
    final Either<String, CommentPublicResourceFilterResult> data =
        await _commentNewsUsecase.getListCommentChildNews(request);
    data.fold((String failure) => showErrorMessage(failure), (CommentPublicResourceFilterResult data) {
      final List<CommentPublicResource> items = getItem(parentID);
      items.clear();
      items.addAll(data.data!);
      emit(BNDCommentLoaded(
        data: _data,
      ));
    });
  }

  Future<void> deleteCommentNews({required String id, required String parentId}) async {
    showLoading();
    final Either<String, bool> data = await _commentNewsUsecase.deleteCommentNews(id);
    data.fold((String failure) => showErrorMessage(failure), (bool data) {
      hideLoading();
      final List<CommentPublicResource> items = getItem(parentId);
      items.removeWhere((CommentPublicResource e) => e.id == id);
      if (parentId == "") {
        _data.totalRows--;
      } else {
        _data.data!.firstWhere((CommentPublicResource element) => element.id == parentId).commentCount--;
      }
      emit(BNDCommentLoaded(
        data: _data,
      ));
      // }
    });
  }

  Future<void> updateCommentNews({required CommentPublicResource request, required String text}) async {
    request.content = text;
    final CommentSaveResource _request = CommentSaveResource(
      content: request.content,
      id: request.id,
      commentCount: request.commentCount,
      fileUrls: request.fileUrls,
      listTagUserId: request.listTagUserId,
      objectId: request.objectId,
      objectType: request.objectType,
      parentId: request.parentId,
    );
    final Either<String, CommentPublicResource> data = await _commentNewsUsecase.updateCommentNews(_request);
    data.fold((String failure) => showErrorMessage(failure), (CommentPublicResource commentNews) {
      final List<CommentPublicResource> items = getItem(commentNews.parentId);
      for (final CommentPublicResource element in items) {
        if (element.id == commentNews.id) {
          element.content = commentNews.content;
        }
      }
      emit(BNDCommentLoaded(data: _data));
    });
  }

  Future<void> reactionComment(String objectId, int reactionId) async {
    await _commentNewsUsecase.reactionCommentNews(objectId, reactionId);
  }
}
