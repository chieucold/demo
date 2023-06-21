import 'package:core/common/common.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_webview.dart';
import 'package:core/components/dialog/bnd_general_dialog.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void showModalCaptcha(BuildContext context, {Color? loadingColor, Function? onSuccess, Function? onError}) {
  String idPath = kDebugMode ? ApiPath.Id : ApiPathRelease.Id;
  idPath += "/captcha";
  bndShowGeneralDialog(
    context,
    barrierDismissible: false,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SpinKitWave(
          color: loadingColor ?? Colors.red,
          size: 50.0,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)!.translate('verifying_recaptcha'),
          style: textStyleBodyDefault,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 1,
          child: BNDWebView(
            path: idPath,
            isShowLoading: false,
            functionCallBacks: <BNDWebviewFunctionModel>[
              BNDWebviewFunctionModel("captchaValid", (List<dynamic> args) {
                if (onSuccess != null && args != null && args.length > 0) onSuccess(args[0]);
                Navigator.pop(context);
              }),
              BNDWebviewFunctionModel("captchaError", (List<dynamic> args) {
                if (onError != null && args != null && args.length > 0) onError(args[0]);
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ],
    ),
    maxHeight: 300,
  );
}
