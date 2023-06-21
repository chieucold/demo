import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class BNDIconSvgButton extends StatelessWidget {
  void Function() onTap;
  String icon;
  Color colorIcon;
  double? height;
  double? width;
  BNDIconSvgButton(
      {Key? key,
      required this.icon,
      required this.onTap,
      this.height,
      this.width,
      this.colorIcon = kTextWhiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Images.svgAssets(
          icon,
          color: colorIcon,
        ),
      ),
    );
  }
}
