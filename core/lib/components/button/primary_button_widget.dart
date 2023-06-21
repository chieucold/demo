import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/color/core_space.dart';
import 'package:core/components/bnd_button.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  PrimaryButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.height,
    this.textStyle,
    this.iconSize,
    this.padding,
    this.margin,
    this.rightIconMargin,
    this.backgroundColor,
    this.radius,
    this.isGradient = true,
    this.gradient = CoreColor.examLinearGradient,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final double? height;
  final TextStyle? textStyle;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsets? rightIconMargin;
  final Color? backgroundColor;
  final double? radius;
  final bool isGradient;
  final LinearGradient gradient;
  @override
  Widget build(BuildContext context) {
    return BnDButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius ?? 90))),
      backGroundColor: backgroundColor ?? CoreColor.primaryColor,
      radius: radius ?? 90,
      gradient: isGradient ? gradient : null,
      padding: padding ?? const EdgeInsets.fromLTRB(16, 10, 16, 9),
      //horizontal: 16,
      margin: margin ?? EdgeInsets.only(top: CoreSpace.bottomPaddingSpace, bottom: CoreSpace.bottomPaddingSpace),
      // ??
      //   const EdgeInsets.symmetric(
      //     horizontal: 32,
      //     vertical: 12,
      //   ),
      title: Text(title,
          style: textStyle ??
              textStyleBodyDefault.copyWith(
                color: CoreColor.textWhiteColor,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold,
              ),
          overflow: TextOverflow.ellipsis),
      iconRight: iconSize != 0
          ? Container(
              margin: rightIconMargin ?? const EdgeInsets.only(left: 6),
              child: Images.svgAssets(
                Images.icChevronRight,
                color: CoreColor.textWhiteColor,
                height: 9,
                width: 5,
              ),
            )
          : null,
      // title: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: <Widget>[
      //     Text(title,
      //         style: textStyle ??
      //             textStyleBodyDefault.copyWith(
      //               color: CustomTheme.textWhiteColor,
      //               fontFamily: CustomTheme.fontFamily,
      //               fontWeight: FontWeight.bold,
      //             )),
      //     iconSize != 0
      //         ? Container(
      //             margin: rightIconMargin ?? const EdgeInsets.only(left: 6),
      //             child: Images.svgAssets(
      //               Images.icChevronRight,
      //               color: kTextWhiteColor,
      //             ),
      //           )
      //         : const SizedBox(),
      //   ],
      // ),
      onPressed: onPressed,
    );
  }
}
