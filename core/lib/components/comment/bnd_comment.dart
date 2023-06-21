import 'package:api/api/commondata_api_models.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/enums/comment_type_enum.dart';
import 'package:core/components/comment/bloc/bnd_comment_bloc.dart';
import 'package:core/components/comment/bnd_comment_body.dart';
import 'package:core/components/comment/bnd_input_comment.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/bnd_comment_reply_bloc.dart';
import 'bloc/bnd_comment_state.dart';

class BNDComment extends StatelessWidget {
  final int id;
  final CommentTypeEnum type;
  final bool isShowTitle;
  final ScrollController controller;

  BNDComment({
    Key? key,
    required this.id,
    required this.type,
    this.isShowTitle = true,
    required this.controller,
  }) : super(key: key);
  final BNDCommentBloc bloc = GetIt.I<BNDCommentBloc>();
  final BNDCommentReplyBloc replyCommentBloc = GetIt.I<BNDCommentReplyBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ignore: always_specify_types
      providers: [
        BlocProvider<BNDCommentBloc>(
          create: (BuildContext context) => bloc
            ..init(id, type.getValueToString())
            ..getComment(id),
        ),
        BlocProvider<BNDCommentReplyBloc>(
          create: (BuildContext context) => replyCommentBloc..initial(),
        ),
      ],
      child: BlocBuilder<BNDCommentBloc, BNDCommentState>(
        builder: (BuildContext context, BNDCommentState state) {
          if (state is BNDCommentLoading) {
            return const SizedBox.shrink();
          } else if (state is BNDCommentLoaded) {
            final CommentPublicResourceFilterResult data = state.data;
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) => Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (isShowTitle)
                      Container(
                        margin:
                            CoreColor.paddingBodyDefault.copyWith(top: orientation == Orientation.landscape ? 6 : 40),
                        child: Text(
                          AppLocalizations.of(context)!.translate("comment"),
                          style: textStyleHeadline6.copyWith(color: CoreColor.textColor),
                        ),
                      ),
                    _buildBodyComment(data.data!, data.totalRows, context),
                    BNDInputComment(controller: controller),
                    // const BNDWriteComment(),
                  ],
                ),
              ),
            );
          } else if (state is BNDCommentError) {
            return Container(
                padding: const EdgeInsets.all(30),
                child: Text(AppLocalizations.of(context)!.translate("an_error_occurred")));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildBodyComment(List<CommentPublicResource> comments, int totalRows, BuildContext context) {
    if (comments.isEmpty) {
      return Container(
        padding: CoreColor.paddingBodyDefault.copyWith(top: 8, bottom: 8),
        child: Text(
          AppLocalizations.of(context)!.translate("no_comment"),
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: BNDCommentBody(
        comments: comments,
        totalRows: totalRows,
      ),
    );
  }
}
