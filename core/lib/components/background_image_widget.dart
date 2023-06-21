import 'package:flutter/material.dart';

class BackgroundHomeImage extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget image;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final VoidCallback? onTryClick;
  final Widget? bottom;

  BackgroundHomeImage(
      {required this.child,
        this.appBar,
        this.resizeToAvoidBottomInset = true,
        required this.image,
        this.bottom,
        this.backgroundColor,
        this.onTryClick});

  @override
  Widget build(BuildContext context) {
    final double wScreen = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
              child: Container(
                color: backgroundColor,
              )),
          Positioned(top: 0, child: image),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: child,
            bottomNavigationBar: bottom,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          ),
        ],
      ),
    );
  }
}