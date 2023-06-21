import 'package:core/common/color/core_color.dart';
import 'package:core/components/appbar/app_bar_default.dart';
import 'package:core/components/bnd_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
    this.body,
    this.expandedWidget, {
    Key? key,
    this.collapseWidget,
    this.expandedHeight = 150,
    this.collapseLeading,
    this.collapseAction,
    this.collapseTitle,
    this.scrollController,
    this.backgroundColor,
  }) : super(key: key);

  final Widget body;
  final Widget? collapseWidget;
  final String? collapseTitle;
  final Widget? collapseLeading;
  final Widget? collapseAction;
  final Widget expandedWidget;
  final double expandedHeight;
  final ScrollController? scrollController;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return BNDSliverAppBar(
      body,
      _buildCollapseWidget(context),
      expandedWidget,
      backgroundColor: backgroundColor ?? CoreColor.white,
      expandedHeight: expandedHeight,
      scrollController: scrollController,
    );
  }

  Widget _buildCollapseWidget(BuildContext context) {
    if (collapseWidget != null) return collapseWidget!;
    return Container(
      color: Colors.transparent,
      child: AppBarDefault(
        context,
        collapseTitle ?? "",
        actions: [collapseAction ?? const SizedBox()],
        color: backgroundColor,
        colorAppbar: backgroundColor
      ),
    );
  }
}
