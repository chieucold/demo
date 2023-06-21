import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class ButtonRequestWidget extends StatelessWidget {
  final String title;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback onPress;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  ButtonRequestWidget({
    Key? key,
    this.title = "",
    this.textColor,
    this.borderColor,
    required this.onPress,
    this.padding, this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? CoreColor.requestBtnAcceptColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: textStyle ?? textStyleBodySmallest.copyWith(
            color: textColor ?? CoreColor.textColor,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
