abstract class BNDCommentReplyState {}

class BNDCommentReplyInitial extends BNDCommentReplyState {}

class BNDCommentReplyLoaded extends BNDCommentReplyState {
  final String nameTag;
  final String? parentId;
  BNDCommentReplyLoaded({required this.nameTag, this.parentId});
}
