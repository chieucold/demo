import 'dart:async';
import 'package:core/assets/images/images.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/components/bnd_message.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/passcode/circle.dart';
import 'package:core/passcode/keyboard.dart';
import 'package:core/passcode/passcode_screen.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void bndShowGeneralDialog(BuildContext context,
    {required Widget child,
    int duration = 400,
    double borderRaius = 20,
    String label = "Dialog",
    double? maxHeight,
    bool barrierDismissible = true}) {
  showGeneralDialog(
    barrierLabel: "",
    barrierDismissible: barrierDismissible,
    barrierColor: CoreColor.modalBackgroundColor,
    transitionDuration: Duration(milliseconds: duration),
    context: context,
    pageBuilder: (_, __, ___) {
      return Align(
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.5,
            maxWidth: 500,
          ),
          child: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                if (barrierDismissible)
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Images.svgAssets(
                        Images.icClear,
                        package: 'core',
                        width: 14,
                        height: 14,
                      ),
                    ),
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    child: child,
                  ),
                )
              ],
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (_, Animation<double> anim, __, Widget child) {
      return SlideTransition(
        // ignore: always_specify_types
        position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}

Future<void> showLockScreen(
  BuildContext context, {
  bool opaque = false,
  bool isCancel = false,
  bool isReset = true,
  CircleUIConfig? circleUIConfig,
  KeyboardUIConfig? keyboardUIConfig,
  Widget? cancelButton,
  Function(String text)? onComplete,
  required StreamController<bool> streamController,
  int maxLength = 6,
  List<String>? digits,
}) async {
  final bool _isReset = LocalStoreManager.getString(UserSettings.keyPassCode).isNotEmpty;
  if (LocalStoreManager.getString(UserSettings.currentScreen) != passCodeScreen) {
    await LocalStoreManager.setString(UserSettings.currentScreen, passCodeScreen);
    await Navigator.push<bool>(
        context,
        MaterialPageRoute<bool>(
            builder: (BuildContext context) => PassCodeScreen(
              isReset: _isReset,
              circleUIConfig: circleUIConfig,
              keyboardUIConfig: keyboardUIConfig,
              passwordEnteredCallback: (String text) {
                if (onComplete != null) {
                  // final String codeMd5 = Utils.generateMd5(text);
                  // final String localCode = LocalStoreManager.getString(UserSettings.keyPassCode);
                  // if (codeMd5 == localCode || !isTurnOnPass) {
                  onComplete(text);
                  // } else {
                  //
                  //   showErrorMessage(AppLocalizations.of(context)!.translate('incorrect_password_passcode'));
                  // }
                }
              },
              cancelButton: isCancel
                  ? cancelButton ??
                      TextButton(
                        child: Text(
                          AppLocalizations.of(context)!.translate('cancel'),
                          style: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          print('cancel');
                          Navigator.pop(context);
                        },
                      )
                  : const SizedBox(),
              deleteButton: Text(
                AppLocalizations.of(context)!.translate('delete'),
                style: const TextStyle(fontSize: 16, color: Colors.white),
                semanticsLabel: AppLocalizations.of(context)!.translate('delete'),
              ),
              shouldTriggerVerification: streamController.stream,
              backgroundColor: Colors.black.withOpacity(0.8),
              isCancel:isCancel,
              digits: digits,
              passwordDigits: maxLength,
              // bottomWidget: _buildRestorePassCodeButton(),
            ),
            settings: const RouteSettings(name: passCodeScreen)));
    await LocalStoreManager.setString(UserSettings.currentScreen, '');

    return;
  }
}
