import 'dart:convert';
import 'dart:io';

import 'package:api/system/model/system_index.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/constants/const/const_index.dart';
import 'package:core/common/core_module.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/server_time_model.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:html/dom.dart';
import 'package:intl/intl.dart';
import 'package:intl/locale.dart';
import 'package:path/path.dart' as p;
import 'package:html/parser.dart';
import 'package:crypto/crypto.dart';
import 'package:url_launcher/url_launcher.dart';

Type typeOf<T>() => T; // get type

class Utils {
  static String assetImage(String imagePath) {
    return imagePath;
  }

  static String getTextTranslate(
    BuildContext context, {
    required String textTranslate,
  }) {
    return AppLocalizations.of(context)!.translate(textTranslate);
  }

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static T? getRouterObject<T>(Object? arguments, {int index = -1}) {
    if (arguments == null) return null;
    if (index >= 0) {
      final List<dynamic> args = arguments as List<dynamic>;
      if (index < args.length)
        return (args[index]) != null ? args[index] as T : null;
      else
        return null;
    }

    return arguments as T;
  }

  static String doubleToString(double value) {
    return value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1);
  }

  static String getCharacterFromIndex(int index) {
    return String.fromCharCode(index + 65);
  }

  static int getCharacterCode(String character) {
    final List<int> codeUnits = character.codeUnits;
    int temp = 65;
    if (codeUnits.length > 0) temp = codeUnits[0];
    return temp;
  }

  static T? getPropertyValueByName<T>(Object? object, String propertyName) {
    if (object == null) return null;
    try {
      final Map<String, dynamic> temp = convertObjectToMap(object);
      return temp[propertyName] as T;
    } catch (ex) {
      return null;
    }
  }

  static Map<String, dynamic> convertObjectToMap(Object object) {
    final Map<String, dynamic> temp = jsonDecode(jsonEncode(object)) as Map<String, dynamic>;
    // print(temp);
    return temp;
  }

  static int dateDiffToSeconds(DateTime date1, DateTime date2) {
    return date1.difference(date2).inSeconds;
  }

  static int dateDiffToMinutes(DateTime date1, DateTime date2) {
    return date1.difference(date2).inMinutes;
  }

  // static String getTimeAgo(BuildContext context, DateTime time) {
  //   final int differenceInMinute = DateTime.now().difference(time).inMinutes;
  //   if (differenceInMinute < 60) {
  //     return ("$differenceInMinute ") + AppLocalizations.of(context)!.translate("minutes_ago").toLowerCase();
  //   }

  //   final int differenceInHour = DateTime.now().difference(time).inHours;
  //   if (differenceInHour < 24) {
  //     return ("$differenceInHour ") + AppLocalizations.of(context)!.translate("hours_ago").toLowerCase();
  //   }

  //   final int differenceInDay = DateTime.now().difference(time).inDays;
  //   if (differenceInDay < 7) {
  //     return ("$differenceInDay " + AppLocalizations.of(context)!.translate("days_ago")).toLowerCase();
  //   } else if (differenceInDay / 7 < 52) {

  //     return ("${(differenceInDay / 7).toString()} " + AppLocalizations.of(context)!.translate("weeks_ago").toLowerCase());
  //   } else {
  //     return getFormatDateTimeOfDay(time, format: "dd/MM/yyyy");
  //   }
  // }

  static String getTimeAgo(BuildContext context, DateTime time) {
    final int differenceInMinute = DateTime.now().difference(time).inMinutes;
    if (differenceInMinute == 0) {
      return AppLocalizations.of(context)!.translate("just_now");
    }

    if (differenceInMinute < 60) {
      return ("$differenceInMinute ") + AppLocalizations.of(context)!.translate("minutes_ago").toLowerCase();
    }

    final int differenceInHour = DateTime.now().difference(time).inHours;
    if (differenceInHour < 24) {
      return ("$differenceInHour ") + AppLocalizations.of(context)!.translate("hours_ago").toLowerCase();
    }

    final int differenceInDay = DateTime.now().difference(time).inDays;
    if (differenceInDay < 7) {
      return ("$differenceInDay " + AppLocalizations.of(context)!.translate("days_ago")).toLowerCase();
    } else if (differenceInDay / 7 < 52) {
      return ("${(differenceInDay / 7).toInt().toString()} " +
          AppLocalizations.of(context)!.translate("weeks_ago").toLowerCase());
    } else {
      return getFormatDateTimeOfDay(time, format: "dd/MM/yyyy");
    }
  }

  static String convertSecondToTimeHourAndMinutes({required int second}) {
    String time = '';
    final int minutes = Duration(seconds: second).inMinutes;
    final int hours = Duration(seconds: second).inHours;
    final double convertMinutes = (second % 3600) / 60;
    if (hours == 0) {
      time = '${minutes.toString()} phút';
    } else {
      time = '$hours giờ ${convertMinutes.round()} phút';
    }
    return time;
  }

  static String convertTimeFormat({int minutes = 0, int hours = 0}) {
    if (hours != 0 && minutes != 0) {
      return '${hours}h${minutes}p';
    }
    if (hours != 0) {
      return '${hours}h';
    }
    if (minutes != 0) {
      return '${minutes}p';
    }
    return '0p';
  }

  static String getFormatTime(int number) {
    String textTimeFormat = "";
    if (number > 3600) {
      final int hours = (number ~/ 3600).round();
      final int minutes = ((number % 3600) / 60).round();
      final int seconds = ((number % 3600) % 60).round();
      textTimeFormat = hours.toString() +
          ' giờ ' +
          (minutes != 0 ? minutes.toString() + ' phút ' : '') +
          (seconds != 0 ? seconds.toString() + ' giây' : '');
    } else {
      if (number >= 60) {
        final int minutes = (number ~/ 60).round();
        final int seconds = number % 60;
        textTimeFormat = minutes.toString() + ' phút ' + (seconds != 0 ? seconds.toString() + ' giây' : '');
      } else {
        textTimeFormat = number.toString() + ' giây';
      }
    }
    return textTimeFormat;
  }

  int getDayInMonth(int month) => DateUtils.getDaysInMonth(DateTime.now().year, month);

  static String getFormatDateTimeOfDay(DateTime date, {TimeOfDay? time, String? format}) {
    late DateTime dateTime = date;
    if (time != null) {
      dateTime = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    }
    return DateFormat(format ?? "HH:mm - dd/MM/yyyy").format(dateTime);
  }

  static DateTime setTimeToDate(DateTime date, TimeOfDay? time) {
    if (time != null) return DateTime(date.year, date.month, date.day, time.hour, time.minute);

    return date;
  }

  static DateTime? dateTimeFromString(String? text) {
    if (text == null || text.isEmpty) return null;
    return DateTime.tryParse(text);
  }

  static T? updateObjectValue<T>(T oldData, Map<String, dynamic> newData) {
    if (oldData == null) return null;
    final Map<String, dynamic> mapOldValue = convertObjectToMap(oldData);
    newData.forEach((String key, dynamic value) {
      if (mapOldValue.containsKey(key)) {
        mapOldValue[key] = value;
      }
    });
    return null;
  }

