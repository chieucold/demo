import 'package:flutter/material.dart';

class OrientationWidget extends StatelessWidget {
  const OrientationWidget({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return child ?? const SizedBox.shrink();
        } else if (orientation == Orientation.landscape) {
          return SafeArea(child: child ?? const SizedBox.shrink());
        }
        return const SizedBox.shrink();
      },
    );
  }
}
