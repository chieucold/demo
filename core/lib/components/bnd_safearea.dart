import 'package:flutter/material.dart';

class BndSafeAreaWidget extends StatelessWidget {
  final bool top;
  final bool bottom;
  final Widget child;

  const BndSafeAreaWidget({Key? key, this.top = false, required this.child, this.bottom = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: top, bottom: bottom, child: child);
  }
}
