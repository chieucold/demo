import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CircleButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final Widget iconWidget;
  const CircleButtonWidget({Key? key, required this.onTap, this.padding,required this.iconWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 53.sp,
      onPressed: onTap,
      elevation: 2,
      padding: padding ?? const EdgeInsets.all(6),
      shape: const CircleBorder(),
      child: Ink(
        child: iconWidget,
      ),
    );
  }
}
