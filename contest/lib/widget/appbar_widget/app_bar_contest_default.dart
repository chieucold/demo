import 'package:contest/theme/contest_theme.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/appbar/app_bar_background.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:flutter/material.dart';

class AppBarContestLearn extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? titleWidget;
  final Widget? backgroundWidget;
  final List<Widget>? actions;
  final bool? isCenterTitle;
  final Key? key;
  final TextStyle? textStyle;
  final Color? colorAppbar;
  final double? height;

  const AppBarContestLearn(
    this.title, {
    this.leading,
    this.titleWidget,
    this.actions,
    this.isCenterTitle,
    this.key,
    this.textStyle,
    this.backgroundWidget,
    this.colorAppbar,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      key: key,
      preferredSize: const Size.fromHeight(40.0),
      child: AppBar(
        centerTitle: isCenterTitle ?? true,
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                backgroundWidget ?? appBarBackgroundWidget(color: colorAppbar ?? ContestTheme.primaryContestColor)
              ],
            )),
        leading: leading ?? CommonLeadingWidget(),
        title: titleWidget ??
            Text(title, style: textStyleHeadline6.copyWith(color: CoreColor.textWhiteColor, fontFamily: fontGilroy)),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 48);
}
