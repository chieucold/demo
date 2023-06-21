import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// const Color kPrimaryColor = Color(0xFF006600); // màu xanh chủ đạo xử dụng nhiều
// const Color kTextColor = Color(0xFF414B5B); // màu chữ chủ đạo
// const Color kTextWhiteColor = Colors.white; //Sử dụng trên nền xanh
// const Color kDivider = Color(0xFFC3CCDB);

class CustomTheme {
  // màu sắc
  static Color appBackgroundColor = kTextWhiteColor;
  static Color primaryColor = kPrimaryVitanColor;
  static Color textColor = kTextColor;
  static Color driverColor = const Color.fromRGBO(240, 242, 246, 1);
  static Color textColor1 = const Color.fromRGBO(169, 178, 192, 1);
  static Color textColor2 = const Color.fromRGBO(108, 80, 78, 1);
  static Color textColor3 = const Color.fromRGBO(124, 137, 157, 1);
  static Color textColor4 = const Color.fromRGBO(169, 178, 192, 1.0);
  static const Color textColor5 = Color(0xff1F8235);
  static const Color textColor6 = Color(0xffB2BAC8);
  static const Color textColor7 = Color(0xffDC8807);
  static const Color colorUserTookExam = textColor5; //VDE6
  static const Color colorUserTookExamBackground = Color(0xffF0F4F9); //VDE6
  static const Color colorBackgroundTabBarApp = Color(0xffE5EAF0);
  static const Color transparent = Colors.transparent;

  static const Color supperAppThemeColor = Color(0xff663300);

  static LinearGradient primarySupperAppLinearGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
    colors: <Color>[
      Color(0xff663300),
      Color(0xff885C43),
    ],
  );

  static LinearGradient primaryLinearGradient = const LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      Color(0xFF0D810D),
      Color(0xFF006600),
    ],
  );

  static const Color tabBarIndicatorColor = Color(0xff006600);

  static const Color borderLineCommentColor = Color(0xffD9DDE4);

  static Color colorSliderBanner = const Color.fromRGBO(101, 153, 73, 1);
  static Color iconColor = const Color.fromRGBO(57, 66, 80, 1);
  static Color widgetColor = const Color.fromRGBO(239, 233, 232, 1);
  static Color widgetColor1 = const Color.fromRGBO(234, 235, 238, 1);
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color colorBorder = const Color.fromRGBO(212, 217, 227, 1);
  static Color colorBorder1 = const Color.fromRGBO(90, 144, 69, 1);
  static const Color colorBorder2 = Color(0xffD6DDE9);
  static const Color colorBorder3 = Color(0xffB2BAC8);
  static const Color colorBackground = Color(0xffEBECEE);

  static Color colorInputBorderDefault = const Color(0xffD5DBE2);

  //vhe8
  static Color vhe8SlideControllerColorActive = const Color(0xff70A44B);
  static Color vhe8DividerColor = const Color(0xFFF2F4F7);
  static Color vhe8CategoryItemBorderColor = const Color(0xffD6DCE5);
  static Color vhe8CategoryItemPlusColor = const Color(0xffD8DDE7);
  static Color vhe8CategoryItemPlusTextColor = const Color(0xffD8DDE7);

  static Color colorBackgroundContainer = const Color.fromRGBO(225, 236, 230, 1);
  static Color textWhiteColor = kTextWhiteColor;
  static Color dialogBackgroundColor = const Color(0xfff0f3f8); //VHE.9
  static Color iconDialogColor = const Color(0xFF76808F); //VHE.9;
  static Color dividerColor = const Color(0xFFC3CCDB); //VHE.9
  static Color closeButton = const Color(0xFF95A2B8); //VHE.9;

  static Color borderDefault = const Color.fromRGBO(226, 231, 239, 1.0);
  static Color colorsGrey = const Color.fromRGBO(178, 186, 200, 1);
  static Color colorCheckCircle = const Color.fromRGBO(58, 150, 31, 1);
  static Color colorSubTitle = const Color(0xFF8794A8);
  static Color colorIconsCircle = const Color.fromRGBO(208, 217, 234, 1);
  static Color colorFontContainer = const Color.fromRGBO(133, 141, 154, 1.0);
  static Color colorSliderPaggingActive = const Color(0xfff0f8341);
  static Color colorSliderPagging = const Color(0xffd9e1ee);
  static Color colorLoadingShimmer = const Color(0xFFEEEEEE);
  static Color colorHighlightLoadingShimmer = const Color(0xFFFAFAFA);
  static LinearGradient primaryLinearColor = const LinearGradient(
      begin: Alignment.centerLeft,
      stops: <double>[0.1, 0.9],
      colors: <Color>[Color.fromRGBO(13, 129, 13, 1), Color.fromRGBO(0, 102, 0, 1)]);
  static Color colorTag = const Color.fromRGBO(229, 234, 240, 1.0);
  static const Color colorIconLike = Color(0xffEA4C68);
  static LinearGradient linearColor1 = const LinearGradient(begin: Alignment.centerLeft, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xffE5A80A),
    Color(0xffDB8606),
  ]);

  //vhe10
  static Color vhe10colorGreyDateJoin = const Color(0xFF8794A8);
  static Color vhe10colorBorderCard = const Color(0xFFDADEE5);
  //vhe11
  static Color vhe11ColorTextCompleteExam = const Color(0xFF717F95);
  //Vhe12
  static Color vhe12DividerColor = const Color(0xFFF2F4F6);
