import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vitan_edu/core/theme/custom.dart';

PreferredSize AppBarCustom(BuildContext context,
    {Color? backgroundColor,
    double height = 40,
    Widget? titleWidget,
    String? title,
    Widget? flexibleSpaceWidget,
    Widget? leading,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: AppBar(
      elevation: 0,
      systemOverlayStyle: systemOverlayStyle,
      titleTextStyle: titleTextStyle,
      backgroundColor: backgroundColor ?? CustomTheme.primaryColor,
      automaticallyImplyLeading: false,
      leading: leading,
      title: titleWidget ?? Text(title ?? '', style: textStyleBodyDefault.copyWith(color: Colors.white,fontWeight: Theme.of(context).textTheme.subtitle1!.fontWeight)),
      flexibleSpace: Container(
        width: double.infinity,
        height: 0,
        alignment: Alignment.center,
        child: flexibleSpaceWidget ?? const SizedBox(),
      ),
    ),
  );
}
