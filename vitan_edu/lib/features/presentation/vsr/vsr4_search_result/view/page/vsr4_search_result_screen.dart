import 'dart:async';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/view/widgets/vsr3_search_block_widget.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/bloc/vsr4_tab_bloc.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/view/widgets/vsr4_body_result_widget.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr4_search_result/view/widgets/vsr4_category_search_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

class VSR4SearchResultScreen extends StatefulWidget {
  final String keyword;
  final BlockModel blockModel;
  final StreamController<BlockModel> blockStream;

  VSR4SearchResultScreen({Key? key, this.keyword = '', required this.blockModel, required this.blockStream})
      : super(key: key);

  @override
  State<VSR4SearchResultScreen> createState() => _VSR4SearchResultScreenState();
}

class _VSR4SearchResultScreenState extends State<VSR4SearchResultScreen> {
  late PageController _pageController;

  final VSR4TabBloc _bloc = getItSuper();
  late AutoScrollController controller;
  final StreamController<int> streamController = StreamController<int>();

  double get _heightBarSize => 50.sp;

  late BlockModel _blockModel;

  void onTabChange(int index) {
    _scrollToCounter(index);
    _pageController.jumpToPage(index);
  }

  Future _scrollToCounter(int counter) async {
    await controller.scrollToIndex(counter, preferPosition: AutoScrollPosition.begin);
    controller.highlight(counter);
  }

  @override
  void initState() {
    super.initState();
    _blockModel = widget.blockModel;
    _pageController = PageController(keepPage: true, initialPage: 0);
    controller = AutoScrollController(
        viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.horizontal);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    controller.dispose();
    // _bloc.isSetState.close();
  }

  void _onBack() => Navigator.pop(context, _blockModel);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VSR4TabBloc>(
      create: (context) => _bloc..init(widget.keyword, _blockModel.id),
      child: Scaffold(
        appBar: AppBarSupperApp(height: 0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: CustomTheme.paddingBodyDefault.copyWith(left: 0, top: 8.sp),
              child: Row(
                children: [
                  CommonLeadingWidget(
                    iconColor: CustomTheme.black,
                    onPress: _onBack,
                  ),
                  Expanded(
                    child: BndGestureDetector(
                      onTap: _onBack,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CustomTheme.fillSearchColor,
                        ),
                        height: _heightBarSize,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.keyword,
                          style: textStyleBodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  VSR3SearchBlockWidget(
                    blockModel: _blockModel,
                    onChangeItem: (c) {
                      _blockModel = c;
                      widget.blockStream.add(_blockModel);
                      goToVSR4SearchDetailScreen(context,
                          keyWord: widget.keyword,
                          blockModel: _blockModel,
                          isReplace: true,
                          blockStream: widget.blockStream);
                    },
                  )
                ],
              ),
            ),
            VSR4CategorySearchWidget(onTabChange: onTabChange, bloc: _bloc, controller: controller),
            Expanded(child: _buildBodySearch())
          ],
        ),
      ),
    );
  }

  Widget _buildBodySearch() {
    return StreamBuilder<int>(
      stream: _bloc.lengthPage.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null)
          return snapshot.data! > 1
              ? PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: List.generate((snapshot.data! + 1),
                      (index) => VSR4BodyResultWidget(onChangeTab: onTabChange, blockModel: widget.blockModel)),
                )
              : Center(child: BnDNoData(blockId: _blockModel.id));
        return const Center(child: CupertinoActivityIndicator());
      },
    );
  }
}
