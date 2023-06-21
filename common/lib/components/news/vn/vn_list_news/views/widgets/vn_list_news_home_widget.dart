import 'package:api/api/commondata_api.dart';
import 'package:common/common/color/common_color.dart';
import 'package:common/components/event/veo/event_item_widget.dart';
import 'package:common/components/news/common/news_format_date.dart';
import 'package:common/components/news/common/news_loading_widget.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_news_bloc.dart';
import 'package:common/components/news/vn/vn_list_news/bloc/vn_list_news_state.dart';
import 'package:common/route/route_goto.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/components/button/button_title_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/common/text_style.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VNListNewsHomeWidget extends StatelessWidget {
  VNListNewsHomeWidget({Key? key, this.titleStyle, this.topDivider = true}) : super(key: key);
  final TextStyle? titleStyle;
  final bool topDivider;
  final VNListNewsBloc _newsBloc = GetIt.I<VNListNewsBloc>();

  Widget _height(double height) => SizedBox(height: height);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VNListNewsBloc>(
      create: (context) => _newsBloc
        ..init(LocalStoreManager.getInt(BlockSettings.blockKey), isHot: true)
        ..getData(),
      child: Column(
        children: <Widget>[
          BlocBuilder<VNListNewsBloc, VNListNewsState>(
            builder: (context, state) {
              if ((state is VNListNewsLoaded && state.data.totalRows > 0) || state is VNListNewsLoading) {
                return Column(
                  children: [
                    if (topDivider) Divider(thickness: 6, color: CommonColor.driverColor),
                    ButtonTitleWidget(
                      title: AppLocalizations.of(context)!.translate('news'),
                      onPressed: () {
                        goToVNListNews(context);
                      },
                      style: titleStyle,
                    ),
                  ],
                );
              }
              return _height(0);
            },
          ),
          BlocBuilder<VNListNewsBloc, VNListNewsState>(
            builder: (BuildContext context, VNListNewsState state) {
              if (state is VNListNewsLoading) {
                // return const VNListNewsLoadingWidget();
                // return const SizedBox.shrink();
                return const VNListRelativeNewsLoadingWidget();
              } else if (state is VNListNewsLoaded) {
                final List<ContentListResource> list = state.data.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    list.isNotEmpty
                        ? VNListNewHome(
                            listData: list,
                          )
                        : _height(0),
                    // _buildLoading(217),
                  ],
                );
              } else if (state is VNListNewsError) {
                return BnDNoData();
              } else {
                return _height(0);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListEmpty(BuildContext context) {
    return Center(child: BnDNoData());
  }
}

class VNListNewHome extends StatelessWidget {
  final List<ContentListResource> listData;
  const VNListNewHome({Key? key, this.listData = const <ContentListResource>[]}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listData.length > 5 ? 5 : listData.length,
      shrinkWrap: true,
      primary: false,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int i) {
        final DateTime publishedDate = listData[i].publishedDate ?? DateTime.now();
        return EventItemWidget(
          id: listData[i].id,
          onTap: () {
            goToVNNewsDetail(context, listData[i].id);
          },
          imageUrl: listData[i].avatar,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                listData[i].title,
                style: textStyleBodyMediumBold.copyWith(color: CommonColor.textColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                margin: const EdgeInsets.only(top: 6),
                child: Text(
                  formatDatetimetoString(publishedDate, context) +
                      AppLocalizations.of(context)!.displayTime(publishedDate),
                  style: textStyleBodySmall.copyWith(color: CommonColor.vnDateNewsColor.withOpacity(0.5)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
