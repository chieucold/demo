import 'package:api/api/commondata_api.dart';
import 'package:core/common/log/bnd_log.dart';
import 'package:core/repositories/comment/comment_news_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@injectable
class CommentNewsUsecase {
  final CommentNewsRepository _commentNewsRepository;
  final BNDLog _log;

  CommentNewsUsecase(this._commentNewsRepository, this._log);

  // Get List Comment
  Future<Either<String, CommentPublicResourceFilterResult>> getListCommentNews(CommentGetListByObjectIdRequest param) async {
    try {
      final CommentPublicResourceFilterResult data = await _commentNewsRepository.getListCommentNews(param);
      return Right(data);
      // final List<CommentNewsModel> items = (data.data);

      // final List<CommentNewsModel> itemReturns = <CommentNewsModel>[];
      // if (items != null)
      //   for (final CommentNewsModel item in items.where((CommentNewsModel element) => element.parentId.isEmpty)) {
      //     item.children = items.where((CommentNewsModel element) => element.parentId == item.id).toList();
      //     itemReturns.add(item);
      //   }
      // final PagingResponse<CommentNewsModel> itemReturn =
      //     PagingResponse<CommentNewsModel>(data: itemReturns, totalRows: data.totalRows);
      // return Right(itemReturn);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left(ex.toString());
    }
  }

  //Get List more child comment
  Future<Either<String, CommentPublicResourceFilterResult>> getListCommentChildNews(CommentGetListByObjectIdRequest param) async {
    try {
      final CommentPublicResourceFilterResult data = await _commentNewsRepository.getListCommentNews(param);
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left(ex.toString());
    }
  }

  // Create comment
  Future<Either<String, CommentPublicResource>> createCommentNews(CommentSaveResource param) async {
    try {
      final CommentPublicResource data = await _commentNewsRepository.createCommentNews(param);
      data.listReaction = [StringInt32KeyValueResource(key: '1', value: 0)];
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left<String, CommentPublicResource>(ex.toString());
    }
  }

  // Delete comment
  Future<Either<String, bool>> deleteCommentNews(String id) async {
    try {
      final bool data = await _commentNewsRepository.deleteCommentNews(id);
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left(ex.toString());
    }
  }

  // Update comment
  Future<Either<String, CommentPublicResource>> updateCommentNews(CommentSaveResource request) async {
    try {
      final CommentPublicResource data = await _commentNewsRepository.updateCommentNews(request);
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left(ex.toString());
    }
  }

  // Reaction comment
  Future<Either<String, bool>> reactionCommentNews(String objectId, int reactionId) async {
    try {
      final bool data = await _commentNewsRepository.reactionCommentNews(objectId, reactionId);
      return Right(data);
    } catch (ex) {
      _log.logError(ex.toString());
      return Left(ex.toString());
    }
  }
}
