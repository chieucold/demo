import 'package:core/components/bnd_no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../bnd_pull_to_refresh.dart';
import '../custom_listview.dart';

class BndSliverListWidget<T> extends StatefulWidget {
  final Widget? appBar, noData;
  final bool addItem;
  final NullableIndexedWidgetBuilder itemBuilder;
  final int totalRows;
  final List<T> items;
  final VoidCallback? onRefresh;
  final onLoadMore<T>? onLoading;
  final double? defaultHeight;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final ScrollController? scrollController;

  const BndSliverListWidget({
    Key? key,
    this.appBar,
    required this.itemBuilder,
    required this.totalRows,
    this.onRefresh,
    this.onLoading,
    required this.items,
    this.addItem = false,
    this.defaultHeight,
    this.noData,
    this.physics,
    this.shrinkWrap = false,
    this.scrollController,
  }) : super(key: key);

  @override
  State<BndSliverListWidget<T>> createState() => _BndSliverListWidgetState<T>();
}

class _BndSliverListWidgetState<T> extends State<BndSliverListWidget<T>> with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController = RefreshController();

  List<T> items = <T>[];

  bool isLoadMore = false;

  @override
  void didUpdateWidget(covariant BndSliverListWidget<T> oldWidget) {
    if (oldWidget.items.length != widget.items.length) {
      setState(() {
        items = widget.items;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    items = widget.items;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final header = widget.appBar;

    super.build(context);
    return BNDPullToRefresh(
      controller: _refreshController,
      onLoading: () {
        (widget.onLoading!().then(
          (List<T>? value) {
            setState(() {
              if (value != null) items.addAll(value);
              _refreshController.loadComplete();
              _refreshController.refreshCompleted();
            });
          },
        ));
      },
      enablePullUp: items.length < widget.totalRows && widget.onLoading != null,
      enablePullDown: widget.onRefresh != null,
      onRefresh: () {
        widget.onRefresh!(); // check enablePullDown ở trên
        _refreshController.loadComplete();
        _refreshController.refreshCompleted();
      },
      child: CustomScrollView(
        shrinkWrap: widget.shrinkWrap,
        physics: widget.physics,
        controller: widget.scrollController,
        slivers: <Widget>[
          if (widget.appBar != null)
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 1,
              collapsedHeight: widget.defaultHeight,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(color: Theme.of(context).backgroundColor),
                collapseMode: CollapseMode.pin,
                titlePadding: EdgeInsets.zero,
                centerTitle: true,
                title: header,
                // background: appBarBackgroundWidget(),
              ),
            ),
          (widget.totalRows > 0 && items.length > 0)
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return widget.itemBuilder(context, index);
                    },
                    childCount: items.length, // 1000 list items
                  ),
                )
              : SliverToBoxAdapter(
                  child: Container(
                      child: Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().screenHeight * 0.2),
                  child: widget.noData ?? BnDNoData(),
                ))),
          if (widget.addItem) const SliverToBoxAdapter(child: SizedBox(height: 100))
          // )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
