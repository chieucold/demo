import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vitan_edu/core/theme/custom.dart';

PreferredSize AppBarSupperApp(
    {Color backgroundColor = Colors.transparent,
    double height = 50,
    Widget? titleWidget,
    String? title,
    Widget? flexibleSpaceWidget,
    Widget? leading,
    List<Widget>? actions,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle systemOverlayStyle = const SystemUiOverlayStyle(statusBarBrightness: Brightness.light)}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: AppBar(
      elevation: 0.0,
      systemOverlayStyle: systemOverlayStyle,
      titleTextStyle: titleTextStyle,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leading: leading,
      centerTitle: true,
      actions: actions,
      title: titleWidget ?? Text(title ?? '', style: textStyleHeadline6.copyWith(color: CustomTheme.textColor)),
      flexibleSpace: Container(
        width: double.infinity,
        height: 0,
        alignment: Alignment.center,
        child: flexibleSpaceWidget ?? const SizedBox(),
      ),
    ),
  );
}
