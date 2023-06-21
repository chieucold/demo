import 'package:core/assets/images/images.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/components/bnd_no_data.dart';
import 'package:core/components/button/primary_button_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:core/common/dimension.dart';
import 'package:core/components/advertisement_slider_widget/carouse_slider_widget.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/core/widget/appbar_widget/app_bar_supper_app.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs2_on_board/views/widgets/vhs2_slide_item_widget.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

class VHS2OnBoardScreen extends StatelessWidget {
  VHS2OnBoardScreen({Key? key}) : super(key: key);
  final AppSettings appSettings = getItSuper();

  @override
  Widget build(BuildContext context) {
    final onBoardings = appSettings.configs.onBoarding;
    return Scaffold(
      appBar: AppBarSupperApp(height: 0),
      body: onBoardings != null
          ? SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height(context, 24),
                  ),
                  Center(
                    child: Images.svgAssets(
                      Images.bnd_logo_onboarding,
                      cacheColorFilter: true,
                      height: height(context, 60),
                    ),
                  ),
                  SizedBox(
                    height: height(context, 50),
                  ),
                  Expanded(
                    child: CarouselSliderWidget(
                      height: height(context, 500),
                      listChildCarousel: onBoardings.map((e) => VHS2SlideItemWidget(e, context)).toList(),
                      slideControllerColorActive: CustomTheme.supperAppThemeColor,
                    ),
                  ),
                  SizedBox(
                    height: height(context, 6),
                  ),
                  Container(
                    padding: CustomTheme.paddingBodyDefault,
                    child: PrimaryButtonWidget(
                      padding: CustomTheme.paddingBodyDefault.copyWith(top: 10, bottom: 10),
                      title: AppLocalizations.of(context)!.translate("login").toUpperCase(),
                      onPressed: () async {
                        goToVHS3LoginUser(context);
                        // _examUser.refreshToken(context);
                      },
                      backgroundColor: CustomTheme.tileLeadingColor,
                      isGradient: false,
                      iconSize: 0,
                    ),
                  ),
                  SizedBox(height: height(context, 24)),
                ],
              ),
            )
          : BnDNoData(),
    );
  }
}
