import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/theme/custom_colors.dart';
import 'package:vitan_edu/core/theme/form_setting.dart';

ThemeData _getThemeData(BuildContext context) {
  return ThemeData(
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: CustomTheme.textColor,
          fontFamily: fontFamily,
        ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: fontFamily,
            )),
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

ThemeData _getThemeDataDark(BuildContext context) {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: CustomTheme.textColor,
          fontFamily: fontFamily,
        ),
    appBarTheme: AppBarTheme(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: fontFamily,
            )),
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

ThemeData getTheme(BuildContext context, bool isLight) {
  if (isLight) {
    return _getThemeData(context);
  } else {
    return _getThemeDataDark(context);
  }
}

// ignore: must_be_immutable
class DynamicTheme extends InheritedWidget {
  final BuildContext context;
  ThemeData? themeData;
  CustomColor? customColor;
  bool? isThemeLight;

  DynamicTheme(this.context, {Key? key, required Widget child, bool isThemeLight = true})
      : super(key: key, child: child) {
    themeData = getTheme(context, isThemeLight);
    customColor = getCustomColor(isThemeLight);
  }

  @override
  bool updateShouldNotify(DynamicTheme oldWidget) {
    print('updateShouldNotify');
    return true;
  }

  static DynamicTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DynamicTheme>();
  }
}
