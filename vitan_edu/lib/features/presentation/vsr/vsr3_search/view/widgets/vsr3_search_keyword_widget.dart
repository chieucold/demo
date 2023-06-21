import 'package:api/api/commondata_api.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/custom_listview.dart';
import 'package:core/components/html/text_html_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/bloc/vsr3_search_bloc.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/bloc/vsr3_search_state.dart';

class VSR3SearchKeywordWidget extends StatefulWidget {
  final VSR3SearchBloc searchBloc;
  final String keyword;
  final Function onTapItem;
  final BlockModel blockModel;

  VSR3SearchKeywordWidget({
    Key? key,
    required this.keyword,
    required this.onTapItem,
    required this.searchBloc,
    required this.blockModel,
  }) : super(key: key);

  @override
  State<VSR3SearchKeywordWidget> createState() => _VSR3SearchKeywordWidgetState();
}

class _VSR3SearchKeywordWidgetState extends State<VSR3SearchKeywordWidget> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _initScreen();
  }

  Future<void> _initScreen() async {
    await Future.delayed(Duration(milliseconds: 50));
    _visible = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VSR3SearchBloc, VSR3SearchState>(
      builder: (context, state) {
        if (state is VSR3SearchLoaded) {
          final int totalRows = state.data.totalRows;
          final List<SearchResource> items = state.data.data ?? <SearchResource>[];
          return Expanded(
            child: SafeArea(
              child: AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: CustomTheme.paddingBodyDefault,
                      margin: EdgeInsets.only(top: 16, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text(_getTitleSearch(context), style: textStyleBodyDefaultBold)),
                          Text('$totalRows ' + AppLocalizations.of(context)!.translate('result')),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                        // padding: CustomTheme.paddingBodyDefault.copyWith(top: 8),
                        height: totalRows * 40.sp,
                        child: Scrollbar(
                          isAlwaysShown: true,
                          radius: Radius.circular(4.5),
                          thickness: 4.5,
                          child: CustomListView<SearchResource>(
                            padding: CustomTheme.paddingBodyDefault.copyWith(top: 8),
                            widgetNoData: Text(AppLocalizations.of(context)!.translate('no_matching_results')),
                            itemBuilder: (_, int i) => InkWell(
                              onTap: () => widget.onTapItem(items[i].title),
                              child: Container(
                                height: 40.sp,
                                alignment: Alignment.centerLeft,
                                child: TextHtmlWidget(
                                  items[i].titleHighlight,
                                  textStyle: textStyleBodyDefault.copyWith(fontWeight: FontWeight.w400),
                                  maxline: 1,
                                ),
                              ),
                            ),
                            totalItem: totalRows,
                            items: items,
                            separatorBuilder: (_, __) => Divider(thickness: 0.2, height: 0),
                            onLoading: () => widget.searchBloc.getMoreData(),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => widget.onTapItem(widget.keyword),
                      child: Container(
                        padding: CustomTheme.paddingBodyDefault.copyWith(top: 12, bottom: 12),
                        color: CustomTheme.backgroundTextSearch,
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: RichText(
                                    text: TextSpan(
                                      style: textStyleBodyDefault.copyWith(
                                          fontWeight: FontWeight.w600, color: CustomTheme.supperAppThemeColor),
                                      children: <TextSpan>[
                                        TextSpan(text: AppLocalizations.of(context)!.translate('see_more_results_for')),
                                        TextSpan(text: " "),
                                        TextSpan(text: '"' + widget.keyword),
                                      ],
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text('"',
                                    style: textStyleBodyDefault.copyWith(
                                        fontWeight: FontWeight.w600, color: CustomTheme.supperAppThemeColor)),
                                SizedBox(width: 20)
                              ],
                            ),
                            Container(
                                padding: EdgeInsets.only(left: CustomTheme.paddingDefault),
                                child: Images.svgAssets(Images.icChevronRight, color: CustomTheme.supperAppThemeColor)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container(width: double.infinity, alignment: Alignment.topCenter, child: CupertinoActivityIndicator());
      },
    );
  }

  String _getTitleSearch(context) =>
      (AppLocalizations.of(context)!.translate('search_in') + ' Vitan' + widget.blockModel.title);
}
