import 'dart:async';

import 'package:core/common/core_module.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void updateLanguageDialog() {
  double _progress = 0;
  Timer? _timer;
  _timer?.cancel();
  _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
    EasyLoading.showProgress(_progress,
        status: '${(_progress * 100).toStringAsFixed(0)}%\n' +
            AppLocalizations.of(navigatorKey!.currentContext!)!.translate('loading_new_version_language'),
        maskType: EasyLoadingMaskType.black);
    _progress += 0.05;

    if (_progress >= 1) {
      _timer?.cancel();
      EasyLoading.dismiss();
    }
  });
}
