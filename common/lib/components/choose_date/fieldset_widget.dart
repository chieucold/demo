import 'package:common/common/color/common_color.dart';
import 'package:flutter/material.dart';

Widget FieldSetWidget(
  String title,
  Widget body, {
  double legendFontSize = 12,
  EdgeInsets? padding,
  TextStyle? titleTextStyle,
  double? labelRadius,
  double? borderRadius,
  Color? labelColor,
  Color? borderColor,
  double? width,
}) {
  return Stack(
    children: <Widget>[
      Container(
        width: width ?? double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: legendFontSize / 2),
        padding: padding ?? const EdgeInsets.fromLTRB(20, 24, 20, 24),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: borderColor ?? CommonColor.fieldSetBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 16)),
        ),
        child: body,
      ),
      Container(
        decoration: BoxDecoration(
          color: labelColor ?? Colors.white,
          borderRadius: BorderRadius.circular(labelRadius ?? 0),
        ),
        margin: const EdgeInsets.only(left: 20),
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Text(
          title,
          style: titleTextStyle ?? TextStyle(fontSize: legendFontSize, color: CommonColor.fieldSetLegendColor),
        ),
      )
    ],
  );
}
