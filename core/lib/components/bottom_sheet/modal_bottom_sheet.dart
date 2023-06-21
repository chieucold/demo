import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalBottomSheet extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const ModalBottomSheet({Key? key, required this.child, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Material(
          color: backgroundColor,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(12),
          child: child,
        ),
      ),
    );
  }
}

Future<void> showFloatingModalBottomSheet({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
}) async {
  await showCustomModalBottomSheet<void>(
      context: context,
      builder: builder,
      containerWidget: (_, animation, child) => ModalBottomSheet(
            child: child,
          ),
      expand: false);

  return;
}

Future<T?> goPresent<T extends Object>(BuildContext context, Widget page,{bool isDismissible =true}) {
  return showMaterialModalBottomSheet<T?>(
    backgroundColor: Colors.transparent,
    context: context,
    isDismissible: isDismissible,
    builder: (BuildContext context) => page,
  );
}

Future<void> navigateBottomSheet(
  Widget screen,
  BuildContext context, {
  bool? enableDrag,
  double? radius,
  Color? backgroundColor,
}) {
  return showCupertinoModalBottomSheet(
    backgroundColor: backgroundColor,
    expand: false,
    enableDrag: enableDrag ?? false,
    closeProgressThreshold: 0.4,
    context: context,
    topRadius: Radius.circular(radius ?? 10),
    builder: (BuildContext context) => screen,
  );
}

Future<void> navigateDraggableBottomSheet(Widget screen, BuildContext context,
    {double minSize = 0.3,
    double maxSize = 0.52,
    double? initSize,
    bool? enableDrag,
    bool radius = true,
    bool? isScrollControlled,
    bool? isDismissible}) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled ?? false,
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible ?? false,
      shape: radius
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)))
          : null,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: initSize ?? 0.4,
          minChildSize: minSize,
          maxChildSize: maxSize,
          builder: (BuildContext context, ScrollController myScrollController) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: screen,
            );
          },
        );
      });
}
