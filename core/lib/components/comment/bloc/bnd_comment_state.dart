import 'package:api/api/commondata_api.dart';
import 'package:api/common/model/comment/comment_index.dart';
import 'package:core/common/common.dart';

abstract class BNDCommentState {
  final CommentPublicResourceFilterResult data;
  BNDCommentState(this.data);
}

CommentPublicResourceFilterResult get _defaultViewModel =>
    CommentPublicResourceFilterResult(data: <CommentPublicResource>[], totalRows: 0);

class BNDCommentInitial extends BNDCommentState {
  BNDCommentInitial() : super(_defaultViewModel);
}

class BNDCommentLoading extends BNDCommentState {
  BNDCommentLoading() : super(_defaultViewModel);
}

class BNDCommentLoaded extends BNDCommentState {
  BNDCommentLoaded({
    required CommentPublicResourceFilterResult data,
  }) : super(data);
}

class BNDCommentError extends BNDCommentState {
  final String error;
  BNDCommentError({required this.error}) : super(_defaultViewModel);
}
