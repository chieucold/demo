import 'package:api/exam/model/exam_index.dart';
import 'package:core/common/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommonFunc {
  static String getFormatTime(int number) {
    return Utils.getFormatTime(number);
  }

  static String getFormatDateTime(DateTime? date) {
    if (date == null) return "";
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String getFormatDateTimeOfDay(DateTime date, {TimeOfDay? time}) {
    late DateTime dateTime = date;
    if (time != null) {
      dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    }
    return DateFormat("HH:mm - dd/MM/yyyy").format(dateTime);
  }


}

