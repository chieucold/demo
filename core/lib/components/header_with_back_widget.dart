import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

Widget HeaderWidthBackWidget(BuildContext context, String title,
    {TextStyle? textStyle,
    double? paddingLeft,
    double? backButtonSize,
    Icon? iconBack,
    bool isShowBack = true,
    bool isShowBorderBottom = true,
    Function? onBack}) {
  late double backButton = backButtonSize ?? 20;
  if (!isShowBack) backButton = 0;
  final double padding = paddingLeft ?? 24;
  return GestureDetector(
    onTap: () {
      if (onBack != null)
        onBack();
      else
        Navigator.pop(context);
    },
    child: Container(
      decoration: BoxDecoration(
          border: isShowBorderBottom ? Border(bottom: BorderSide(color: CoreColor.borderDefault)) : null),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          if (isShowBack)
            Container(
              margin: EdgeInsets.only(left: padding),
              width: backButton,
              height: backButton,
              child: iconBack ?? Icon(Icons.arrow_back_ios, color: CoreColor.textColor, size: 16),
            ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(right: padding + backButton),
            child: Text(
              title,
              style: textStyle ?? textStyleHeadline6,
              textAlign: TextAlign.center,
            ),
          )),
        ],
      ),
    ),
  );
}
