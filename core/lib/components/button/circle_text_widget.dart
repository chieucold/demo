import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class CircleTextWidget extends StatelessWidget {
  final int amount;
  final double size;
  final Color? color;

  const CircleTextWidget({Key? key, required this.amount, this.size = 21.0, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color _color = color ?? const Color(0xFFE4AD24);
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: _color, borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: Text(
        amount.toString(),
        style: textStyleBodySmallestBold.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}