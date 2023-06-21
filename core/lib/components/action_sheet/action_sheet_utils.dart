import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/bnd_gesture_detector.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionSheetUtils {
  static Future<void> showActionSheetCustom(
      BuildContext context, String title, List<CupertinoActionSheetAction>? actions,
      {String message = ''}) {
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              actions: actions ?? [],
              title: Text(title,style: textStyleBodyDefault.copyWith(color: kTextColor)),
              cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.translate('cancel'),style: textStyleBodyDefaultBold.copyWith(color: Colors.red)),
              ),
            ));
  }
}
