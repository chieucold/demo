import 'package:flutter/material.dart';

class CustomColor {
  final Color? primaryColor;
  final Color? textColor;
  final Color? appBackgroundColor;
  final Color? dividerColor;
  final Color? textColor1;
  final Color? colorUserTookExam;
  final Color? tabBarIndicatorColor;
  final Color? colorSliderBanner;
  final Color? iconColor;
  final Color? widgetColor;
  final Color? widgetColor1;
  final Color? colorBorder;
  final Color? disableButtonColor;
  final Color? test;

  CustomColor({this.primaryColor, this.textColor, this.appBackgroundColor,
    this.dividerColor, this.textColor1, this.colorUserTookExam,
    this.tabBarIndicatorColor, this.colorSliderBanner,
    this.iconColor, this.widgetColor, this.widgetColor1, this.colorBorder,
    this.test,
    this.disableButtonColor});
}


  CustomColor getCustomColor(bool isLight) {
    if (isLight) {
      return CustomColor(
        primaryColor: const Color(0xFFF5F4F8),
        textColor: const Color(0xFF353282),
        appBackgroundColor: const Color.fromRGBO(51, 51, 51, 0.1),
        textColor1: const Color(0xFF0095DE),
        dividerColor: Color(0xFFE1E1E1),
        colorUserTookExam: Colors.white,
        tabBarIndicatorColor: const Color(0xFF353282),
        colorSliderBanner: const Color(0xffF4F4F4),
        iconColor: Colors.white,
        widgetColor: Colors.black,
        widgetColor1: const Color(0xFFF2FBD7),
        colorBorder: const Color(0xFFFFFFFF),
        disableButtonColor: const Color(0xFF333333),
      );
    } else {
      //dark
      return CustomColor(
        primaryColor: const Color(0xFFF5F4F8),
        textColor: const Color(0xFF353282),
        appBackgroundColor: const Color.fromRGBO(51, 51, 51, 0.1),
        textColor1: const Color(0xFF0095DE),
        dividerColor: Color(0xFFE1E1E1),
        colorUserTookExam: Colors.white,
        tabBarIndicatorColor: const Color(0xFF353282),
        colorSliderBanner: const Color(0xffF4F4F4),
        iconColor: Colors.white,
        widgetColor: Colors.black,
        widgetColor1: const Color(0xFFF2FBD7),
        colorBorder: const Color(0xFFFFFFFF),
        disableButtonColor: const Color(0xFF333333),
      );
    }
  }
