import 'package:flutter/material.dart';

class BNDSliverAppBar extends StatefulWidget {
  const BNDSliverAppBar(
    this.body,
    this.collapseWidget,
    this.expandedWidget, {
    Key? key,
    this.expandedHeight = 150,
    this.backgroundColor,
    this.elevation,
    this.scrollController,
    this.bottomWidget,
    this.keepController = false,
  }) : super(key: key);
  final double expandedHeight;
  final Color? backgroundColor;
  final Widget body;
  final Widget collapseWidget;
  final Widget expandedWidget;
  final double? elevation;
  final Widget? bottomWidget;
  final ScrollController? scrollController;
  final bool keepController;
  @override
  State<BNDSliverAppBar> createState() => _BNDSliverAppBarState();
}

class _BNDSliverAppBarState extends State<BNDSliverAppBar> {
  bool lastStatus = true;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    if (!widget.keepController) {
      _scrollController.removeListener(_scrollListener);
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController.hasClients && _scrollController.offset > (widget.expandedHeight - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    // print("litest ${widget.expandedHeight}");
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (_, __) => <Widget>[
        SliverAppBar(
          expandedHeight: widget.expandedHeight,
          automaticallyImplyLeading: false,
          pinned: true,
          titleSpacing: 0,
          floating: false,
          backgroundColor: widget.backgroundColor,
          toolbarHeight: 48,
          flexibleSpace: _buildAppBar(),
          elevation: widget.elevation,
        ),
      ],
      body: widget.bottomWidget != null
          ? Column(
              children: <Widget>[widget.body, widget.bottomWidget!],
            )
          : widget.body,
    );
  }

  Widget _buildAppBar() {
    return FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        collapseMode: CollapseMode.parallax,
        centerTitle: _isShrink ? true : false,
        title: MediaQuery.removePadding(
          context: context,
          // removeBottom: true,
          child: _isShrink ? widget.collapseWidget : const SizedBox(),
        ),
        background: widget.expandedWidget);
  }
}