//VDE5
  static LinearGradient linearRankingTop1 = const LinearGradient(
      begin: Alignment.bottomCenter,
      stops: <double>[0.1, 0.9],
      colors: <Color>[Color(0xffFDCE54), Color(0xffEEA416)]); // Vde5

  static Color colorTimeCountDown = const Color(0xFFBF3F4E);

  static LinearGradient linearRankingTop3 = const LinearGradient(
      begin: Alignment.bottomCenter,
      stops: <double>[0.1, 0.9],
      colors: <Color>[Color(0xffFFD6B0), Color(0xffD5965C)]); //
  static LinearGradient linearRankingTop2 = const LinearGradient(
      begin: Alignment.bottomCenter,
      stops: <double>[0.1, 0.9],
      colors: <Color>[Color(0xffD9C7DE), Color(0xffB491BD)]); // Vde5

  static LinearGradient linearRedColor = const LinearGradient(colors: <Color>[Color(0xFFD93872), Color(0xffC11C3A)]);

  static Color colorPoint = const Color(0xFFC11C3A); // VDE5
  static Color colore5eaf0 = const Color(0xFFE5EAF0); // VDE5
  static Color colorbfcad7 = const Color(0xFFBFCAD7); // VDE5

  static Color colorExamCommentRating = const Color(0xffDDB526); // VDE5
  static Color colorb2bac8 = const Color(0xFFB2BAC8);

  //padding default
  static EdgeInsets paddingBodyDefault = EdgeInsets.symmetric(horizontal: paddingDefault);

  // font chữ
  // static String? fontFamily = "Nunito";
  // static const String fontSVNEvery = "SVN-Every Movie Every Night";

  //Padding và margin
  static double get paddingDefault => CoreColor.paddingDefault;

  static double get buttonDefaultHeight => 75;

  // Cricle
  static double get cricleRadiusSmall => 15;

  static double get cricleRadiusMedium => 17;

  static Color cricleBackgroundColor = const Color(0xFF414B5B);

  //appBar
  static double get appBarHeight => 90;
  static Color iconAppbar = Colors.white;
  static Color textAppbar = Colors.white;

  //Divider
  static Color get dividerDefaultColor => colore5eaf0;

  static Color dividerSecondColor = const Color(0xFFF2F4F7); //VDE5

  //Fieldset
  static Color fieldSetBorderColor = const Color(0xFFD5DBE2);
  static Color fieldSetLegendColor = const Color(0xFFB2BAC8);

  //Modal
  static Color modalBackgroundColor = const Color(0xff161C2C);

  //exam success
  static Color examSuccessPointBorderColor = const Color(0xff3A983A);

  //button
  static Color buttonAcceptBorderColor = const Color(0xff858D9A);
  static Color get appBarDoExamBackground => colore5eaf0;
  static Color buttonBorderDefaultColor = const Color(0xff858D9A);

  //appBar
  static Color appBarDoExamBorderBottomActive = const Color(0xff006600);

  //exam type
  static Color answerBorderColor = const Color(0xffB2BAC8);
  static Color answerActiveBackgroundColor = const Color(0xffDDB526);
  static Color get answerActiveColor => Colors.white;

  //validate error color

  static const Color validateColor = Color(0xffED331A);

  static void setDefaultTheme() {
    primaryColor = kPrimaryVitanColor;
    textColor = kTextColor;
    textWhiteColor = kTextWhiteColor;
  }

  static void setDarkTheme() {
    primaryColor = Colors.red;
  }

  //VDE1
  static const Color propertyBackgroundColor = Color(0xffEBECEE);
  static const Color filterHasDataColor = Color(0xffE8566B);
  static LinearGradient vde1ExamSetGradient = const LinearGradient(
      begin: Alignment.centerLeft, stops: <double>[0.1, 0.9], colors: <Color>[Color(0xffE6A80A), Color(0xffDB8606)]);
  static const Color vde1TopSelectedColor = Color(0xff006600);
  static const Color vde1BorderColor = Color(0xffE2E7EF);

  static const Color vde1OldPriceColor = Color(0xffDC8807);

  //VDE2.1-Bộ lọc tổng
  static const Color textColorSelected = Color(0xff0099CC);
  static const Color vde2BackgroundColor = Color(0xffF2F4F6);
  static const LinearGradient bottomRightButton = LinearGradient(
      begin: Alignment.centerLeft,
      stops: <double>[0.1, 0.9],
      colors: <Color>[Color.fromRGBO(13, 129, 13, 1), Color.fromRGBO(0, 102, 0, 1)]);
  static const Color vde2BottomBorder = Color(0xffE2E8F2);
  static const Color vde2_2BorderColor = Color(0xffE2E7EF);
  //VDE4 - Danh sach de trong bo de
  static const Color backgroundColor = Color(0xffF2F4F6);

  /* VDE.12 - Làm đề thi (upload file lên) */
  static Color vde12ExamFileTimerColor = const Color(0xffC11C3A);
  static Color vde12BottomBorderColor = const Color(0xffE2E8F2);
  static const Color vde12CollapseExpandBackgroundColor = Color(0xffEAEDF2);
  static const Color vde12AllQuestionTabBorderColor = Color(0xffB2BAC8);
  static const Color vde12QuestionControlBackground = Color(0xffEAEDF2);
  static const Color vde12AllQuestionTabBackground = Color(0xffD2D8E0);
  static const Color vde12QuestionIndexCheckLateBackground = Color(0xff414B5B);
  static const Color vde12AllQuestionActiveBackgroundColor = Color(0xff414B5B);

  // VDE.13
  static const Color vde13CorrectAnswer = Color(0xff4DA234);
  static const Color vde13InCorrectAnswer = Color(0xffBF3F4E);

  //exam answer
  static Color examAnswerChooseColor = const Color(0xffDDB526);
  static Color get barrierColor => const Color(0xff161C2C).withOpacity(0.9);
  //vde16
  static Color get vde16BorderColor => const Color(0xff96344C);
  static LinearGradient vde16BackgroundGradient = const LinearGradient(
      begin: Alignment.topCenter, stops: <double>[0.1, 0.9], colors: <Color>[Color(0xff96344C), Color(0xffDB5273)]);

  //VCE2
  static LinearGradient vce2DurationButtonColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xffECB854),
    Color(0xffE5A01B),
  ]);
  static const Color vce2DoterColor = Color(0xffE5A01B);
  static const Color vce2DurationBackgroundColor = Color(0xffFDF4DA);
  static const Color vce2ButtonRightColor = Color(0xffB2BAC8);
  static const Color vce2IconColor = Color(0xffE5A80A);
  static const Color vce2AllSites = Color(0xffEBECEE);
  static const Color vce2CategoryBackground = Color(0xffEBECEE);
  static const Color vce2CategoryIconColor = Color(0xffA9AEB5);
  static const Color vce2ContinueButtonBackground = Color(0xff0099CC);

  //VCE_AD_1
  static const Color vceAd1BorderColor = Color(0xffB2BAC8);
  static LinearGradient vceAd1DirectGradientColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xff4795E1),
    Color(0xff217FDC),
  ]);
  static LinearGradient vceAd1RoundGradientColor = const LinearGradient(
    begin: Alignment.topCenter,
    stops: <double>[
      0.1,
      0.9,
    ],
    colors: <Color>[
      Color(0xffECB854),
      Color(0xffE5A01B),
    ],
  );

  //VCE3 - Tạo phòng đấu
  static const Color vce3TextColor = Color(0xff858D9A);
  static const Color vce3BorderColor = Color(0xffD5DBE2);
  static const Color vce3BackgroundColor = Color(0xffF2F4F6);
  static const Color vce3ButtonBackground = Color(0xffEBECEE);
  static const Color vce3BottomBorder = Color(0xffE2E8F2);
  static const Color vce3ValidateColor = Color(0xffED331A);
  static const Color vce3DateTimeBackgroundColor = Color(0xffF2F4F8);

  //VCE3 - Rounds
  static const Color vce3ADIndicatorButtonColor = Color(0xffB2BAC8);
  static const Color vce3ADBorderButtonColor = Color(0xffE2E7EF);
  static const Color vce3ADBackgroundButtonColor = Color(0xffECEFF3);

  //VCE4 - Chi tiết phòng đấu
  static const Color vce4TopBorderColor = Color(0xffB2BAC8);
  static const Color vce4InviteColor = Color(0xff228B22);
  static const Color vce4ShareBorder = Color(0xff8794A8);
  static const Color vce4InviteBorderColor = Color(0xff41A941);
  static const Color vce4InviteBackgroundColor = Color(0xffEDF5ED);
  static const Color vce4FullBackgroundColor = Color(0xffB8BCC1);
  static const Color vce4ChampionTextColor = Color(0xff7E6A5E);
  static const Color vce4BackgroundColor = Color(0xffF2F4F6);
  static const Color vce4BorderBottomColor = Color(0xffEAEDF2);
  static const Color vce4BackgroundBottomColor = Color(0xffE2E8F2);
  static const Color vce4TimeTextColor = Color(0xff289728);
  static const Color vce4CompetingColor = Color(0xffDDB526);
  static const Color vce4ContinueBorderColor = Color(0xff17ABDC);

  //vce4 -9
  static const Color vce4_9CompetitionDone = Color(0xff659B48);
  static const Color vce4_9Competing = Color(0xffCC9900);
  static const Color vce4_9NotCompetition = Color(0xffB2BAC8);
  static const Color vce4_9RankBackgroundColor = Color(0xffE5EAF0);
  static const Color vce4_9RankBorderColor = Color(0xffBFCAD7);
  static const Color vce4_9ScoreColor = Color(0xffC11C3A);
  static const Color vce4_9ScoreBackgroundColor = Color(0xffE2E7EF);

  //VCE5 -
  static const Color vce5InvitedColor = Color(0xffEBECEE);
  static const Color vce5BorderButtonColor = Color(0xff858D9A);
  static const Color vce5BackgroundColor = Color(0xffF2F4F6);
  static const Color vce5SearchIconColor = Color(0xffB2BAC8);
  static const Color vce5SearchTextColor = Color(0xff8794A8);
  static const Color vce5SearchBorderColor = Color(0xffE2E7EF);

  //vce5_2
  static const Color vce5_2BorderColor = Color(0xffE1E6EF);
  static LinearGradient vce5_2ShareLinearGradient = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xff5F71D0),
    Color(0xff394DB7),
  ]);
  static LinearGradient vce5_2SendLinearGradient = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xffECB854),
    Color(0xffE5A01B),
  ]);

  //VCE6
  static const Color vce6BorderColor = Color(0xff2783DD);
  static LinearGradient vce6ButtonColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xff4795E1),
    Color(0xff217FDC),
  ]);
  static const Color vce6BottomButtonColor = Color(0xff858D9A);
  static LinearGradient vce6ButtonBottomColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xffffffff),
    Color(0xffffffff),
  ]);

  //vce8
  static const Color vce8TopBorderColor = Color(0xffE5EAF0);
  static const Color vce8DoneColor = Color(0xffB2BAC8);
  static const Color vce8CorrectColor = Color(0xff4DA134);
  static const Color vce8WrongColor = Color(0xffBF3F4E);
  static const Color vce8DividerColor = Color(0xffF2F4F6);
  static const Color vce8UserRankBorderColor = Color(0xffBFCAD7);
  static const Color vce8PointColor = Color(0xffC11C3A);
  static LinearGradient vce8PointLinearColor =
      const LinearGradient(colors: <Color>[Color(0xFFD93872), Color(0xffC11C3A)]);

  static LinearGradient vce8LinearRankingTop1 = const LinearGradient(
    begin: Alignment.bottomCenter,
    stops: <double>[0.1, 0.9],
    colors: <Color>[
      Color(0xffFDCE54),
      Color(0xffEEA416),
    ],
  );

  static LinearGradient vce8LinearRankingTop3 = const LinearGradient(
    begin: Alignment.bottomCenter,
    stops: <double>[0.1, 0.9],
    colors: <Color>[
      Color(0xffFFD6B0),
      Color(0xffD5965C),
    ],
  );

  static LinearGradient vce8LinearRankingTop2 = const LinearGradient(
    begin: Alignment.bottomCenter,
    stops: <double>[0.1, 0.9],
    colors: <Color>[
      Color(0xffD9C7DE),
      Color(0xffB491BD),
    ],
  );

  //vce9 - competition_complete_screen
  static const Color vce9PointBorderColor = Color(0xff3A983A);
  static const Color vce9PointColor = Color(0xffC11C3A);
  static const String vce9FontSVNEvery = "SVN-Every Movie Every Night";
  static LinearGradient vce9ButtonBottomColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xffffffff),
    Color(0xffffffff),
  ]);

  //vce10
  static const Color vce10TopBorderColor = Color(0xffE2E7EF);
  //static const Color vce10TopSelectedColor = Color(0xff006600);
  static const Color vce10PointColor = Color(0xffC11C3A);
  static const Color vce10RoundCompetitionColor = Color(0xff0099CC);
  static const Color vce10NotComingColor = Color(0xffCC9900);
  static const Color vce10DateBorderColor = Color(0xffD5DBE2);
  static const Color vce10LabelColor = Color(0xff858D9A);
  static const Color vce10CalendarColor = Color(0xffB2BAC8);
  static const Color vce10CancelFilterColor = Color(0xffEBECEE);
  static const Color vce10DividerColor = Color(0xffF2F4F6);
  static const Color vce10CompetitionLateColor = Color(0xffECEFF3);
  static const Color vce10RankBackgroundColor = Color(0xffE5EAF0);

  //CompetitionInfoWidget
  static const Color durationColor = Color(0xff289728);
  static const Color roundDurationColor = Color(0xff8794A8);
  static const Color roundCompetitionColor = Color(0xff0099CC);
  static const Color categoryBorderColor = Color(0xffB2BAC8);
  static const Color ciwPropertyBackgroundColor = Color(0xffEBECEE);

  //vce11
  static const Color vce11BottomBorder = Color(0xffE2E8F2);

  //vce14
  static const Color vce14LabelColor = Color(0xff659B48);

  //vce15
  static const Color vce15IndicatorColor = Color(0xff659B48);
  static const Color vce15IndicatorColor2 = Color(0xffE2E7EF);

  //vce7
  static const Color vce7BackgroundColor = Color(0xffE2E7EF);
  static const Color vce7TimelineColor = Color(0xff289728);
  static const Color vce7BorderColor = Color(0xffB2BAC8);
  static const Color vce7QuestionBorder = Color(0xffB2BAC8);
  static const Color vce7RankColor = Color(0xffE5EAF0);
  static const Color vce7RankBorderColor = Color(0xffBFCAD7);
  static const Color vce7BottomBorderColor = Color(0xffE2E8F2);
  static const Color vce7DividerColor = Color(0xffF2F4F6);

  //vge
  static const Color vgeGreyColor = Color(0xff8794A8);
  static const Color vgeDividerColor = Color(0xffF2F4F6);
  static const Color vgeDividerLineColor = Color(0xffEAEDF2);
  static const Color vgeTabBarColor = Color(0xffE5EAF0);
  static const Color vgeScoreColor = Color(0xffC11C3A);
  static const Color vgeGreyDarkColor = Color(0xff8794A8);
  static const Color vgeTextDarkColor = Color(0xff414B5B);

  // vge1
  static const Color vge1VerifiedColor = Color(0xff289728);
  static const Color vge1NewGroupColor = Color(0xff659B48);
  static const Color vge1FloatingButtonColor = Color(0xff414B5B);
  static const Color vge1DividerColor = Color(0xffF2F4F6);
  static const Color vge1IconMoreColor = Color(0xffB2BAC8);
  static const Color vge1ExamWaitingMarkColor = Color(0xff9D58B0);

  //vge2
  static const Color vge2NotExpiredDateColor = Color(0xff0099CC);
  static const Color vge2GreyColor = Color(0xffB2BAC8);
  static const Color vge2TimeCompleteColor = Color(0xff8794A8);
  static const Color vge3SwitchColor = Color(0xff8C7263);

  //vge3
  static const Color vge3DateSelectedColor = Color(0xff0099CC);
  static const Color vge3DateUnSelectedColor = Color(0xffEBECEE);
  static const Color vge3TextDateUnSelectedColor = Color(0xff414B5B);
  static const Color vge3TextListScoreColor = Color(0xff8794A8);
  static const Color vge3DottedBorderInvite = Color(0xFF41A941);
  static const Color vge3DottedBorderShare = Color(0xFF8794A8);
  //vg4
  static const Color vge4IconGreyColor = Color(0xffD1D6DE);
  static const Color vge4IconMoreGreyColor = Color(0xffB2BAC8);
  //vge5
  static const Color vge5StatusUnSubmitColor = Color(0xffB2BAC8);
  static const Color vge5BackgroundCommentColor = Color(0xffF5F7F9);
  static const Color vge5BorderCommentColor = Color(0xffE2E7EF);
  //vge6
  static const Color vge6FloatingButtonColor = Color(0xff414B5B);
  static const Color vge6HeaderInfoExamColor = Color(0xffEDEEF0);
  static const Color vge6TextInfoExamColor = Color(0xff414B5B);
  static const Color vge6BorderInfoExamColor = Color(0xffE1E6EF);
  static const Color vge6AmountInfoExamColor = Color(0xff9D58B0);
  static const Color vge6BorderButtonMarkColor = Color(0xff858D9A);
  static const Color vge6BackgroundIndexColor = Color(0xffE5EAF0);
  static const Color vge6BorderButtonIndexColor = Color(0xffBFCAD7);
  static const Color vge6IconCalenderColor = Color(0xff414B5B);
  static const Color vge6IconOptionDateColor = Color(0xffEBECEE);
  static const Color vge6UnSubmitColor = Color(0xffBF3F4E);
  static const Color vge6CheckMarkDoneColor = Color(0xff3A961F);

  //Dạng bài kiểm tra
  static const Color numberQuestionBorder = Color(0xffB2BAC8);
  static const Color numberQuestionBackground = Color(0xffD2D8E0);
  static const Color questionTypeColor = Color(0xff8794A8);
  static const Color switchTextColor = Color(0xff436BAC);
  static const Color switchBackgroundColor = Color(0xffE9ECF2);
  static const Color questionContentBorder = Color(0xffD1D6DE);
  static const Color normalAnswerTextColor = Color(0xffC68200);
  static const Color normalAnswerBorderColor = Color(0xffDDB526);
  static const Color normalAnswerBackgroundColor = Color(0xffFFF9E4);
  static const Color correctAnswerTextColor = Color(0xff388321);
  static const Color correctAnswerBorderColor = Color(0xff4DA134);
  static const Color correctAnswerBackgroundColor = Color(0xffEBF8E7);
  static const Color correctAnswerIndexBackgroundColor = Color(0xff4DA234); // Dùng cho số khi trả lời đúng
  static const Color incorrectAnswerTextColor = Color(0xffBF3F4E);
  static const Color incorrectAnswerBackgroundColor = Color(0xffFFF7F8);
  static const Color allAnswerBorderColor = Color(0xffD1D6DE); //border
  static const Color allAnswerBackgroundColor = Color(0xffECEFF3);
  static const Color explainNumberColor = Color(0xffE5A80A);
  static const Color chooseTextColor = Color(0xff0099CC);
  static const Color choosePlusColor = Color(0xff17ABDC);
  static const Color chooseBackgroundColor = Color(0xffE7F9FF);
  static const Color checkLaterColor = Color(0xffB2BAC8);
  static const Color multiChoiceTextColor = Color(0xffA98108);
  static const Color multiChoiceBackgroundColor = Color(0xffF3E6C4);
  static const Color explainAnswerColor = Color(0xffE5A80A);
  static const Color fillBackgroundColor = Color(0xffEBECEE);
  static const Color fillAnswerBackgroundColor = Color(0xffECEFF3);
  static const Color fillAnswerBorderColor = Color(0xffB2BAC8);
  static const Color fillAnswerActiveBackgroundColor = Color(0xffFFF9E4);
  static const Color fillAnswerActiveBorderColor = Color(0xffDDB526);
  static const Color answerDisableTextColor = Color(0xffB2BAC8);

  // Dạng tự luận
  static const Color examTypeEssayAnswerBorderColor = Color(0xffD5DBE2);
  static const Color examTypeEssayAnswerTextColor = Color(0xffD1D6DE);
  static const Color examTypeMarkContainerColor = Color(0xffF5F7F9);
  static const Color examTypeMarkContainerBorderColor = Color(0xffD5DBE2);
  static const Color examTypeMarkInputBorderColor = Color(0xffBF3F4E);
  static const Color examTypeMarkInputBackgroundColor = Color(0xffFFFFFF);

  // Dạng sắp xếp thành câu hoàn chỉnh
  static const Color examTypeCompleteSentenceDottedColor = Color(0xff9EA8B7);
  static const Color examTypeCompleteSentenceSelectedBackgroundColor = Color(0xffE7E9ED);
  static const Color examTypeCompleteQuestionDottedColor = Color(0xff9EA8B7);
  static const Color examTypeCompleteSentenceAnswerTextColor = Color(0xff9EA8B7);

  //vfe5, 5.1
  static const Color vfe5EditBorder = Color(0xff8794A8);
  static const Color vfe5ImageBorder = Color(0xffE2E7EF);
  static const Color vfe5_1IconBorderColor = Color(0xff2783DD);
  static LinearGradient vfe5_1IconBackgroundColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xff4795E1),
    Color(0xff217FDC),
  ]);

  //vfe6:
  static const Color vfe6CurrentVersionColor = Color(0xff7AAD4F);
  static const Color vfe6EditedColor = Color(0xff8794A8);
  static const Color vfe6DividerColor = Color(0xffF2F4F6);
  static const Color vfe6TickColor = Color(0xff5AA6FF);

  //vfe7
  static const Color vfe7DividerColor = Color(0xffF2F4F6);
  static const Color vfe7MyExplainColor = Color(0xff7AAD4F);
  static const Color vfe7ExpandTextColor = Color(0xff436BAC);
  static const Color vfe7ContributeTextColor = Color(0xff8794A8);
  static const Color vfe7LikeBackgroundColor = Color(0xff0082CC);
  static const Color vfe7DisLikeTextColor = Color(0xffB2BAC8);
  static const Color vfe7BottomBorderColor = Color(0xffE2E8F2);
  static const Color vfe7ReactionBorderColor = Color(0xff858D9A);

  //vge7
  static const Color vge7TabBorderColor = Color(0xff006600);
  static const Color vge7TabBackGroundColor = Color(0xffE5EAF0);
  static const Color vge7DateTimeBorderColor = Color(0xffD5DBE2);
  static const Color vge7DateTimeLabelColor = Color(0xff858D9A);
  static const Color vge7UserAssignedBackgroundColor = Color(0xffEDEEF0);
  static const Color vge7UserAssignedBorderColor = Color(0xffE1E6EF);
  static const Color vge7DeadlineBackgroundColor = Color(0xffB2BAC8);
  static const Color vge7NumberExerciseBackgroundColor = Color(0xff9D58B0);
  static const Color vge7WaitScoreTextColor = Color(0xff717F95);
  static const Color vge7DividerColor = Color(0xffF2F4F6);

  //vge8
  static const Color vge8OtherGroupBorderColor = Color(0xff858D9A);
  static const Color vge8OtherGroupBackgroundColor = Color(0xffE5EAF0);
  static const Color vge8DividerColor = Color(0xffF2F4F6);
  static const Color vge8FilterTextColor = Color(0xff8794A8);
  static const Color vge8_1NumberExamBackgroundColor = Color(0xffE4AD24);
  static const Color vge8_1ExamAssignTextColor = Color(0xff717F95);
  static const Color vge8_2DateLaterBackgroundColor = Color(0xffEBECEE);
  static const Color vge8_2DateLaterSelectedColor = Color(0xff0099CC);
  static const Color vge8_2BottomBorderColor = Color(0xffE2E8F2);

  //vge9
  static const Color vge9DetailTextColor = Color(0xff8794A8);
  static const Color vge9AvatarBackgroundColor = Color(0xffE5EAF0);
  static const Color vge9EditBorderColor = Color(0xffE2E7EF);
  static const Color vge9LabelTextColor = Color(0xff858D9A);
  static const Color vge9TextFieldBorderColor = Color(0xffD5DBE2);
  static const Color vge9BottomBorderColor = Color(0xffE2E8F2);
  static const Color vge9_1InvitedBackgroundColor = Color(0xffEBECEE);
  static const Color vge9_1InviteBorderColor = Color(0xff858D9A);
  static const Color vge9_1InvitedTextColor = Color(0xff868D98);
  static const Color vge9_1SearchBorderColor = Color(0xffE2E7EF);
  static const Color vge9DividerColor = Color(0xffF2F4F6);
  static const Color vge9_2SwitchBackgroundColor = Color(0xffE5EAF0);
  static const Color vge9_2CreateNewColor = Color(0xff659B48);
  static const Color vge9_2ExamTextColor = Color(0xff8794A8);
  static const Color vge9_2ExamToDoTextColor = Color(0xffE4AD24);
  static const Color vge9_2ExamToGradeTextColor = Color(0xff9D58B0);
  static const Color vge9_2CreateSuccessBgColor = Color(0xffE5EAF0);
  static LinearGradient vge9_3ButtonBackgroundColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    kTextColor,
    kTextColor,
  ]);
  static const Color vge9_4InviteMoreColor = Color(0xff8794A8);
  static const Color vge9_4ShareLinkTextColor = Color(0xff027FA9);
  static const Color vge9_4ShareLinkBorderColor = Color(0xff0099CC);
  static const Color vge9_4ShareLinkBgColor = Color(0xffF2FCFF);

  static const Color vge9_5DetailTextColor = Color(0xff8794A8);
  static const Color vge9_5BlockTextColor = Color(0xffA5AFBE);

  // group_info
  static const Color groupInfoDatetimeColor = Color(0xff8794A8);

  //vge10

  static const Color vge10DividerColor = Color(0xffF2F4F6);
  static const Color vge10_1LocationTextColor = Color(0xff8794A8);
  static const Color vge10_1DateSelectedBgColor = Color(0xff0099CC);
  static const Color vge10_1DateBgColor = Color(0xffEBECEE);

  //veo2
  static const Color veo2MemberColor = Color(0xff8794A8);
  static const Color veo2TookPlaceDateColor = Color(0xffBF3F4E);
  static const Color veo2UpcomingColor = Color(0xff006600);
  static const Color veo2TabBackgroundColor = Color(0xffE9ECF2);
  static const Color veo2CancelBorderColor = Color(0xff858D9A);
  static const Color veo2DividerColor = Color(0xffF2F4F6);

  //veo5
  static const Color veo5InviteTextColor = Color(0xff006600);
  static const Color veo5InfoTexColor = Color(0xff747688);
  static const Color veo5DescriptionColor = Color(0xff120D26);
  static const Color veo5ViewMoreColor = Color(0xff0099CC);
  static const Color veo5BorderColor = Color(0xffE2E8F2);

  //veo6
  static const Color veo6BorderColor = Color(0xffE2E7EF);
  static const Color veo6LabelTextColor = Color(0xffB2BAC8);

  //upload file
  static const Color uploadFileBorderColor = Color(0xffD5DBE2);

  //gdm1
  static const Color gdm1_4DividerColor = Color(0xffF2F4F6);

  //gdm2
  static const Color gmd2TextHintColor = Color(0xffDADEE5);
  static const Color gdm2UnderlineText = Color(0xFF414B5B);
  static const Color gdm2BorderDotted = Color(0xFFD5DBE2);
  //gdm2_1
  static const Color gdm2_1BackGroundItemQuestion = Color.fromRGBO(218, 222, 229, 0.3);
  static const Color gdm2_1ColorBarTitleQuestion = Color(0xFFDCDCDC);
  //gdm2_2
  static const Color gdm2_2DividerItem = Color(0xFFF2F4F7);
  static const Color gdm2_2BorderIndexItem = Color(0xFFB2BAC8);
  static const Color gdm2_2UnderLineInstruct = Color(0xFFDADEE5);
  static const Color gdm2_2SelectedAnswers = Color(0xFF4DA234);
  static const Color gdm2_2BorderScoreColor = Color(0xFFBF3F4E);
  static const Color gdm2_2BackgroundItemAnswers = Color(0xFFEBF8E7);
  static const Color gdm2_2DividerItemAnswers = Color(0xFFB7B7B7);
  //gdm2_3
  static const Color gdm2_3ColorBarViewExamUploaded = Color(0xFFDCDCDC);
  static const Color gdm2GreyTitle = Color(0xFF858D9A);

  //gdm1
  static const Color gdm1BorderColor = Color(0xffE1E6EF);
  static LinearGradient gdm1ExamExistBgColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xff5F71D0),
    Color(0xff394DB7),
  ]);
  static LinearGradient gdm1uploadExamBgColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xffECB854),
    Color(0xffE5A01B),
  ]);

  static LinearGradient gdm1CreateExamColor = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xffDADEE5),
    Color(0xffDADEE5),
  ]);
  static const Color gdm1ExamItemColor = Color(0xffE2E7EF);

  //category path widget
  static const Color categoryPathBgColor = Color(0xffEBECEE);
  static const Color categoryPathChevronColor = Color(0xffA9AEB5);

  static const Color bottomBorder = Color(0xffE2E8F2);
  static const Color commonTabBarColor = Color(0xffE5EAF0);

  //vn
  static const Color titleAppbarColor = Color(0xffffffff);
  static const Color vnDateNewsColor = Color(0xff747688);
  static const Color vnDividerColor = Color(0xffDADEE5);
  static const Color vnDetailTitleColor = Color(0xff414B5B);
  static const Color vnLikeReactColor = Color(0xffD4496B);
  static const Color editCommentColor = Color(0xff6B7280);
  static const Color deleteCommentColor = Color(0xffED0131);

  static LinearGradient hotNewsGradient = LinearGradient(
    begin: Alignment.bottomRight,
    stops: <double>[0.1, 0.9],
    colors: <Color>[
      const Color(0xff000000).withOpacity(0.32),
      const Color(0xff000000).withOpacity(0.0),
    ],
  );

  //vhs
  static const Color subtitleColor = Color(0xff545871);
  static const Color tileColor = Color(0xffF2F3F7);
  static const Color tileLeadingColor = Color(0xff663300);
  static const Color backgroundQRCodeColor = Color(0xffB8BEBE);
  static const Color vhs7HintFieldColor = Color(0xffB4BDCA);
  static const Color vhs9BackColor = Color(0xff414B5B);
  static const Color vhs10OtpExpiredTextColor = Color(0xffC6CCD7);
  static const Color vhsBorderColor = Color(0xffE2E7EF);
  static const Color vhsTextFormWeb = Color(0xff858d9a);
  static const Color vhs3BorderIconColor = Color(0xff6B7280);

  //vhs style
  static TextStyle selectLoginTitleStyle =
      textStyleBodyDefaultBold.copyWith(color: CustomTheme.textColor, fontSize: 20);

  static TextStyle unSelectLoginTitleStyle =
      textStyleBodyDefaultBold.copyWith(color: CustomTheme.dividerColor, fontSize: 18);

  // vsr
  static const Color borderSearchColor = Color(0xffE0E4E8);
  static const Color fillSearchColor = Color(0xffF0F3F5);
  static const Color textSearchColor = Color(0xff8794A8);
  static const Color backgroundTextSearch = Color(0xffEEEBE7);

  //hum button
  static const Color hamburgerIndicatorBgColor = Color(0xffE5A80A);

  //request button
  static const Color requestBtnAcceptColor = Color(0xff006600);
  static const Color requestBtnDeniedColor = Color(0xff858D9A);
  //vn
  static const Color blueDottedBorder = Color(0xff2783DD);
  static LinearGradient blueGradient = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xff4795E1),
    Color(0xff217FDC),
  ]);

  //veo6
  static const Color veo6InviteColor = Color(0xff858D9A);
  static const Color veo6InviteBorderColor = Color(0xff858D9A);

  //bottom Sheet
  static const Color sheetType1Border = Color(0xffE1E6EF);
  static LinearGradient purpleGradient = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xff5F71D0),
    Color(0xff394DB7),
  ]);
  static LinearGradient yellowGradient = const LinearGradient(begin: Alignment.topCenter, stops: <double>[
    0.1,
    0.9
  ], colors: <Color>[
    Color(0xffECB854),
    Color(0xffE5A01B),
  ]);

  //vsr
  static const Color vsr4BorderCategoryColor = Color(0xffC7CCD0);

  //register information

  static const Color textRegisterGreyColor = Color(0xff374151);
}
