import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';

Widget appBarBackgroundWidget({Color? color}) {
  return Container(
    decoration: BoxDecoration(
      color: color ?? CoreColor.primaryColor,
      image: const DecorationImage(
        repeat: ImageRepeat.repeat,
        fit: BoxFit.none,
        image: AssetImage(Images.imageAppBarBackground, package: 'core'),
      ),
    ),
  );
}
