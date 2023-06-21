import 'package:api/api/commondata_api.dart';
import 'package:common/components/news/common/news_format_date.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/enums/comment_type_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_share.dart';
import 'package:core/components/html/text_html_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

class VNDetailNewsContentWidget extends StatelessWidget {
  const VNDetailNewsContentWidget({Key? key, required this.newsDetail}) : super(key: key);
  final ContentResource newsDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(context),
        _buildBody(),
        _buildShare(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    final DateTime publishedDate = newsDetail.publishedDate ?? DateTime.now();
    return Container(
      padding: CoreColor.paddingBodyDefault.copyWith(top: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: Text(
              newsDetail.title,
              style: textStyleHeadline5.copyWith(
                fontSize: 28,
                color: CoreColor.vnDetailTitleColor,
                height: 35 / 28,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(
                formatDatetimetoString(publishedDate, context) +
                    AppLocalizations.of(context)!.displayTime(publishedDate),
                style: textStyleBodySmall.copyWith(color: CoreColor.vnDateNewsColor.withOpacity(0.5))),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: CoreColor.paddingBodyDefault.copyWith(top: 0, bottom: 24),
      child: Column(
        children: <Widget>[
          TextHtmlWidget(
            newsDetail.content,
            textStyle: textStyleBodyDefault.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShare(BuildContext context) {
    return Container(
      padding: CoreColor.paddingBodyDefault,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              BND_Share(
                objectType: CommentTypeEnum.Content.index,
                objectId: newsDetail.id,
              ),
              const Spacer(),
              if (newsDetail.listAuthor!.isNotEmpty)
                Text(
                  newsDetail.listAuthor?[0].name ?? '',
                  style: textStyleBodySmallBold.copyWith(
                    fontWeight: FontWeight.w600,
                    color: CoreColor.cricleBackgroundColor,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Divider(
            height: 1,
            indent: 10,
            color: CoreColor.vnDividerColor.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
