import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/components/bnd_button.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class BorderButtonWidget extends StatelessWidget {
  BorderButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.height,
      this.textStyle,
      this.iconSize,
      this.padding,
      this.margin,
      this.borderColor,
      this.elevation,
      this.backGroundColor,
      this.iconLeft,
      this.radius = 90})
      : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final double? height;
  final TextStyle? textStyle;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final double radius;
  final double? elevation;
  final Color? backGroundColor;
  final Widget? iconLeft;

  @override
  Widget build(BuildContext context) {
    return BnDButton(
      elevation: elevation,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? CoreColor.buttonBorderDefaultColor),
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      backGroundColor: backGroundColor ?? CoreColor.textWhiteColor,
      radius: radius,
      padding: padding ?? const EdgeInsets.fromLTRB(15, 10, 18, 9),
      margin: margin ?? EdgeInsets.zero,
      title: Text(
        title,
        style: textStyle ??
            textStyleBodyDefaultBold.copyWith(
              color: CoreColor.textColor,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      iconLeft: iconLeft,
      iconRight: iconSize != 0
          ? Container(
              child: Images.svgAssets(
                Images.icChevronRight,
                color: CoreColor.textColor,
                height: 9,
                width: 5,
              ),
            )
          : null,
      onPressed: onPressed,
    );
  }
}
