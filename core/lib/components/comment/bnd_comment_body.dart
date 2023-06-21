import 'package:api/api/commondata_api.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/enums/reaction_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/comment/bloc/bnd_comment_bloc.dart';
import 'package:core/components/comment/bnd_comment_edit_bts.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/notification/views/widgets/notification_get_time_ago.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/user_info.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bnd_show_image_url.dart';
import 'bloc/bnd_comment_reply_bloc.dart';

// ignore: must_be_immutable
class BNDCommentBody extends StatelessWidget {
  final List<CommentPublicResource> comments;
  final int totalRows;
  BNDCommentBody({
    Key? key,
    required this.comments,
    required this.totalRows,
  }) : super(key: key);
  bool isLike = false;

  final UserInfo? currentUser = GetIt.I<AuthenticateApp>().getUserInfo();

  @override
  Widget build(BuildContext context) {
    // logger.d(comments);
    return ListView.builder(
      itemCount: comments.length,
      padding: CoreColor.paddingBodyDefault.copyWith(top: 20, bottom: 30),
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int i) {
        if (i == comments.length - 1) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _commentItem(context, comments[i], true),
              if (comments.length < totalRows)
                Container(
                  padding: const EdgeInsets.only(left: 56),
                  child: _buildSeeMore(context, () {
                    BlocProvider.of<BNDCommentBloc>(context).getMoreComment();
                  }),
                )
            ],
          );
        }
        return _commentItem(context, comments[i], true);
      },
    );
  }

  Widget _buildSeeMore(BuildContext context, void Function() onTap, {int? reply}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.translate("see_more_reply") +
                (reply != null || reply == 0 ? ' ($reply)' : ''),
            style: textStyleBodySmall.copyWith(fontSize: 14),
          ),
          const SizedBox(
            width: 8,
          ),
          Images.svgAssets(
            Images.icDownComment,
            color: CoreColor.textColor,
            height: 6,
          ),
          const Spacer()
        ],
      ),
    );
  }

  Widget _commentItem(BuildContext context, CommentPublicResource comment, bool isParent) {
    final List<CommentPublicResource> _listChild = comment.childsResource ?? <CommentPublicResource>[];

    return GestureDetector(
      onLongPress: () {
        print(comment.id);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BnDAvatar(
              name: comment.createdByUser?.fullName ?? 'A',
              size: isParent ? 25 : 18,
              imageUrl: comment.createdByUser?.avatar ?? '',
              // fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        comment.createdByUser?.fullName ?? AppLocalizations.of(context)!.translate("anonymous"),
                        style: textStyleBodyDefaultBold.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      if (_checkIsMyComment(comment.createdByUser)) _buildPopupMenu(context, comment)
                    ],
                  ),
                  if (comment.fileUrls != "")
                    Container(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      height: 130,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Hero(
                          tag: comment.fileUrls,
                          child: BNDImage(
                            // width: double.infinity,
                            imageUrl: comment.fileUrls,
                            fit: BoxFit.cover,
                            viewImage: true,
                          ),
                        ),
                      ),
                    ),
                  if (comment.content != "")
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ExpandableText(
                        comment.content,
                        expandText: AppLocalizations.of(context)!.translate("show_more"),
                        collapseText: AppLocalizations.of(context)!.translate("show_less"),
                        maxLines: 3,
                        style: textStyleBodySmall.copyWith(fontSize: 14),
                        expandOnTextTap: true,
                        collapseOnTextTap: true,
                        animationDuration: const Duration(milliseconds: 800),
                        animation: true,
                      ),
                    ),
                  ReactCommentItem(
                      comment: comment, isLike: comment.reactionIdByMe == ReactionEnum.like.index ? true : false),
                  if (_listChild.isNotEmpty) _buildListChild(_listChild, comment.commentCount, comment.id)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListChild(List<CommentPublicResource> list, int totalReply, String parentID) {
    return ListView.builder(
      itemCount: list.length,
      padding: const EdgeInsets.only(top: 16),
      primary: false,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int i) {
        if (i == list.length - 1) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _commentItem(context, list[i], false),
              if (totalReply > list.length)
                Container(
                  padding: const EdgeInsets.only(left: 42),
                  child: _buildSeeMore(context, () {
                    BlocProvider.of<BNDCommentBloc>(context).getMoreComment(parentID: parentID);
                  }, reply: totalReply - list.length),
                )
            ],
          );
        }
        return _commentItem(context, list[i], false);
      },
    );
  }

  Widget _buildPopupMenu(BuildContext context, CommentPublicResource comment) {
    return PopupMenuButton<Function>(
      offset: const Offset(-22, 0),
      child: Container(
        height: 22,
        width: 22,
        alignment: Alignment.center,
        child: Images.svgAssets(
          Images.icMore,
          color: CoreColor.vnDateNewsColor.withOpacity(0.5),
        ),
      ),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Function>>[
        PopupMenuItem<Function>(
          value: _onEdit,
          height: 32,
          child: Row(
            children: <Widget>[
              Images.svgAssets(
                Images.icEditComment,
                color: CoreColor.textColor,
                height: 12,
              ),
              const SizedBox(width: 12),
              Text(
                AppLocalizations.of(context)!.translate("edit"),
                style: textStyleBodyDefault.copyWith(color: CoreColor.editCommentColor, fontSize: 16),
              ),
            ],
          ),
        ),
        PopupMenuItem<Function>(
          value: _onDelete,
          height: 32,
          child: Row(
            children: <Widget>[
              Images.svgAssets(
                Images.icDeleteComment,
                color: CoreColor.deleteCommentColor,
              ),
              const SizedBox(width: 12),
              Text(
                AppLocalizations.of(context)!.translate("delete"),
                style: textStyleBodyDefault.copyWith(color: CoreColor.deleteCommentColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
      onSelected: (Function item) {
        item(context, comment);
      },
    );
  }

  void _onDelete(BuildContext context, CommentPublicResource comment) {
    final String text = AppLocalizations.of(context)!.translate("are_you_sure_you_want_to_delete_the_comment");
    final String textOk = AppLocalizations.of(context)!.translate("accept");
    showAlertDialog(context, content: text, okText: textOk, onOk: () async {
      await BlocProvider.of<BNDCommentBloc>(context).deleteCommentNews(id: comment.id, parentId: comment.parentId);
    });
  }

  Future<void> _onEdit(BuildContext context, CommentPublicResource comment) async {
    final String? response = await showModalBottomSheet<String>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) => BNDCommentEditBTS(text: comment.content),
    );
    if (response != null || response != "") {
      await BlocProvider.of<BNDCommentBloc>(context).updateCommentNews(request: comment, text: response!);
    }
    return;
  }

  bool _checkIsMyComment(SimpleUserEntity? createdByUser) {
    if (createdByUser == null) return false;
    if (currentUser!.id.toInt() == createdByUser.id) return true;
    return false;
  }
}

// ignore: must_be_immutable
class ReactCommentItem extends StatefulWidget {
  ReactCommentItem({Key? key, required this.comment, required this.isLike}) : super(key: key);
  CommentPublicResource comment;
  final bool isLike;

  @override
  ReactCommentItemState createState() => ReactCommentItemState();
}

class ReactCommentItemState extends State<ReactCommentItem> {
  late CommentPublicResource _comment;
  late bool _isLike;
  late int _react;
  @override
  void initState() {
    super.initState();
    _comment = widget.comment;
    _isLike = widget.isLike;
    _react = _comment.countTotalReaction;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          NotificationGetTimeAgo(_comment.createdDate!, context),
          style: textStyleBodySmall.copyWith(color: CoreColor.vnDateNewsColor.withOpacity(0.5), fontSize: 14),
        ),
        _getLikeReact(context),
        GestureDetector(
            onTap: () {
              _onComment();
            },
            child: _getReplyReact())
      ],
    );
  }

  void _onComment() {
    BlocProvider.of<BNDCommentReplyBloc>(context)
        .getNameTag(_comment.createdByUser?.fullName ?? "", _comment.parentId == "" ? _comment.id : _comment.parentId);
  }

  Widget _getLikeReact(BuildContext context) {
    if (_react == 0) {
      return GestureDetector(
        onTap: _onLike,
        child: Text(
          AppLocalizations.of(context)!.translate("like"),
          style: textStyleBodySmall.copyWith(color: CoreColor.vnDateNewsColor.withOpacity(0.5), fontSize: 14),
        ),
      );
    }
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: _onLike,
          child: Text(
            AppLocalizations.of(context)!.translate(_isLike ? "liked" : "like"),
            style: textStyleBodySmall.copyWith(
              color: _isLike ? CoreColor.textColor : CoreColor.vnDateNewsColor.withOpacity(0.5),
              fontWeight: _isLike ? FontWeight.w700 : FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(width: 5),
        Images.svgAssets(
          Images.heart_pink,
          width: 13,
          color: CoreColor.vnLikeReactColor,
        ),
        const SizedBox(width: 2),
        Text(
          " $_react",
          style: textStyleBodySmall.copyWith(
              color: _isLike ? CoreColor.textColor : CoreColor.vnDateNewsColor.withOpacity(0.5), fontSize: 14),
        ),
      ],
    );
  }

  // Reply
  Widget _getReplyReact() {
    if (_comment.commentCount == 0) {
      return Text(
        AppLocalizations.of(context)!.translate("reply"),
        style: textStyleBodySmall.copyWith(color: CoreColor.vnDateNewsColor.withOpacity(0.5), fontSize: 14),
      );
    }
    return Row(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.translate("reply"),
          style: textStyleBodySmall.copyWith(color: CoreColor.vnDateNewsColor.withOpacity(0.5), fontSize: 14),
        ),
        const SizedBox(width: 5),
        Images.svgAssets(
          Images.icReplyComment,
          width: 13,
          color: CoreColor.vnDateNewsColor.withOpacity(0.5),
        ),
        const SizedBox(width: 2),
        Text(
          " ${_comment.commentCount}",
          style: textStyleBodySmall.copyWith(color: CoreColor.vnDateNewsColor.withOpacity(0.5), fontSize: 14),
        ),
      ],
    );
  }

  void _onLike() {
    _isLike = !_isLike;
    if (_isLike) {
      _react++;
    } else {
      _react--;
    }
    setState(() {});

    BlocProvider.of<BNDCommentBloc>(context).reactionComment(_comment.id, ReactionEnum.like.index);
  }
}
