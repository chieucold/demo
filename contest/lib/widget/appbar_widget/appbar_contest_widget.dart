import 'package:contest/theme/contest_theme.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/appbar/app_bar_background.dart';
import 'package:core/components/common_leading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:core/components/menu_bar.dart/menu_bar_widget.dart';

PreferredSize appBarContestWidget(BuildContext context, {String? title, Function? onBack, bool isBackIcon = false}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(40),
    child: AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
          height: double.infinity,
          color: kPrimaryContestColor,
          child: Stack(
            children: <Widget>[
              appBarBackgroundWidget(color: ContestTheme.primaryContestColor),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Container(
                  height: 40,
                  margin: const EdgeInsetsDirectional.only(start: 16),
                  child: Row(
                    children: <Widget>[
                      if (isBackIcon)
                        CommonLeadingWidget()
                      else
                        GestureDetector(
                            onTap: () {
                              if (onBack != null) {
                                onBack();
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                                width: 40,
                                height: 40,
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(6),
                                child: Images.svgAssets(Images.home_icon))),
                      Container(
                        margin: const EdgeInsetsDirectional.only(
                          start: 14,
                          end: 14,
                        ),
                        width: 1,
                        height: 21,
                        color: ContestTheme.textWhiteColor,
                      ),
                      Expanded(
                        child: Text(
                          title ?? 'Thi trực tuyến',
                          style: textStyleHeadline6Default.copyWith(color: ContestTheme.textWhiteColor),
                        ),
                        flex: 8,
                      ),
                      // Expanded(
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       goToVHSLoginQRCode(context);
                      //     },
                      //     child: Images.svgAssets(
                      //       Images.icQRCode,
                      //       package: 'core',
                      //       color: Colors.white,
                      //       height: 20,
                      //     ),
                      //   ),
                      //   flex: 1,
                      // ),

                      Expanded(
                        child: Stack(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: CustomPaint(
                                  painter: IconMenuAppBarPathPainting(),
                                  child: Container(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Expanded(flex: 2, child: SizedBox()),
                              Expanded(
                                  flex: 3,
                                  child: Align(
                                    child: MenuBarWidgetWidget(
                                      idMiniApp: BlockEnum.Contest.index,
                                      colorMiniApp: ContestTheme.primaryContestColor,
                                    ),
                                    alignment: Alignment.center,
                                  )),
                            ],
                          )
                        ]),
                        flex: 3,
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    ),
  );
}

class IconMenuAppBarPathPainting extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final Gradient gradient = const LinearGradient(
    //   begin: Alignment.topCenter,
    //   end: Alignment.bottomCenter,
    //   // ignore: always_specify_types
    //   colors: [Colors.orangeAccent, Colors.yellow],
    //   tileMode: TileMode.clamp,
    // );
    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0
      ..color = Colors.white;
    final Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 1 / 4, size.height * 21 / 21, size.width / 2, size.height / 3);
    path.quadraticBezierTo(size.width * 3 / 4, -size.height / 3, size.width, size.height / 3);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
