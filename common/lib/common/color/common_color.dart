import 'package:core/common/color/core_color.dart';
import 'package:flutter/material.dart';

class CommonColor {
  CommonColor._internal();
  static Color colorLoadingShimmer = const Color(0xFFEEEEEE);
  static Color colorHighlightLoadingShimmer = const Color(0xFFFAFAFA);
  static Color textWhiteColor = Colors.white;
  static Color primaryColor = const Color(0xFF006600);
  static Color textColor = const Color(0xFF414B5B);
  static Color dialogBackgroundColor = const Color(0xfff0f3f8);
  static Color closeButton = const Color(0xFF95A2B8);
  static Color driverColor = const Color.fromRGBO(240, 242, 246, 1);
  static Color textColor1 = const Color.fromRGBO(169, 178, 192, 1);
  static Color textColor2 = const Color.fromRGBO(108, 80, 78, 1);
  static Color textColor3 = const Color.fromRGBO(124, 137, 157, 1);
  static Color textColor4 = const Color.fromRGBO(169, 178, 192, 1.0);
  static const Color textColor5 = Color(0xff1F8235);
  static const Color textColor6 = Color(0xffB2BAC8);
  static const Color textColor7 = Color(0xffDC8807);
  static const Color textColor8 = Color(0xff70747E);
  static const Color textColor9 = Color(0xff7AAD4F);
  static const Color textColor10 = Color(0xffCC9900);
  static const Color textColor11 = Color(0xff414B5B);
  static const Color textColor12 = Color(0xff888C94);
  static const Color textColor13 = Color(0xff404653);
  static const Color textColor14 = Color(0xff585D69);
  static const Color textColor15 = Color(0xff9FA3A9);
  static const Color textColor16 = Color(0xff91919F);
  static const Color textColor17 = Color(0xff718792);
  static const Color textColor18 = Color(0xffF48C06);
  static const Color textColor19 = Color(0xff718792);

  //appBar
  static const Color tabBarLearnIndicatorColor = Color(0xff7AAD4F);

  static double get appBarHeight => 90;
  static Color iconAppbar = Colors.white;
  static Color textAppbar = Colors.white;

  //border
  static const Color borderColor = Color(0xffECECEC);

  // Cricle
  static double get cricleRadiusSmall => 15;

  static double get cricleRadiusMedium => 17;

  static Color cricleBackgroundColor = const Color(0xFF414B5B);

  static Color colorHotEvent = const Color(0xFF659B48);

  static Color colorSubTitle = const Color(0xFF8794A8);

  //Modal
  static Color modalBackgroundColor = const Color(0xff161C2C).withOpacity(0.9);

  static Color dividerColor = const Color(0xFFC3CCDB);
  static Color get barrierColor => const Color(0xff161C2C).withOpacity(0.9);

