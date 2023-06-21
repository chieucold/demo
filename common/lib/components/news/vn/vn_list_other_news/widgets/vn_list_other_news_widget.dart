import 'package:common/common/color/common_color.dart';
import 'package:common/components/news/common/news_format_date.dart';
import 'package:common/components/news/common/news_item_list_widget.dart';
import 'package:common/components/news/common/news_loading_widget.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_news_bloc.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_news_state.dart';
import 'package:common/components/search/search_widget.dart';
import 'package:common/route/route_goto.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_nested_scroll_view.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/button/button_title_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/custom_listview.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api/api/commondata_api.dart';
import 'package:get_it/get_it.dart';

class VNListOtherNewsWidget extends StatelessWidget {
  final int blockId;
  VNListOtherNewsWidget({Key? key, required this.blockId}) : super(key: key);

  final VNListNewsBloc _blocNews = GetIt.I<VNListNewsBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VNListNewsBloc>(
      create: (context) => _blocNews
        ..init(blockId)
        ..getData(),
      child: BNDNestedScrollView(
          toolbarHeight: 48,
          appbar: Container(
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: CommonColor.vge8DividerColor))),
            padding: CommonColor.paddingBodyDefault,
            child: SearchWidget(
              hintText: AppLocalizations.of(context)!.translate("search"),
              onSubmit: (String text) {
                _blocNews.getDataBySearch(text);
              },
            ),
          ),
          body: BlocBuilder<VNListNewsBloc, VNListNewsState>(
            builder: (context, state) {
              if (state is VNListNewsLoading) {
                return const VNListNewsLoadingWidget();
              } else if (state is VNListNewsLoaded) {
                final ContentListResourceFilterResult data = state.data;
                return _buildList(data.data ?? [], data.totalRows, context);
              } else if (state is VNListNewsError) {
                return Text(AppLocalizations.of(context)!.translate("an_error_occurred"));
              }
              return const SizedBox.shrink();
              // return _buildList(list, totalRows, context);
            },
          )),
    );
  }

  Widget _buildList(List<ContentListResource> items, int totalRows, BuildContext context) {
    return CustomListView<ContentListResource>(
      separatorBuilder: (_, __) {
        return Container(
          padding: CommonColor.paddingBodyDefault,
          child: Divider(
            thickness: 1,
            height: 0,
            indent: 10,
            color: CommonColor.vnDividerColor.withOpacity(0.5),
          ),
        );
      },
      itemBuilder: (_, int index) {
        final ContentListResource item = items[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (index == 0) _buildTitle(context),
            BndTouch(
              onPressed: () => goToVNNewsDetail(context, item.id),
              child: Container(
                color: CommonColor.transparent,
                child: NewsItemListWidget(
                  image: Container(
                    margin: const EdgeInsets.only(top: 16, right: 12, bottom: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: BNDImage(
                        height: 70,
                        width: 88,
                        fit: BoxFit.cover,
                        imageUrl: item.avatar,
                      ),
                    ),
                  ),
                  title: item.title,
                  titleStyle: textStyleBodyDefaultBold.copyWith(color: CommonColor.textColor),
                  date: formatDatetimetoString(item.publishedDate ?? DateTime.now(), context) +
                      AppLocalizations.of(context)!.displayTime(item.publishedDate ?? DateTime.now()),
                ),
              ),
            ),
          ],
        );
      },
      totalItem: totalRows,
      items: items,
      onRefresh: () {
        BlocProvider.of<VNListNewsBloc>(context).getData();
      },
      onLoading: () => BlocProvider.of<VNListNewsBloc>(context).getMoreData(),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: ButtonTitleWidget(
        title: AppLocalizations.of(context)!.translate("news"),
        style: textStyleBodyLargeBold.copyWith(color: CommonColor.textColor),
        isShowAction: false,
      ),
    );
  }
}
