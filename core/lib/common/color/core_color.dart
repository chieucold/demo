import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color kPrimaryVitanColor = Color(0xff663300);
const Color kPrimaryExamColor = Color(0xFF006600);
const Color kPrimaryGuideColor = Color(0xFF2E946F);
const Color kPrimaryLearnColor = Color(0xff7AAD4F);
const Color kPrimaryContestColor = Color(0xff4FBADE);
const Color kPrimaryEventColor = Color(0xff660066);
const Color kTextColor = Color(0xFF414B5B); // màu chữ chủ đạo
const Color kTextWhiteColor = Colors.white; //Sử dụng trên nền xanh
const Color kDivider = Color(0xFFC3CCDB);

class CoreColor {
  // static String? fontFamily = "Nunito";

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
  static Color iconColor = const Color.fromRGBO(57, 66, 80, 1);

  //appBar
  static double get appBarHeight => 90;
  static Color iconAppbar = Colors.white;
  static Color textAppbar = Colors.white;

  // Cricle
  static double get cricleRadiusSmall => 15;

  static double get cricleRadiusMedium => 17;

  static Color cricleBackgroundColor = const Color(0xFF414B5B);

  //Modal
  static Color modalBackgroundColor = const Color(0xff161C2C).withOpacity(0.9);

  static Color dividerColor = const Color(0xFFC3CCDB);
  static Color get barrierColor => const Color(0xff161C2C).withOpacity(0.9);

  static Color borderDefault = const Color.fromRGBO(226, 231, 239, 1.0);

  static const LinearGradient examLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFF0D810D),
      Color(0xFF006600),
    ],
  );

  static const LinearGradient vitanLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff663300),
      Color(0xff885C43),
    ],
  );

  static const LinearGradient guideLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFF2E946F),
      Color(0xFF147B56),
    ],
  );

  static const LinearGradient learnLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff7AAD4F),
      Color(0xff7AAD4F),
    ],
  );


  static const LinearGradient contestLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff0099CC),
      Color(0xff0099CC),
    ],
  );

  static const LinearGradient admissionsLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFF45BDE5),
      Color(0xFF45BDE5),
    ],
  );

  static const LinearGradient trainingLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFF2E946F),
      Color(0xFF2E946F),
    ],
  );

  static const LinearGradient jobLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFF0099CC),
      Color(0xFF0099CC),
    ],
  );

  static const LinearGradient netLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFFDDB526),
      Color(0xFFDDB526),
    ],
  );

  static const LinearGradient toolKitGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFFCC9900),
      Color(0xFFCC9900),
    ],
  );

  static const LinearGradient eventLinearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xff660066),
      Color(0xff660066),
    ],
  );

  static const LinearGradient testGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      Colors.white10,
      Colors.white,
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
  static const Color mppNotiCartColor = Color(0xffE8566B);
  static const Color supperAppThemeColor = Color(0xff663300);
  static const Color guideAppThemeColor = Color(0xFF2E946F);
  static const Color learnAppThemeColor = Color(0xff7AAD4F);
  static const Color borderLineCommentColor = Color(0xffD9DDE4);

  static const Color priceColor = Color(0xffCC9900);
  static const Color vde2_2BorderColor = Color(0xffE2E7EF);

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
  static const Color subtitleColor = Color(0xff545871);

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
  static const Color vhe8_1CategoryCountColor = Color(0xffE5A80A);

  //vn
  static const Color titleAppbarColor = Color(0xffffffff);
  static const Color vnDateNewsColor = Color(0xff747688);
  static const Color vnDividerColor = Color(0xffDADEE5);
  static const Color vnDetailTitleColor = Color(0xff414B5B);
  static const Color vnLikeReactColor = Color(0xffD4496B);
  static const Color editCommentColor = Color(0xff6B7280);
  static const Color deleteCommentColor = Color(0xffED0131);

  //vhs 9
  static const Color vhs9BackColor = Color(0xff414B5B);
  static const Color vhs9BottomBorder = Color(0xffE2E8F2);
  static Color colorSubTitle = const Color(0xFF8794A8);

  //padding default
  static EdgeInsets paddingBodyDefault = EdgeInsets.symmetric(horizontal: paddingDefault);

  //Padding và margin
  static double get paddingDefault => 24.w;
  static double get paddingBottom => 80.w;

  static Color colorInputTextError = Colors.red;
  static Color backgroundMenuBarColor = const Color(0xffF0F3F8);
}
