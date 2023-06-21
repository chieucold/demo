import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerWrapper extends StatelessWidget {
  const OpenContainerWrapper({
    Key? key,
    required this.closedBuilder,
    this.transitionType = ContainerTransitionType.fade,
    // required this.onClosed,
    required this.pageGoTo,
    this.transitionDuration = const Duration(milliseconds: 750),
    this.closedColor,
    this.openColor,
    this.closedElevation,
    this.openElevation,
    this.openRadius = 12,
    this.closeRadius = 12,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  // final ClosedCallback<bool?> onClosed;
  final Widget pageGoTo;
  final Duration transitionDuration;
  final Color? closedColor;
  final Color? openColor;
  final double? closedElevation;
  final double? openElevation;
  final double openRadius;
  final double closeRadius;

  void _showMarkedAsDoneSnackbar(bool? isMarkedAsDone, BuildContext context) {
    if (isMarkedAsDone ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Marked as done!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext __, VoidCallback _) {
        return pageGoTo;
      },
      onClosed: (bool? isMarkedAsDone) {
        _showMarkedAsDoneSnackbar(isMarkedAsDone, context);
      },
      tappable: false,
      closedBuilder: closedBuilder,
      transitionDuration: transitionDuration,
      closedColor: closedColor ?? Colors.white,
      closedElevation: closedElevation ?? 1.0,
      openColor: openColor ?? Colors.white,
      openElevation: openElevation ?? 1.4,
      closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(openRadius))),
      openShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(closeRadius))),
    );
  }
}
