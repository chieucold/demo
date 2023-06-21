import 'package:flutter/material.dart';

class BndGestureDetector extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const BndGestureDetector({Key? key,required this.child,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: child,
    );
  }
}
