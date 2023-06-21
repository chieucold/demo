import 'package:core/components/custom_listview.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../bnd_pull_to_refresh.dart';

class BndSliverListCustomWidget<T> extends StatefulWidget {
  final Widget? appBar;
  final Widget? leading;
  final bool addItem;
  final NullableIndexedWidgetBuilder itemBuilder;
  final int totalRows;
  final List<T> items;
  final VoidCallback? onRefresh;
  final onLoadMore<T>? onLoading;

  BndSliverListCustomWidget(
      {Key? key,
      this.appBar,
      required this.itemBuilder,
      required this.totalRows,
      this.onRefresh,
      this.onLoading,
      this.leading,
      required this.items,
      this.addItem = false})
      : super(key: key);

  @override
  State<BndSliverListCustomWidget<T>> createState() => _BndSliverListCustomWidgetState<T>();
}

class _BndSliverListCustomWidgetState<T> extends State<BndSliverListCustomWidget<T>> {
  final RefreshController _refreshController = RefreshController();

  List<T> items = <T>[];

  bool isLoadMore = false;

  @override
  void didUpdateWidget(covariant BndSliverListCustomWidget<T> oldWidget) {
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
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 1,
            floating: true,
            leading: widget.leading ?? const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(color: Theme.of(context).backgroundColor),
              collapseMode: CollapseMode.pin,
              titlePadding: EdgeInsets.zero,
              centerTitle: true,
              title: widget.appBar,
              // background: appBarBackgroundWidget(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 23)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return widget.itemBuilder(context, index);
              },
              childCount: items.length, // 1000 list items
            ),
          ),
          if (widget.addItem) const SliverToBoxAdapter(child: SizedBox(height: 100))
          // )
        ],
      ),
    );
  }
}
