import 'package:app_settings/app_settings.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/bnd_cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/packages.dart';
import 'package:core/common/dimension.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/button/primary_button_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class RetryAreaView extends StatelessWidget {
  const RetryAreaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: ()async{
        return false;
      },
      shouldAddCallback: false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                // Lottie.asset(Images.lottieCompetitionComing, width: 30, height: 30, animate: true, repeat: true, package: "core"),

                Lottie.asset(Images.icNoInternet,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.6,
                    package: packageCore,
                    animate: true,
                    repeat: true),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      AppLocalizations.of(context)!.translate('oops_no_internet'),
                      maxLines: 3,
                      style: textStyleBodyDefaultBold,
                      overflow: TextOverflow.ellipsis,
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 10),
                    child: Text(
                      AppLocalizations.of(context)!.translate('no_inter_alert_description'),
                      maxLines: 3,
                      style: textStyleBodySmall,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    )),
                const SizedBox(height: 20),
                PrimaryButtonWidget(
                    iconSize: 0,
                    backgroundColor: CoreColor.primaryColor,
                    margin: EdgeInsets.symmetric(horizontal: width(context, 80)),
                    onPressed: () => AppSettings.openWIFISettings(),
                    title: AppLocalizations.of(context)!.translate('retry').toUpperCase()),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

