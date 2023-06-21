import 'package:common/components/news/vn/vn_detail_news/widgets/vn_detail_news_body_widget.dart';
import 'package:common/components/news/vn/vn_relative_news/widgets/vn_list_relative_news_widget.dart';
import 'package:common/route/route_goto.dart';
import 'package:core/common/enums/comment_type_enum.dart';
import 'package:core/components/comment/bnd_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VNDetailNewsWidget extends StatelessWidget {
  final int id;
  VNDetailNewsWidget({Key? key, required this.id}) : super(key: key);

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          VNDetailNewsBodyWidget(id: id),
          VNListRelativeNewsWidget(id: id, onTap: (int id) => goToVNNewsDetail(context, id)),
          BNDComment(id: id, type: CommentTypeEnum.Content, controller: _controller),
        ],
      ),
    );
  }
}
