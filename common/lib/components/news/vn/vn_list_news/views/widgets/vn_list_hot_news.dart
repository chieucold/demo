import 'package:api/api/commondata_api.dart';
import 'package:common/common/color/common_color.dart';
import 'package:common/components/news/common/news_format_date.dart';
import 'package:common/components/news/vn/vn_list_news/views/widgets/vn_list_hot_news_item.dart';
import 'package:core/components/advertisement_slider_widget/carouse_slider_widget.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/button/button_title_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/dimension.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VNListHotNewsWidget extends StatelessWidget {
  final List<ContentListResource> list;
  final ValueChanged<int> onTap;
  const VNListHotNewsWidget({Key? key, required this.list, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 24, bottom: 12),
          child: ButtonTitleWidget(
            title: AppLocalizations.of(context)!.translate("hot_news"),
            style: textStyleBodyLargeBold.copyWith(color: CommonColor.textColor),
            isShowAction: false,
          ),
        ),
        list.isNotEmpty ? _buildList(context, height(context, 217)) : _buildListEmpty(context)
      ],
    );
  }

  Widget _buildList(BuildContext context, double height) {
    final List<Widget> _slideItem = <Widget>[];
    for (final ContentListResource element in list) {
      final DateTime publishedDate = element.publishedDate ?? DateTime.now();
      _slideItem.add(
        BndTouch(
          onPressed: () => onTap(element.id),
          child: VNListHotNewsItem(
            height: height,
            image: element.avatar,
            title: element.title,
            time: formatDatetimetoString(publishedDate, context) +
                AppLocalizations.of(context)!.displayTime(publishedDate),
          ),
        ),
      );
    }
    return CarouselSliderWidget(
      height: height,
      aspectRatio: 0.5,
      viewportFraction: 0.8,
      listChildCarousel: _slideItem,
      slideControllerSize: 0,
      slideControllerMargin: 24,
      slideControllerSpace: 24,
    );
  }

  Widget _buildListEmpty(BuildContext context) {
    return Container(
      margin: CommonColor.paddingBodyDefault,
      child: Text(
        AppLocalizations.of(context)!.translate("no_data"),
      ),
    );
  }
}
