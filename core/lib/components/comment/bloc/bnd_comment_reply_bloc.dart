import 'package:bloc/bloc.dart';

import 'bnd_comment_reply_state.dart';

class BNDCommentReplyBloc extends Cubit<BNDCommentReplyState> {
  BNDCommentReplyBloc() : super(BNDCommentReplyInitial());

  void initial() {
    return emit(BNDCommentReplyInitial());
  }

  Future<void> getNameTag(String nametag, String? parentId) async {
    print(nametag);
    if (nametag == "") {
      return emit(BNDCommentReplyLoaded(nameTag: "", parentId: parentId));
    }
    return emit(BNDCommentReplyLoaded(nameTag: "@$nametag ", parentId: parentId));
  }
}
