import 'package:core/common/color/core_color.dart';
import 'package:core/common/dimension.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/appbar/app_bar_background.dart';
import 'package:flutter/material.dart';

class SliverAppBarDefaultWidget extends StatelessWidget {
  final Widget header;
  final bool floating;
  final bool pinned;
  final Color? backGroundColor;

  const SliverAppBarDefaultWidget({Key? key, required this.header, this.floating = false, this.pinned = true,this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      ///Properties of app bar
      ///
      /// Color of app bar when it is collapsed
      backgroundColor: CoreColor.primaryColor,

      /// Set to false so that appbar is always invisible after
      /// collapsing
      /// If set to true here, the app bar will expand as soon as you
      /// start scrolling up even if you haven't reached the top
      floating: false,

      /// To make the app bar visible at all times after collapsing
      /// we set pinned to true
      pinned: true,
      expandedHeight: APPBAR_EXPANDED_HEIGHT,

      ///Properties of the App Bar when it is expanded
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text('Hollad'),
        background: appBarBackgroundWidget(color: backGroundColor),
      ),
    );
  }
}
