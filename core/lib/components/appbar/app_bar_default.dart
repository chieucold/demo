import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/appbar/app_bar_background.dart';
import 'package:flutter/material.dart';

PreferredSize AppBarDefault(
  BuildContext context,
  String title, {
  Widget? leading,
  Widget? titleWidget,
  List<Widget>? actions,
  bool? isCenterTitle = true,
  ValueKey? key,
  Color? color,
  Color? colorAppbar,
}) {
  return PreferredSize(
    key: key,
    preferredSize: const Size.fromHeight(40.0),
    child: AppBar(
      centerTitle: isCenterTitle,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
          height: double.infinity,
          width: double.infinity,
          color: color ?? CoreColor.primaryColor,
          child: Stack(
            children: <Widget>[appBarBackgroundWidget(color: colorAppbar)],
          )),
      leading: leading ?? const SizedBox(),
      title: titleWidget ??
          Text(
            title.trim().replaceAll('\n', ' '),
            style: textStyleHeadline6.copyWith(color: CoreColor.textWhiteColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      actions: actions,
    ),
  );
}