//#region file
  static String getExtension(String path) {
    return p.extension(path).replaceAll(".", "");
  }

  static String getExtensionWithDot(String path) {
    return p.extension(path);
  }

  static String getFileName(String path) {
    return p.basename(path);
  }

  static String getFileNameWithoutExtension(String path) {
    return p.basenameWithoutExtension(path);
  }

  static String getFileNameFromTime(String extension) {
    return DateTime.now().millisecondsSinceEpoch.toString() + "." + extension;
  }

//#endregion

  static String base64Decode(String b64) {
    final String foo = b64.split('.')[0];
    final List<int> res = base64.decode(base64.normalize(foo));
    return utf8.decode(res);
  }

  static Map<String, dynamic> base64ToMap(String b64) {
    return json.decode(base64Decode(b64));
  }

  static T enumFromString<T>(Iterable<T> values, String value) {
    // ignore: always_specify_types
    return values.firstWhere((type) => type.toString().split(".").last == value, orElse: () => values.first);
  }

  static String enumToString<T>(T value) {
    return value.toString().split(".").last;
  }

  static String cleanHTMLTag(String htmlString) {
    try {
      final Document document = parse(htmlString);
      return parse(document.body!.text).documentElement!.text;
    } catch (e) {
      return "";
    }
  }

  static int getDecimal(double value) {
    final int decimal = int.tryParse(value.toString().split('.')[1]) ?? 0;
    return decimal;
  }

  static List<TextInputFormatter> formatterOnlyNumber({int? length}) => <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        if (length != null) LengthLimitingTextInputFormatter(length)
      ];

  static void setServerTime(String time) {
    try {
      final DateTime temp = DateFormat("yyyy-MM-ddThh:mm:ss").parse(time);
      LocalStoreManager.setObject(SharedPreferenceKey.serverTimeKey, ServerTimeModel(temp, DateTime.now()).toJson());
    } catch (e) {
      print(e);
    }
  }

  static DateTime getCurrentServerTime() {
    try {
      final Map<String, dynamic>? temp = LocalStoreManager.getObject(SharedPreferenceKey.serverTimeKey);
      if (temp != null) {
        final ServerTimeModel serverTimeModel = ServerTimeModel.fromJson(temp);
        return serverTimeModel.serverTime
            .add(Duration(seconds: DateTime.now().difference(serverTimeModel.clientTime).inSeconds));
      }
    } catch (e) {}

    return DateTime.now();
  }

  static String thumbnailImage(String url, {double? width, double? height, String mode = 'crop'}) {
    if (url.contains(mode)) return url;
    // ignore: parameter_assignments
    if (width == double.infinity || width == null) width = 0;

    // ignore: parameter_assignments
    if (height == double.infinity || height == null) height = 0;

    if (width == 0 && height == 0) return url;

    final List<StorageServer>? storageServer = GetIt.I<AppSettings>().getAppSettings.storageServers;
    if (storageServer != null) {
      final Iterable<String> allStorage = storageServer.map((StorageServer e) => e.publicDomain);
      for (String item in allStorage) {
        if (url.toLowerCase().contains(item.toLowerCase())) {
          if (item[item.length - 1] != '/') item = item + "/";
          // ignore: parameter_assignments
          url = url.replaceAll(item.toLowerCase(),
              '$item${(width != null && width > 0) ? width.toInt() * 2 : 0}x${(height != null && height > 0) ? height.toInt() * 2 : 0}/${mode}/');
        }
      }
    }

    return url;
  }

  Future<FilePickerResult?> openChooseFiles({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    Function(FilePickerStatus)? onFileLoading,
    bool allowCompression = true,
    bool allowMultiple = false,
    bool withData = false,
    bool withReadStream = false,
  }) async {
    final GlobalVariableResource _gl = GetIt.I<GlobalVariableResource>();
    await _gl.setOpenFile(true);
    print('IsOpen ${_gl.isOpenFile}');
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowedExtensions,
        allowMultiple: allowMultiple,
        allowCompression: allowCompression,
        onFileLoading: onFileLoading,
        withData: withData,
        withReadStream: withReadStream);
    await _gl.setOpenFile(false);
    return result;
  }

  static Future<void> openLaunch(String link) async {
    final GlobalVariableResource _gl = GetIt.I<GlobalVariableResource>();
    await _gl.setOpenFile(true);
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
    await _gl.setOpenFile(false);
  }

  static Future<String?> regexUrlId(String regexType, String url) async {
    final RegExp regexp = RegExp(r'\' + regexType);
    final RegExpMatch? match = regexp.firstMatch(url);
    print(match?.group(0));
    return match?.group(0);
  }

  static Future<String?> regexPath(String path) async {
    // final RegExp _regex = RegExp(r'^[a-zA-Z/]+$');
    // final Iterable<RegExpMatch>? match = _regex.allMatches(path);

    List<String> _splitPath = path.split('/');
    String _pathNew = _splitPath[1] + '/' + _splitPath[2];
    // print(match?.join(""));
    return _pathNew;
  }

  static String getExamSetTitle(BuildContext context,
      {bool isBuy = false, double price = 0.0, double discountPrice = 0.0}) {
    if (isBuy) return AppLocalizations.of(context)!.translate("bought");
    if (price == 0 && discountPrice == 0) return AppLocalizations.of(context)!.translate("free");
    return AppLocalizations.of(context)!.displayCurrency(discountPrice);
  }

  static Color get getCurrentAppColor {
    final int _blockId = LocalStoreManager.getInt(BlockSettings.blockKey);
    return listBlockWithVitan.firstWhere((BlockModel e) => e.id == _blockId).backgroundColor;
  }

  static deviceTypeEnum get getDeviceType {
    final MediaQueryData data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.shortestSide < 600 ? deviceTypeEnum.phone : deviceTypeEnum.tablet;
  }

  LocaleType getLocaleType() {
    return Utils.enumFromString<LocaleType>(LocaleType.values, AppLocalizations.of(navigatorKey!.currentState!.context)!.locale.languageCode);
  }

  Future<DateTime?> onShowDatePicker({required BuildContext context, DateTime? currentValue, DateTime? firstDate,DateTime? initialDate}) {
    late bool _isShowAfterTime = true;

    final DateTime _minDate =
        _isShowAfterTime != null && !_isShowAfterTime ? DateTime.now() : firstDate ?? DateTime(1900);
    if (Platform.isIOS)
      return DatePicker.showDatePicker(
        context,
        minTime: _minDate,
        maxTime: DateTime(2100),
        currentTime: currentValue,
        locale: getLocaleType(),
      );

    return showDatePicker(
      context: context,

      initialDate: currentValue ?? initialDate ?? DateTime.now(),
      firstDate: _minDate,
      lastDate:  DateTime(2100),
      currentDate: currentValue,
    );
  }

  Future<TimeOfDay?> onShowTimePicker(BuildContext context, DateTime? currentValue) async {
    if (Platform.isIOS) {
      final DateTime? result = await DatePicker.showTimePicker(
        context,
        currentTime: currentValue,
        locale: getLocaleType(),
      );

      if (result == null) return null;
      return TimeOfDay.fromDateTime(result);
    }

    final TimeOfDay? timePickerResult = await showTimePicker(
      context: context,
      initialTime: currentValue != null ? TimeOfDay.fromDateTime(currentValue) : TimeOfDay.fromDateTime(DateTime.now()),
    );
    return timePickerResult ?? (currentValue != null ? TimeOfDay.fromDateTime(currentValue) : null);
  }
}
