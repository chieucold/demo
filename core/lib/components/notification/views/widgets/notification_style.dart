import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class NotificationStyle {
  static TextSpan createdName(String text) => TextSpan(
        text: text,
        style: textStyleBodyDefaultBold.copyWith(
          color: CoreColor.tileLeadingColor,
          fontWeight: FontWeight.w600,
        ),
      );

  static TextSpan objectTitle(String text) => TextSpan(
        text: text,
        style: textStyleBodyDefault.copyWith(
          color: CoreColor.textColor,
          fontWeight: FontWeight.w600,
        ),
      );

  static TextSpan defaultTextSpan(String text) => TextSpan(
        text: text,
        style: textStyleBodyDefaultBold.copyWith(
          color: CoreColor.textColor,
          fontWeight: FontWeight.w400,
        ),
      );
}
