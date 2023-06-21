// ignore_for_file: must_be_immutable

import 'package:common/components/news/vn/vn_detail_news/bloc/vn_detail_news_bloc.dart';
import 'package:common/components/news/vn/vn_detail_news/bloc/vn_detail_news_state.dart';
import 'package:common/components/news/vn/vn_detail_news/widgets/vn_detail_news_content_widget.dart';
import 'package:common/components/news/widgets/detail_news_loading_widget.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VNDetailNewsBodyWidget extends StatelessWidget {
  VNDetailNewsBodyWidget({Key? key, required this.id, this.path}) : super(key: key);
  final int id;
  final String? path;
  VNDetailNewsBloc bloc = GetIt.I<VNDetailNewsBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VNDetailNewsBloc>(
      create: (BuildContext context) => bloc..getData(id, path),
      child: BlocBuilder<VNDetailNewsBloc, VNDetailNewsState>(
        builder: (BuildContext context, VNDetailNewsState state) {
          if (state is VNDetailNewsLoading) {
            return const NewsDetailLoading();
          } else if (state is VNDetailNewsLoaded) {
            return VNDetailNewsContentWidget(newsDetail: state.newsDetail);
          } else if (state is VNDetailNewsError) {
            return Container(
                padding: CoreColor.paddingBodyDefault.copyWith(top: 12),
                child: Text(AppLocalizations.of(context)!.translate("an_error_occurred")));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
