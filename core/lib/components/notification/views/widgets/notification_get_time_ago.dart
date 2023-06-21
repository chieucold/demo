import 'package:core/common/utils/app_utils.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';

String NotificationGetTimeAgo(DateTime fatchedDate, BuildContext context, {String prefixText = ''}) {
  final DateTime currentDate = Utils.getCurrentServerTime();

  final Duration different = currentDate.difference(fatchedDate);

  if (different.inDays > 365)
    return prefixText + "${(different.inDays / 365).floor()} ${AppLocalizations.of(context)!.translate("year_ago")}";
  if (different.inDays > 30)
    return prefixText + "${(different.inDays / 30).floor()} ${AppLocalizations.of(context)!.translate("month_ago")}";
  if (different.inDays > 7)
    return prefixText + "${(different.inDays / 7).floor()} ${AppLocalizations.of(context)!.translate("week_ago")}";
  if (different.inDays > 0)
    return prefixText + "${different.inDays} ${AppLocalizations.of(context)!.translate("day_ago")}";
  if (different.inHours > 0)
    return prefixText + "${different.inHours} ${AppLocalizations.of(context)!.translate("hour_ago")}";
  if (different.inMinutes > 0)
    return prefixText + "${different.inMinutes} ${AppLocalizations.of(context)!.translate("minutes_ago")}";
  if (different.inMinutes == 0) return AppLocalizations.of(context)!.translate("just_now");

  return AppLocalizations.of(context)!.displayDateTime(fatchedDate, isFullTime: false);
}
