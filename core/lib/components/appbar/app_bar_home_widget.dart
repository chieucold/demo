import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/components/menu_bar.dart/menu_bar_widget.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/appbar/app_bar_background.dart';
import 'package:core/components/text/size_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHomeWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String? secondaryTitle;
  final Widget? action;
  final bool hasLeading;
  final double? height;
  final Color appbarBackgroundColor;
  final BlockEnum blockEnum;
  final bool isFlip;
  final Widget? titleWidget;
  final Widget? leading;
  final bool centerTitle;

  const AppBarHomeWidget({
    Key? key,
    this.title = 'Supper App',
    this.secondaryTitle,
    this.action,
    this.hasLeading = false,
    this.height,
    this.appbarBackgroundColor = const Color(0xff663300),
    required this.blockEnum,
    this.isFlip = false,
    this.titleWidget,
    this.leading,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      automaticallyImplyLeading: false,
      // title: Text(
      //   title,
      //   style: textStyleHeadline6Default.copyWith(color: Colors.white, fontSize: 20),
      // ),
      title: titleWidget ??
          (isFlip
              ? SizeTextWidget(primaryTitle: title, secondaryTitle: secondaryTitle)
              : Text(title, style: textStyleHeadline6Default.copyWith(color: CoreColor.white, fontSize: 20))),
      centerTitle: centerTitle,
      leadingWidth: 64,
      leading: !hasLeading ? null : leading ?? _buildLeading(context),
      actions: <Widget>[action ?? const SizedBox()],
      flexibleSpace: Container(
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              appBarBackgroundWidget(color: appbarBackgroundColor),
              Positioned(
                bottom: -2,
                right: 0,
                child: Container(
                  width: 80,
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: Images.svgAssets(Images.app_bar_menu_bg_image,
                                  width: 80, height: 40, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      MenuBarWidgetWidget(
                        idMiniApp: blockEnum.index,
                        colorMiniApp: appbarBackgroundColor,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _buildLeading(BuildContext context) => Row(
        children: <Widget>[
          IconButton(
              iconSize: 40,
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
              icon: Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  alignment: Alignment.center,
                  child: Images.svgAssets(Images.home_icon, height: 25, width: 25))),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 12),
            alignment: Alignment.center,
            width: 1,
            height: 21,
            color: Colors.white,
          ),
        ],
      );

  @override
  Size get preferredSize => Size.fromHeight(height ?? 48);
}
