// ignore_for_file: must_be_immutable

import 'package:api/id/model/login_qr_code_model.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/api/api_local_auth.dart';
import 'package:core/common/text_style.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:core/components/bnd_image.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_login_qrcode/bloc/vhs_login_qrcode_bloc.dart';

class VHSLoginQRCodeInfoWidget extends StatelessWidget {
  VHSLoginQRCodeInfoWidget({Key? key, required this.bloc}) : super(key: key);
  final VHSLoginQrcodeBloc bloc;
  LoginQRCodeModel get _data => bloc.state.model.data;
  LocalAuthApi? biometrics = LocalAuthApi();

  Widget _height(double height) => SizedBox(height: height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.backgroundQRCodeColor,
      child: Padding(
        padding: CustomTheme.paddingBodyDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  radius: 87,
                  child: ClipOval(
                    child: BNDImage(imageUrl: Images.scanQrCodeThumbnail),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.translate('do_you_want_to_login_with_QR_code'),
                      style: textStyleHeadline6.copyWith(color: CustomTheme.white),
                      textAlign: TextAlign.center,
                    ),
                    _height(27),
                    RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: AppLocalizations.of(context)!.translate("device") + ": ",
                            style: textStyleBodyMedium.copyWith(color: CustomTheme.white),
                          ),
                          TextSpan(
                            text: _data.browserName,
                            style: textStyleBodyMediumBold.copyWith(color: CustomTheme.textColor),
                          ),
                        ],
                      ),
                    ),
                    _height(20),
                    RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: AppLocalizations.of(context)!.translate("location") + ": ",
                            style: textStyleBodyMedium.copyWith(color: CustomTheme.white),
                          ),
                          TextSpan(
                            text: _data.address,
                            style: textStyleBodyMediumBold.copyWith(color: CustomTheme.textColor),
                          ),
                        ],
                      ),
                    ),
                    _height(20),
                    RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: AppLocalizations.of(context)!.translate("time") + ": ",
                            style: textStyleBodyMedium.copyWith(color: CustomTheme.white),
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.displayDateTime(Utils.getCurrentServerTime()),
                            style: textStyleBodyMediumBold.copyWith(color: CustomTheme.textColor),
                          ),
                        ],
                      ),
                    ),
                    _height(20),
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    _changeBiometric(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.translate("login").toUpperCase(),
                    style: textStyleBodyDefaultBold.copyWith(color: CustomTheme.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: CustomTheme.tileLeadingColor,
                      padding: EdgeInsets.symmetric(horizontal: 60)),
                ),
                // PrimaryButtonWidget(
                //   backgroundColor: CustomTheme.tileLeadingColor,
                //   title: AppLocalizations.of(context)!
                //       .translate("login")
                //       .toUpperCase(),
                //   onPressed: () async {
                //     final bool isSuccess = await bloc.checkQRCode();
                //     if (isSuccess) Navigator.of(context).pop();
                //   },
                //   margin: const EdgeInsets.symmetric(horizontal: 10),
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: 14, vertical: 10),
                //   iconSize: 0,
                //   textStyle: textStyleBodyDefaultBold.copyWith(
                //       color: CustomTheme.white),
                // ),
                _height(4),
                BndTouch(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                    child: Text(
                      AppLocalizations.of(context)!.translate("denied"),
                      style: textStyleBodyDefault.copyWith(
                          decoration: TextDecoration.underline, color: CustomTheme.textColor),
                    ),
                  ),
                ),
                _height(12),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _changeBiometric(BuildContext context) async {
    bool temp = true;
    // Nếu máy có sinh trắc học
    if (await biometrics!.isBiometricAvailable()) {
      await biometrics!.getListOfBiometricTypes(isOpenSetting: true);
      await biometrics!.authenticateUser().then((value) async {
        if (value) {
          final bool isSuccess = await bloc.checkQRCode();
          if (isSuccess) Navigator.of(context).pop();
        }
      });
    }
    // Nếu máy ko có sinh trắc học
    else {
      final bool isSuccess = await bloc.checkQRCode();
      if (isSuccess) Navigator.of(context).pop();
    }
    return temp;
    // final bool isSuccess = await bloc.checkQRCode();
    // if (isSuccess) Navigator.of(context).pop();
  }
}
