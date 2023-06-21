import 'package:api/api/commondata_api.dart';

class CommentNewsRepository {
  final CommondataApi _commonDataResAPI;
  CommentNewsRepository(this._commonDataResAPI);

  // Get List Comment
  Future<CommentPublicResourceFilterResult> getListCommentNews(CommentGetListByObjectIdRequest param) async {
    final CommentPublicResourceFilterResult data = await _commonDataResAPI.commentGetListByObjectId(param);
    return data;
  }

  // Create comment
  Future<CommentPublicResource> createCommentNews(CommentSaveResource param) async {
    final CommentPublicResource data = await _commonDataResAPI.commentCreate(param);
    data.listReaction = [StringInt32KeyValueResource(key: '1', value: 0)];
    return data;
  }

  // Delete comment
  Future<bool> deleteCommentNews(String id) async {
    final bool data = await _commonDataResAPI.commentRemove(id);
    return data;
  }

  // Update comment
  Future<CommentPublicResource> updateCommentNews(CommentSaveResource request) async {
    final CommentPublicResource data = await _commonDataResAPI.commentUpdate(request);
    return data;
  }

  // Reaction comment
  Future<bool> reactionCommentNews(String objectId, int reactionId) async {
    final bool data = await _commonDataResAPI.commentReactionComment(objectId, reactionId);
    return data;
  }
}
