import 'package:flutter/material.dart';

// font chữ
String fontFamily = "Sarabun";
String fontGilroy = "SVN-Gilroy";
double fontHeadline1 = 96;
double fontHeadline2 = 60;
double fontHeadline3 = 48;
double fontHeadline4 = 34;
double fontHeadline5 = 24;
double fontBodyLarge = 22;
double fontHeadline6 = 20;
double fontBodyMedium = 18;
double fontBodyDefault = 16; // Thiết kế là Body 1
double fontBodySmall = 14; // Thiết kế là font Body 2
double fontBodySmallest = 12;

TextStyle get textStyleHeadline1 => TextStyle(fontSize: fontHeadline1, fontWeight: FontWeight.normal);

TextStyle get textStyleHeadline2 => TextStyle(fontSize: fontHeadline2, fontWeight: FontWeight.w600);

TextStyle get textStyleHeadline3 => TextStyle(fontSize: fontHeadline3, fontWeight: FontWeight.w600);

TextStyle get textStyleHeadline4 => TextStyle(fontSize: fontHeadline4, fontWeight: FontWeight.w600);

TextStyle get textStyleHeadline5 => TextStyle(fontSize: fontHeadline5, fontWeight: FontWeight.w700);

TextStyle get textStyleHeadline6 =>
    TextStyle(fontSize: fontHeadline6, fontWeight: FontWeight.w700, fontFamily: fontFamily);

TextStyle get textStyleHeadline6Default => TextStyle(fontSize: fontHeadline6, fontFamily: fontFamily);

TextStyle get textStyleBodyMedium => TextStyle(fontSize: fontBodyMedium, fontFamily: fontFamily);

TextStyle get textStyleBodyMediumBold =>
    TextStyle(fontSize: fontBodyMedium, fontWeight: FontWeight.bold, fontFamily: fontFamily);

TextStyle get textStyleBodyDefault => TextStyle(fontSize: fontBodyDefault, fontFamily: fontFamily);

TextStyle get textStyleBodyDefaultBold =>
    TextStyle(fontSize: fontBodyDefault, fontWeight: FontWeight.bold, fontFamily: fontFamily);

///font 14,
TextStyle get textStyleBodySmall => TextStyle(fontSize: fontBodySmall, fontFamily: fontFamily);

TextStyle get textStyleBodySmallBold => TextStyle(fontSize: fontBodySmall, fontWeight: FontWeight.bold);

TextStyle get textStyleBodySmallest => TextStyle(fontSize: fontBodySmallest);

TextStyle get textStyleBodySmallestBold => TextStyle(fontSize: fontBodySmallest, fontWeight: FontWeight.bold);

TextStyle get textStyleBodyLarge => TextStyle(fontSize: fontBodyLarge);

TextStyle get textStyleBodyLargeBold => TextStyle(fontSize: fontBodyLarge, fontWeight: FontWeight.bold);
