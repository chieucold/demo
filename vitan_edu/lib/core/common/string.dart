import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

String getDuration(BuildContext context, int duration) {
  if (duration == null && duration > 0) return '';
  final Duration _duration = Duration(minutes: duration);
  final String hours = _duration.inHours.remainder(60) > 0
      ? '${_duration.inHours.remainder(60)} ${AppLocalizations.of(context)!.translate('hours').toLowerCase()} '
      : '';
  final String minutes = _duration.inMinutes.remainder(60) > 0
      ? '${_duration.inMinutes.remainder(60)} ${AppLocalizations.of(context)!.translate('minutes').toLowerCase()} '
      : '';
  final String second = _duration.inSeconds.remainder(60) > 0
      ? '${_duration.inSeconds.remainder(60)} ${AppLocalizations.of(context)!.translate('second').toLowerCase()}'
      : '';
  return '$hours$minutes$second';
}
