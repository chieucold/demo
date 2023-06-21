import 'package:common/common/color/common_color.dart';
import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';

InputDecoration get inputDecoration => getInputDecoration(16);
InputDecoration get inputDecorationNone => getInputDecorationNone();
InputDecoration get dateTimePickerDecoration => getInputDecoration(70);
InputDecoration get volumeBarDecoration =>
    getInputDecoration(70).copyWith(contentPadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 11));

InputDecoration getInputDecoration(double radius) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: CommonColor.colorInputBorderDefault),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: CoreColor.colorInputTextError),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: CommonColor.colorInputBorderDefault),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
  );
}

InputDecoration getInputPointDecoration(double radius) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: CommonColor.examTypeMarkInputBorderColor),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: CommonColor.examTypeMarkInputBorderColor),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: CommonColor.examTypeMarkInputBorderColor),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: CommonColor.examTypeMarkInputBorderColor),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
  );
}

InputDecoration getInputDecorationNone() {
  return const InputDecoration(
      border: InputBorder.none, errorBorder: InputBorder.none, enabledBorder: InputBorder.none);
}

InputBorder getInputBorderNone() {
  return  InputBorder.none;
}

class CheckboxSettings {
  static Color fillColor = const Color(0xff414B5B);
  static Color checkColor = Colors.white;
  static Color borderColor = const Color(0xff414B5B);
}

class VolumeBarThemeSettings {
  static Color backgroundColor = const Color(0xffEBECEE);
}
