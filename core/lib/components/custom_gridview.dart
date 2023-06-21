import 'package:core/components/bnd_pull_to_refresh.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

typedef onLoadMore<T> = Future<List<T>?> Function();

class CustomGridView<T> extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final Widget separatorWidget;
  final VoidCallback? onRefresh;
  final onLoadMore<T>? onLoading; // for load more
  final Axis scrollDirection;
  final int totalItem;
  final List<T> items;
  final int countItemAdd;
  final bool shrinkWrap;
  final ScrollPhysics? scrollPhysics;
  final IndexedWidgetBuilder? separatorBuilder;
  final EdgeInsets? padding;
  final bool primary;
  final Widget? widgetNoData;
  final int itemCountGrid;
  final ScrollController? scrollController;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  CustomGridView({
    Key? key,
    required this.itemBuilder,
    required this.totalItem,
    required this.items,
    this.separatorWidget = const SizedBox(),
    this.onRefresh,
    this.onLoading,
    this.scrollDirection = Axis.vertical,
    this.countItemAdd = 0,
    this.shrinkWrap = false,
    this.primary = true,
    this.separatorBuilder,
    this.padding,
    this.scrollPhysics,
    this.widgetNoData,
    this.itemCountGrid = 2,
    this.scrollController,
    this.mainAxisSpacing = 24,
    this.crossAxisSpacing = 16,
  }) : super(key: key);

  @override
  _CustomGridViewState createState() => _CustomGridViewState<T>();
}

class _CustomGridViewState<T> extends State<CustomGridView<T>> {
  final RefreshController _refreshController = RefreshController();
  late ScrollController scrollController;
  List<T> items = <T>[];

  bool isLoadMore = false;

  @override
  void didUpdateWidget(covariant CustomGridView<T> oldWidget) {
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
    scrollController = widget.scrollController ?? ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BNDPullToRefresh(
      scrollDirection: widget.scrollDirection,
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
      enablePullUp: items.length < widget.totalItem && widget.onLoading != null,
      enablePullDown: widget.onRefresh != null,
      onRefresh: () {
        widget.onRefresh!(); // check enablePullDown ở trên
        _refreshController.loadComplete();
        _refreshController.refreshCompleted();
      },
      // header: const WaterDropMaterialHeader(),
      // footer: CustomFooter(
      //   builder: (BuildContext context, LoadStatus? mode) {
      //     Widget body = const SizedBox();
      //     if (mode == LoadStatus.idle) {
      //       body = Text(
      //         AppLocalizations.of(context)!.translate("pull_up_load"),
      //       );
      //     } else if (mode == LoadStatus.loading) {
      //       body = const CupertinoActivityIndicator();
      //     } else if (mode == LoadStatus.failed) {
      //       body = Text(AppLocalizations.of(context)!.translate("load_failed!_click_retry!"));
      //     } else if (mode == LoadStatus.canLoading) {
      //       body = Text(AppLocalizations.of(context)!.translate("release_to_load_more"));
      //     } else {
      //       body = Text(AppLocalizations.of(context)!.translate("no_more_data"));
      //     }
      //     return Container(
      //       height: 50,
      //       child: Center(
      //         child: body,
      //       ),
      //     );
      //   },
      // ),
      child: (widget.totalItem > 0 || items.length > 0)
          ? AlignedGridView.count(
              itemCount: items.length + widget.countItemAdd,
              crossAxisCount: widget.itemCountGrid,
              crossAxisSpacing: widget.crossAxisSpacing,
              mainAxisSpacing: widget.mainAxisSpacing,
              padding: widget.padding,
              itemBuilder: widget.itemBuilder,
              shrinkWrap: widget.shrinkWrap,
              primary: widget.primary,
              scrollDirection: widget.scrollDirection,
              physics: widget.scrollPhysics,
              controller: widget.scrollController,
            )
          // ? ListView.separated(
          //     padding: widget.padding,
          //     itemBuilder: widget.itemBuilder,
          //     separatorBuilder: widget.separatorBuilder ?? (BuildContext context, int index) => widget.separatorWidget,
          //     shrinkWrap: widget.shrinkWrap,
          //     primary: widget.primary,
          //     scrollDirection: widget.scrollDirection,
          //     physics: widget.scrollPhysics,
          //     itemCount: items.length + widget.countItemAdd)
          : widget.widgetNoData ?? BnDNoData(),
    );
  }
}
