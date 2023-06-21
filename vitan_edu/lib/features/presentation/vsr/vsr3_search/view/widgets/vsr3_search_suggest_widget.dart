import 'package:common/components/search/vsr3_search/bloc/vsr3_search_statistics_bloc.dart';
import 'package:common/components/search/vsr3_search/bloc/vsr3_search_statistics_state.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_pull_to_refresh.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vitan_edu/core/theme/custom.dart';

class VSR3SearchSuggestWidget extends StatefulWidget {
  VSR3SearchSuggestWidget({Key? key, required this.onTapItem, required this.onRefresh}) : super(key: key);
  final Function onTapItem;
  final Function onRefresh;

  @override
  State<VSR3SearchSuggestWidget> createState() => _VSR3SearchSuggestWidgetState();
}

class _VSR3SearchSuggestWidgetState extends State<VSR3SearchSuggestWidget> {
  bool _visible = false;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    widget.onRefresh();
    _initScreen();
  }

  Future<void> _initScreen() async {
    await Future.delayed(Duration(milliseconds: 50));
    _visible = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VSR3SearchStatisticsBloc, VSR3SearchStatisticsState>(
      builder: (context, state) {
        if (state is VSR3SearchStatisticsLoaded) {
          return Expanded(
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: BNDPullToRefresh(
                controller: _refreshController,
                onRefresh: () {
                  widget.onRefresh();
                  Future<void>.delayed(const Duration(milliseconds: 500), () {
                    _refreshController.loadComplete();
                    _refreshController.refreshCompleted();
                  });
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: CustomTheme.paddingBodyDefault.copyWith(top: 16),
                          child: Text(AppLocalizations.of(context)!.translate('recent_search'),
                              style: textStyleBodyDefaultBold)),
                      ListView.builder(
                        padding: CustomTheme.paddingBodyDefault.copyWith(top: 16, bottom: 16),
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (_, int i) {
                          final item = state.searchRecent[i];
                          return InkWell(
                            onTap: () => widget.onTapItem(item.keyWord),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                item.keyWord,
                                style: textStyleBodyDefault.copyWith(color: CustomTheme.textSearchColor),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          );
                        },
                        itemCount: state.searchRecent.length,
                      ),
                      Divider(height: 0, thickness: 1),
                      Container(
                          padding: CustomTheme.paddingBodyDefault.copyWith(top: 16),
                          child: Text(AppLocalizations.of(context)!.translate('top_search'),
                              style: textStyleBodyDefaultBold)),
                      ListView(
                        padding: CustomTheme.paddingBodyDefault.copyWith(top: 8, bottom: 0),
                        primary: false,
                        shrinkWrap: true,
                        children: <Widget>[
                          Wrap(
                            spacing: 4.0,
                            runSpacing: 0.0,
                            children: List<Widget>.generate(state.searchTop.length, (int i) {
                              final item = state.searchTop[i];
                              return InkWell(
                                  onTap: () => widget.onTapItem(item.keyWord),
                                  child: Chip(label: Text('#${item.keyWord}')));
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
