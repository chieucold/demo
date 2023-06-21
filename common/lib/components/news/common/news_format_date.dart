import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDatetimetoString(DateTime dateTime, BuildContext context,
    {int style = 1}) {
  final String date = DateFormat('dd').format(dateTime);
  final String month = DateFormat('MM').format(dateTime);
  final String year = DateFormat('yyyy').format(dateTime);
  if (style == 1) {
    return "$date ${AppLocalizations.of(context)!.translate("month")} $month, $year • ";
  }
  return "${AppLocalizations.of(context)!.translate("month")} $month. $date, $year • ";
}
