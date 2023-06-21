import 'package:api/api/commondata_api.dart';
import 'package:common/common/color/common_color.dart';
import 'package:common/components/news/common/news_item_list_widget.dart';
import 'package:common/components/news/vn/vn_relative_news/bloc/vn_list_relative_news_bloc.dart';
import 'package:common/components/news/vn/vn_relative_news/bloc/vn_list_relative_news_state.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VNListRelativeNewsWidget extends StatelessWidget {
  final Function onTap;
  final int id;
  final VNListRelativeNewsBloc _bloc = GetIt.I<VNListRelativeNewsBloc>();

  VNListRelativeNewsWidget({Key? key, required this.id, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: CoreColor.paddingBodyDefault.copyWith(top: 24),
          child: Text(
            AppLocalizations.of(context)!.translate("related_post"),
            style: textStyleBodyLargeBold.copyWith(color: CoreColor.textColor),
          ),
        ),
        BlocProvider<VNListRelativeNewsBloc>(
          create: (BuildContext context) => _bloc..getData(request: ContentRelationFilterResource(contentId: id)),
          child: BlocBuilder<VNListRelativeNewsBloc, VNListRelativeNewsState>(
            builder: (BuildContext context, VNListRelativeNewsState state) {
              if (state is VNListRelativeNewsLoading) {
                return const SizedBox();
              }
              if (state is VNListRelativeNewsLoaded) {
                final List<ContentResource>? list = state.data.data;
                if (list == null || list.isEmpty) {
                  return Container(
                    padding: CoreColor.paddingBodyDefault.copyWith(top: 8),
                    child: Text(
                      AppLocalizations.of(context)!.translate("no_data_relative_news"),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: list.length > 3 ? 3 : list.length,
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int i) {
                    return BndTouch(
                      onPressed: () => onTap(list[i].id),
                      child: NewsItemListWidget(
                        image: Container(
                          margin: const EdgeInsets.only(top: 16, right: 12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: BNDImage(height: 91, width: 91, fit: BoxFit.cover, imageUrl: list[i].avatar),
                          ),
                        ),
                        title: list[i].title,
                        titleStyle: textStyleBodyMediumBold.copyWith(color: CommonColor.textColor),
                        date: AppLocalizations.of(context)!.displayDateTime(list[i].createdDate, isFullTime: false),
                      ),
                    );
                  },
                );
              } else if (state is VNListRelativeNewsError) {
                return Text(AppLocalizations.of(context)!.translate("an_error_occurred"));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
