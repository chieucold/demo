import 'package:api/api/commondata_api.dart';
import 'package:common/common/color/common_color.dart';
import 'package:common/components/news/common/news_format_date.dart';
import 'package:common/components/news/common/news_item_list_widget.dart';
import 'package:common/components/news/common/news_loading_widget.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_overview_news_bloc.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_overview_news_state.dart';
import 'package:common/components/news/vn/vn_list_news/views/widgets/vn_list_hot_news.dart';
import 'package:common/route/route_goto.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_image.dart';
import 'package:core/components/bnd_no_data.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/button/button_title_widget.dart';
import 'package:core/components/custom_listview.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VNListNewsWidget extends StatefulWidget {
  const VNListNewsWidget({Key? key}) : super(key: key);

  @override
  State<VNListNewsWidget> createState() => _VNListNewsWidgetState();
}

class _VNListNewsWidgetState extends State<VNListNewsWidget> with AutomaticKeepAliveClientMixin {
  final VNListOverviewNewsBloc _bloc = GetIt.I<VNListOverviewNewsBloc>();
  final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<VNListOverviewNewsBloc>(
      create: (BuildContext context) => _bloc
        ..init(_blockId)
        ..getData(),
      child: BlocBuilder<VNListOverviewNewsBloc, VNListOverviewNewsState>(
        builder: (BuildContext context, VNListOverviewNewsState state) {
          if (state is VNListOverviewNewsLoading) {
            return const VNListNewsLoadingWidget();
          } else if (state is VNListOverviewNewsLoaded) {
            final ContentListPublicResource data = state.data;
            final List<ContentListResource> listContentHot = data.listContentHot ?? <ContentListResource>[];
            final List<ContentListResource>? listContentOther = <ContentListResource>[];
            if (data.listContentOther!.data!.isEmpty) {
              return Column(
                children: <Widget>[
                  _buildListHotNews(listContentHot, context),
                  _buildHeaderOtherNews(context),
                  Expanded(child: BnDNoData())
                ],
              );
            }
            listContentOther!
              ..addAll(data.listContentOther!.data!)
              ..insert(1, listContentOther[0]);
            final int totalRowsContentOther = data.listContentOther!.totalRows + 1;
            return _buildListNews(listContentOther, totalRowsContentOther, listContentHot, context);
          } else if (state is VNListOverviewNewsError) {
            return Text(AppLocalizations.of(context)!.translate("an_error_occurred"));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildListNews(
    List<ContentListResource> itemsOtherNews,
    int totalRowsOtherNews,
    List<ContentListResource> listContentHot,
    BuildContext context,
  ) {
    return CustomListView<ContentListResource>(
      primary: false,
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        // Hot news
        if (index == 0) {
          return Column(
            children: <Widget>[_buildListHotNews(listContentHot, context), _buildHeaderOtherNews(context)],
          );
        }

        // Other news
        final ContentListResource item = itemsOtherNews[index];
        // final UserModel? userInfo = item.user;
        return BndTouch(
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
        );
      },
      separatorBuilder: (_, int index) {
        if (index < 2) {
          return const SizedBox.shrink();
        }
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
      totalItem: totalRowsOtherNews,
      items: itemsOtherNews,
      onRefresh: () {
        _bloc.getData();
      },
      onLoading: () => _bloc.getMoreData(),
    );
  }

  Widget _buildListHotNews(List<ContentListResource> listHotNews, BuildContext context) {
    return VNListHotNewsWidget(
      list: listHotNews,
      onTap: (int id) {
        goToVNNewsDetail(context, id);
      },
    );
  }

  Widget _buildHeaderOtherNews(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: ButtonTitleWidget(
        title: AppLocalizations.of(context)!.translate('other_news'),
        style: textStyleBodyLargeBold.copyWith(color: CommonColor.textColor),
        onPressed: () {
          goToVNListOtherNews(context);
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
