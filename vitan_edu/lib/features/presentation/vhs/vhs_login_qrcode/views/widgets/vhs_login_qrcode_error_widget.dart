import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_error_message.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:vitan_edu/core/theme/custom.dart';

class VHSLoginQRCodeErrorWidget extends StatelessWidget {
  VHSLoginQRCodeErrorWidget({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomTheme.paddingBodyDefault,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BNDErrorMessage(message: message),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                AppLocalizations.of(context)!.translate("cancel"),
                style: textStyleBodyDefault,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
