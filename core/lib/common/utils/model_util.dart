import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

double toDouble(dynamic value, [double defaultValue = 0.0]) {
  if (value == null) return defaultValue;
  double result = 0.0;
  if (value is num) {
    result = value.toDouble();
  } else if (value is String && value.isNotEmpty) {
    result = double.tryParse(value)!;
  }
  return result;
}

int toInt(dynamic value, [int defaultValue = 0]) {
  if (value == null) return defaultValue;
  int result = 0;
  if (value is num) {
    result = value.toInt();
  } else if (value is String && value.isNotEmpty) {
    result = int.tryParse(value)!;
  } else if (value is bool) {
    result = value ? 1 : 0;
  }
  return result ;
}

bool toBool(dynamic value, [bool defaultValue = false]) {
  if (value == null) return defaultValue;

  if (value is bool) {
    return value;
  }
  final String strValue = value?.toString().toLowerCase()??"";
  if (strValue == 'true' || strValue == '1') {
    return true;
  } else if (strValue == 'false' || strValue == '0') {
    return false;
  }
  return defaultValue;
}

DateTime? getDate(dynamic value) {
  if (value == null) return null;
  if (value is num || toDouble(value) > 0) {
    // return _getDateFromUnixTimeStamp(value.toString());
  } else if (value is String) {
    try {
      return DateTime.parse(value);
    } catch (e) {
      // logger.v(e);
      return null;
    }
  }
}

DateTime? getDateLocal(DateTime? dateTime, {bool isUtc = true}) {
  if (dateTime == null) return null;
  if (isUtc) {
    return dateTime.toUtc();
  } else {
    return dateTime.toLocal();
  }
}

DateTime? getDateFormat(String value, String format) {
  try {
    if (value == null) return null;
    DateTime time = DateFormat(format).parse(value);
    return time;
  } catch (e) {
    return DateTime.now();
  }
}

String toFileUrl(String baseUrl, String url) {
  if (url == null) return "";
  return '$baseUrl$url';
}

String fileSize(double size) {
  double d1 = size / 1024.0;
  double d2 = d1 / 1024.0;
  double d3 = d2 / 1024.0;
  if (size < 1024.0) {
    return size.toString() + " bytes";
  }
  if (d1 < 1024.0) {
    return d1.round().toString() + " KB";
  }
  if (d2 < 1024.0) {
    return d2.round().toString() + " MB";
  }
  return d3.round().toString() + " GB";
}