  static List<BoxShadow> vhe10DropShadow = <BoxShadow>[
    BoxShadow(
      color: const Color(0xff000000).withOpacity(0.04),
      spreadRadius: 0,
      blurRadius: 1,
      offset: const Offset(0, 0),
    ),
    BoxShadow(
      color: const Color(0xff000000).withOpacity(0.06),
      spreadRadius: 0,
      blurRadius: 2,
      offset: const Offset(0, 0),
    ),
    BoxShadow(
      color: const Color(0xff000000).withOpacity(0.04),
      spreadRadius: 0,
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  static LinearGradient primaryLinearGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFF0D810D),
      Color(0xFF006600),
    ],
  );

  static LinearGradient hotNewsGradient = LinearGradient(
    begin: Alignment.bottomRight,
    stops: const <double>[0.1, 0.9],
    colors: <Color>[
      const Color(0xff000000).withOpacity(0.32),
      const Color(0xff000000).withOpacity(0.0),
    ],
  );

  static List<BoxShadow> listShadowMenuApp = <BoxShadow>[
    BoxShadow(
      offset: const Offset(0, 0),
      blurRadius: 1,
      color: const Color(0xff000000).withOpacity(0.04),
      spreadRadius: 0,
    ),
    BoxShadow(
      offset: const Offset(0, 2),
      blurRadius: 6,
      color: const Color(0xff000000).withOpacity(0.04),
      spreadRadius: 0,
    ),
    BoxShadow(
      offset: const Offset(0, 16),
      blurRadius: 24,
      color: const Color(0xff000000).withOpacity(0.06),
      spreadRadius: 0,
    )
  ];

  static const Color supperAppThemeColor = Color(0xff663300);
  static const Color guideAppThemeColor = Color(0xFF2E946F);
  static const Color borderLineCommentColor = Color(0xffD9DDE4);

  //bottomSheetColor
  static Color get borderRedDottedColor => const Color(0xff96344C);
  static LinearGradient dottedRedColor = const LinearGradient(
      begin: Alignment.topCenter, stops: <double>[0.1, 0.9], colors: <Color>[Color(0xff96344C), Color(0xffDB5273)]);

  static const Color blueDottedBorder = Color(0xff2783DD);
  static LinearGradient blueGradient = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xff4795E1),
    Color(0xff217FDC),
  ]);
  static const Color transparent = Colors.transparent;
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  //button
  static Color buttonAcceptBorderColor = const Color(0xff858D9A);
  static Color buttonBorderDefaultColor = const Color(0xff858D9A);

  static const Color filterHasDataColor = Color(0xffE8566B);
  static const Color tileLeadingColor = Color(0xff663300);

  //veo2
  static const Color veo2MemberColor = Color(0xff8794A8);
  static const Color veo2TookPlaceDateColor = Color(0xffBF3F4E);
  static const Color veo2UpcomingColor = Color(0xff006600);
  static const Color veo2TabBackgroundColor = Color(0xffE9ECF2);
  static const Color veo2CancelBorderColor = Color(0xff858D9A);
  static const Color veo2DividerColor = Color(0xffF2F4F6);
  static const Color requestBtnAcceptColor = Color(0xff006600);
  static const Color requestBtnDeniedColor = Color(0xff858D9A);

  //veo5
  static const Color veo5InviteTextColor = Color(0xff006600);
  static const Color veo5InfoTexColor = Color(0xff747688);
  static const Color veo5DescriptionColor = Color(0xff120D26);
  static const Color veo5ViewMoreColor = Color(0xff0099CC);
  static const Color veo5BorderColor = Color(0xffE2E8F2);

  //veo6
  static const Color veo6BorderColor = Color(0xffE2E7EF);
  static const Color veo6LabelTextColor = Color(0xffB2BAC8);
  static const Color veo6InviteColor = Color(0xff858D9A);
  static const Color veo6InviteBorderColor = Color(0xff858D9A);
  static const Color veo6DividerColor = Color(0xffF2F4F6);

  static const LinearGradient bottomRightButton = LinearGradient(
      begin: Alignment.centerLeft,
      stops: <double>[0.1, 0.9],
      colors: <Color>[Color.fromRGBO(13, 129, 13, 1), Color.fromRGBO(0, 102, 0, 1)]);

  // vsr
  static const Color borderSearchColor = Color(0xffE0E4E8);
  static const Color fillSearchColor = Color(0xffF0F3F5);
  static const Color textSearchColor = Color(0xff8794A8);
  static const Color backgroundTextSearch = Color(0xffEEEBE7);

  //vhe10
  static Color vhe10colorGreyDateJoin = const Color(0xFF8794A8);
  static Color vhe10colorBorderCard = const Color(0xFFDADEE5);

  static Color coreTextColor = const Color(0xFF414B5B);

  //vn
  static const Color titleAppbarColor = Color(0xffffffff);
  static const Color vnDateNewsColor = Color(0xff747688);
  static const Color vnDividerColor = Color(0xffDADEE5);
  static const Color vnDetailTitleColor = Color(0xff414B5B);
  static const Color vnLikeReactColor = Color(0xffD4496B);
  static const Color editCommentColor = Color(0xff6B7280);
  static const Color deleteCommentColor = Color(0xffED0131);
  static const Color vge8DividerColor = Color(0xffF2F4F6);

  static const Color vce5SearchTextColor = Color(0xff8794A8);
  static const Color vhe8_1SearchIconColor = Color(0xffB2BAC8);

  //vhs 9
  static const Color vhs9BackColor = Color(0xff414B5B);
  static const Color vhs9BottomBorder = Color(0xffE2E8F2);

  //padding default
  static EdgeInsets paddingBodyDefault = EdgeInsets.symmetric(horizontal: paddingDefault);

  //Padding và margin
  static double get paddingDefault => CoreColor.paddingDefault;

  static const Color starColor = Color(0xffF6BB22);
  static const Color freeCourseBloc = Color(0xffB4D09C);

  //vge3
  static const Color vge3DateSelectedColor = Color(0xff0099CC);
  static const Color vge3DateUnSelectedColor = Color(0xffEBECEE);

  //vce10
  static const Color vce10LabelColor = Color(0xff858D9A);

  //Fieldset
  static Color fieldSetBorderColor = const Color(0xFFD5DBE2);
  static Color fieldSetLegendColor = const Color(0xFFB2BAC8);
  static const Color validateColor = Color(0xffED331A);

  static Color colorInputBorderDefault = const Color(0xffD5DBE2);
  static const Color examTypeMarkInputBorderColor = Color(0xffBF3F4E);
}
