import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/theme/form_setting.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: CustomTheme.textColor,
          fontFamily: fontFamily,
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: CustomTheme.appBackgroundColor,
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: fontFamily,
          ),
    ),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    iconTheme: IconTheme.of(context).copyWith(color: CustomTheme.textColor),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    tabBarTheme: TabBarTheme(
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: CustomTheme.tabBarIndicatorColor, width: 2),
      ),
      labelStyle: textStyleBodySmall.copyWith(fontWeight: FontWeight.w600),
      labelColor: CustomTheme.textColor,
      unselectedLabelColor: CustomTheme.textColor,
      unselectedLabelStyle: textStyleBodySmall,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: inputDecoration.border,
      enabledBorder: inputDecoration.enabledBorder,
      errorBorder: inputDecoration.errorBorder,
      errorStyle: TextStyle(color: CoreColor.colorInputTextError),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(CheckboxSettings.checkColor),
      fillColor: MaterialStateProperty.all(CheckboxSettings.fillColor),
      side: BorderSide(color: CheckboxSettings.borderColor, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}

// Dark Theme
// ThemeData darkThemeData(BuildContext context) {
//   return ThemeData.dark().copyWith(
//     primaryColor: kPrimaryColor,
//     scaffoldBackgroundColor: Color(0xFF0D0C0E),
//     appBarTheme: appBarTheme,
//     backgroundColor: kBackgroundDarkColor,
//     iconTheme: IconThemeData(color: kPrimaryIconDarkColor),
//   );
// }
