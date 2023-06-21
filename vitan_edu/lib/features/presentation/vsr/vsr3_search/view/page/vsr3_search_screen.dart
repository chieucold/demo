import 'dart:async';

import 'package:common/components/search/vsr3_search/bloc/vsr3_search_statistics_bloc.dart';
import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/bloc/vsr3_search_bloc.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/view/widgets/vsr3_search_block_widget.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/view/widgets/vsr3_search_keyword_widget.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/view/widgets/vsr3_search_suggest_widget.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

class VSR3SearchScreen extends StatefulWidget {
  final BlockModel blockModel;

  const VSR3SearchScreen({Key? key, required this.blockModel}) : super(key: key);

  @override
  State<VSR3SearchScreen> createState() => _VSR3SearchScreenState();
}

class _VSR3SearchScreenState extends State<VSR3SearchScreen> {
  double get _heightBarSize => 50.sp;
  final TextEditingController _textCtrler = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late BlockModel _blockModel;
  Timer? _debounce;

  bool get _textNotEmpty => _textCtrler.text.trim().isNotEmpty;

  final VSR3SearchBloc _searchBloc = getItSuper();
  final VSR3SearchStatisticsBloc _statisticsBloc = getItSuper();
  bool _isSearchResult = false;

  @override
  void initState() {
    super.initState();
    _blockModel = widget.blockModel;
    _listenerFocusNode();
    _listenerBlock();
  }

  void _listenerBlock() {
    _searchBloc.blockStreamController.stream.listen((blockModel) {
      logger.d(blockModel.id);
      _blockModel = blockModel;
      _searchBloc.getData(_textCtrler.text.trim(), blockModel.id);
      setState(() {});
    });
  }

  void _listenerFocusNode() {
    _focusNode.addListener(() {
      _textCtrler.selection = TextSelection.fromPosition(TextPosition(offset: _textCtrler.text.trimLength));
      if (_focusNode.hasFocus) _isSearchResult = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchBloc.blockStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSupperApp(height: 0),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<VSR3SearchBloc>(create: (context) => _searchBloc..init()),
          BlocProvider<VSR3SearchStatisticsBloc>(
              create: (context) => _statisticsBloc
                ..init()
                ..getData()),
          // BlocProvider<VSR3BlockBloc>(create: (context) => _blockBloc..init(widget.blockModel)),
        ],
        child: Container(
            padding: EdgeInsets.only(top: 8.sp),
            child: Column(children: [
              _buildSearchBar,
              _buildBody,
            ])),
      ),
    );
  }

  // Widget get _buildPopupBlock => Container(
  //       padding: EdgeInsets.only(top: 8),
  //       height: 345.sp,
  //       child: SearchPopupWidget(
  //         listBlockModel: listBlockWithVitan,
  //         currentBlock: _blockModel,
  //         onChoose: (BlockModel c) {
  //           _blockBloc.changeBlockModel(c);
  //           Navigator.pop(context);
  //         },
  //       ),
  //     );

  Widget get _buildSearchBar => Container(
        padding: CustomTheme.paddingBodyDefault.copyWith(left: 0),
        child: Row(
          children: [
            CommonLeadingWidget(iconColor: CustomTheme.black),
            Expanded(
              child: Container(
                height: _heightBarSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: CustomTheme.fillSearchColor,
                ),
                child: BNDTextField(
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.search,
                  controller: _textCtrler,
                  onFieldSubmitted: (term) {
                    _onTapItem(_textCtrler.text.trim());
                  },
                  autofocus: true,
                  onChanged: (_) {
                    if (_textCtrler.text.trim().isNotEmpty) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce = Timer(const Duration(milliseconds: 500),
                          () => _searchBloc.getData(_textCtrler.text.trim(), _blockModel.id));
                    }
                    setState(() {});
                  },
                  maxLines: 1,
                  style: textStyleBodySmall.copyWith(fontSize: 14.sp),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16.sp),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                      filled: true,
                      hintStyle: textStyleBodySmall.copyWith(color: CustomTheme.textColor6, fontSize: 14.sp),
                      hintText: AppLocalizations.of(context)!.translate('search_keyword'),
                      fillColor: CustomTheme.transparent,
                      suffixIcon: _textNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.close, size: 16),
                              onPressed: _clearText,
                            )
                          : SizedBox.shrink()),
                ),
              ),
            ),
            if (_searchAllAppEnum == SearchAllAppEnum.showTopKeyword)
              VSR3SearchBlockWidget(
                key: Key(_blockModel.id.toString()),
                blockModel: _blockModel,
                onChangeItem: (c) {
                  _blockModel = c;
                },
              )
          ],
        ),
      );

  void _clearText() => setState(() => _textCtrler.clear());

  SearchAllAppEnum get _searchAllAppEnum {
    if (_textCtrler.text.trim().isEmpty) {
      return SearchAllAppEnum.showTopKeyword;
    } else {
      if (_isSearchResult && !_focusNode.hasFocus) {
        return SearchAllAppEnum.showSearchResult;
      } else
        return SearchAllAppEnum.showSearchKeyword;
    }
  }

  Widget get _buildBody {
    if (_searchAllAppEnum == SearchAllAppEnum.showTopKeyword) {
      return VSR3SearchSuggestWidget(
          onTapItem: (String keyword) {
            _searchBloc.getData(keyword, _blockModel.id);
            _onTapItem(keyword);
          },
          onRefresh: () => _statisticsBloc.getData());
    } else
      return VSR3SearchKeywordWidget(
        keyword: _textCtrler.text.trim(),
        searchBloc: _searchBloc,
        onTapItem: _onTapItem,
        blockModel: _blockModel,
      );
    // else if (_searchAllAppEnum == SearchAllAppEnum.showSearchResult) {
    //   return VSR4SearchResultScreen(
    //     keyword: _textCtrler.text,
    //     blockModel: _blockBloc.state.blockModel,
    //     vsr3searchBloc: _searchBloc,
    //   );
    // }
  }

  Future<void> _onTapItem(String keyword) async {
    _textCtrler.text = keyword;
    _isSearchResult = true;
    _textCtrler.selection = TextSelection.fromPosition(TextPosition(offset: _textCtrler.text.trimLength));
    // FocusScope.of(context).unfocus();
    final BlockModel? _resBlock = await goToVSR4SearchDetailScreen(context,
        keyWord: keyword.trim(), blockModel: _blockModel, blockStream: _searchBloc.blockStreamController);
    print(_resBlock);
    if (_resBlock != null) {
      {
        _blockModel = _resBlock;
        setState(() {});
      }
    }
  }
}
