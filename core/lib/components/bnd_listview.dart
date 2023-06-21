import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BnDListView extends StatefulWidget {
  BnDListView({
    this.itemCount,
    this.itemBuilder,
    this.loadMore = false,
    this.onLoadMore,
    this.loadMoreWhenNoData = false,
    this.loadMoreItemBuilder,
    this.physics,
    this.headerSliverBuilder,
    this.controller,
    this.foregroundWidget,
    this.padding,
    this.scrollbarEnable = true,
    this.isSliverMode = false,
  }) : assert(itemBuilder != null);

  final int? itemCount;
  final WidgetBuilder? loadMoreItemBuilder;
  final IndexedWidgetBuilder? itemBuilder;
  final bool loadMore;
  final bool loadMoreWhenNoData;
  final bool scrollbarEnable;
  final VoidCallback? onLoadMore;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final NestedScrollViewHeaderSliversBuilder? headerSliverBuilder;
  final Widget? foregroundWidget;
  final EdgeInsetsGeometry? padding;
  final bool isSliverMode;

  @override
  State<StatefulWidget> createState() => BnDListViewState();
}

enum ItemType { loadMore, data }

class BnDListViewState extends State<BnDListView> {
  bool get isNested => widget.headerSliverBuilder != null;

  @override
  Widget build(BuildContext context) => isNested
      ? NestedScrollView(
          headerSliverBuilder: widget.headerSliverBuilder!,
          physics: widget.physics,
          controller: widget.controller,
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: _buildList(),
          ),
        )
      : _buildList();

  Widget _itemBuilder(BuildContext context, int index) {
    final int? totalItemCount = _dataItemCount();
    switch (_itemType(index, totalItemCount!)) {
      case ItemType.loadMore:
        return _buildLoadMoreItem();
      case ItemType.data:
      default:
        return widget.itemBuilder!(context, index);
    }
  }

  Widget _buildList() {
    final int? totalItemCount = _dataItemCount();
    final ScrollView listView = widget.isSliverMode
        ? CustomScrollView(
            slivers: List.generate(
                totalItemCount!, (int index) => _itemBuilder(context, index)),
          )
        : ListView.builder(
            physics: isNested ? null : widget.physics,
            controller: isNested ? null : widget.controller,
            padding: widget.padding,
            shrinkWrap: true,
            itemCount: totalItemCount,
            itemBuilder: _itemBuilder,
          );

    List<Widget> children =
        widget.scrollbarEnable ? [Scrollbar(child: listView)] : [listView];
    if (widget.foregroundWidget != null) children.add(widget.foregroundWidget!);
    return Stack(children: children);
  }

  ItemType _itemType(int itemIndex, int totalItemCount) {
    if (_isLoadMore(itemIndex, totalItemCount)) {
      return ItemType.loadMore;
    } else {
      return ItemType.data;
    }
  }

  Widget _buildLoadMoreItem() {
    if ((widget.loadMoreWhenNoData ||
            (!widget.loadMoreWhenNoData && widget.itemCount! > 0)) &&
        widget.onLoadMore != null) {
      Timer(const Duration(milliseconds: 50), widget.onLoadMore!);
    }
    return widget.loadMoreItemBuilder != null
        ? widget.loadMoreItemBuilder!(context)
        : widget.isSliverMode
            ? SliverList(delegate: SliverChildListDelegate([_defaultLoadMore]))
            : _defaultLoadMore;
  }

  bool _isLoadMore(int itemIndex, int total) =>
      widget.loadMore && itemIndex == total - 1;

  int? _dataItemCount() => widget.itemCount;

  final Container _defaultLoadMore = Container(
    padding: const EdgeInsets.all(8.0),
    child: const Center(
      child: CircularProgressIndicator(),
    ),
  );
}
