import 'package:flutter/material.dart';

class BNDNestedScrollView extends StatelessWidget {
  final double toolbarHeight;
  final Widget appbar;
  final Widget body;
  final bool floatHeaderSlivers;
  final ScrollController? controller;
  const BNDNestedScrollView({
    Key? key,
    required this.appbar,
    required this.body,
    this.toolbarHeight = 48,
    this.floatHeaderSlivers = true,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: controller,
        floatHeaderSlivers: floatHeaderSlivers,
        headerSliverBuilder: (_, __) {
          return <Widget>[
            SliverAppBar(
              elevation: 0.0,
              // floating: true,
              // snap: true,
              toolbarHeight: toolbarHeight,
              flexibleSpace: appbar,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              leading: const SizedBox(),
            ),
          ];
        },
        body: body,
      ),
    );
  }
}
