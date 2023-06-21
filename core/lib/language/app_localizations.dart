import 'dart:convert';
import 'dart:io';

import 'package:api/api/commondata_api.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/common.dart';
import 'package:core/common/connectivity/connectivity_core.dart';
import 'package:core/common/constants/user_settings.dart';
import 'package:core/common/core_module.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/dialog/update_language_dialog.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:core/common/extension/string_extension.dart';

class AppLocalizations {
  Locale locale;
  final CommondataApi _commondataApi = GetIt.I<CommondataApi>();
  final AppSettings appSettings = GetIt.I<AppSettings>();
  late Map<String, String> _localizedStrings;
  static Iterable<Locale> locales = <Locale>[
    const Locale(
      "vi",
      "VN",
    ),
    const Locale(
      "en",
      "US",
    )
  ];
  String _defaultPath = "lib/core/language/";

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate(locales);

  void init({List<Locale>? supportLocales, String? defaultPathI18n}) {
    if (supportLocales != null && supportLocales.length > 0) locales = supportLocales;
    if (!defaultPathI18n!.isNotEmpty) _defaultPath = defaultPathI18n;

    if (_defaultPath[_defaultPath.length - 1] != '/') _defaultPath += "/";
  }

  Future<bool> load() async {
    // set Intl
    Intl.defaultLocale = locale.languageCode;
    await appSettings.init();
    //final String jsonString = await rootBundle.loadString('$_defaultPath${locale.languageCode}.json');
    final String res = await _getJsonLanguage();
    Map<String, dynamic> jsonMap = <String, dynamic>{};
    try {
      jsonMap = json.decode(res);
    } catch (e) {
      //jsonMap = json.decode(jsonString);
    }
    _localizedStrings = jsonMap.map((String key, dynamic value) {
      return MapEntry<String, String>(key, value.toString());
    });

    return true;
  }

  //Dịch từ
  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

   String getFormatTime(int number, {bool isMinutes = true}) {
    final int _number = isMinutes ? (number * 60) : number;
    return Utils.getFormatTime(_number);
  }

  String displayNumber(dynamic value) {
    if (value == null) return "";
    final double temp = value - double.parse(value.toString()).toInt();
    if (temp < 1 && temp > 0) return NumberFormat("##0.0#").format(value);
    //if () return NumberFormat("###.0#").format(value);
    return NumberFormat().format(value);
  }

  String displayScore(BuildContext context, dynamic value, {bool showPointText = true}) {
    return displayNumber(value) +
        ' ' +
        AppLocalizations.of(context)!.translate(showPointText ? "point" : '').toLowerCase();
  }

  String getDefaultDateTimeFormat(DateTime value,
      {bool isFullTime = false,
      bool isDateOfWeek = false,
      bool isOnlyTime = false,
      bool isDateOfMonth = false,
      bool isDateOfMonthYear = false}) {
    final String? languageCode = locale.languageCode;
    if (isFullTime) {
      return DateFormat.Hm(languageCode).add_yMd().format(value);
    } else if (isDateOfMonth) {
      return DateFormat.Hm(languageCode).addPattern('- ').format(value) + DateFormat('dd/MM').format(value);
    } else if (isDateOfMonthYear) {
      return DateFormat.Hm(languageCode).addPattern('-').add_yMd().format(value);
    } else if (isDateOfWeek) {
      return DateFormat.yMMMMEEEEd(languageCode).format(value);
    } else if (isOnlyTime) {
      return DateFormat.Hm(languageCode).format(value);
    } else {
      return DateFormat.yMd(languageCode).format(value);
    }
  }

  // DateFormat getDefaultDateTimeFormat(
  //     {bool isFullTime = false,
  //     bool isDateOfWeek = false,
  //     bool isOnlyTime = false,
  //     bool isDateOfMonth = false,
  //     bool isDateOfMonthYear = false}) {
  //   final String? languageCode = locale.languageCode;
  //   if (isFullTime) {
  //     return DateFormat.Hm(languageCode).add_yMd();
  //   } else if (isDateOfMonth) {
  //     return DateFormat.Hm(languageCode).addPattern('-').add_Md();
  //   } else if (isDateOfMonthYear) {
  //     return DateFormat.Hm(languageCode).addPattern('-').add_yMd();
  //   } else if (isDateOfWeek) {
  //     return DateFormat.yMMMMEEEEd(languageCode);
  //   } else if (isOnlyTime) {
  //     return DateFormat.Hm(languageCode);
  //   } else {
  //     return DateFormat.yMd(languageCode);
  //   }
  // }

  String displayDateTime(DateTime? value,
      {bool isFullTime = true,
      bool isDateOfWeek = false,
      bool isOnlyTime = false,
      bool isDateOfMonth = false,
      bool isDateOfMonthYear = false}) {
    return value != null
        ? getDefaultDateTimeFormat(value,
            isFullTime: isFullTime,
            isDateOfWeek: isDateOfWeek,
            isOnlyTime: isOnlyTime,
            isDateOfMonthYear: isDateOfMonthYear,
            isDateOfMonth: isDateOfMonth)
        : '';
  }

  String displayTime(DateTime value) {
    final String? languageCode = locale.languageCode;
    return DateFormat.Hm(languageCode).format(value);
  }

  //Khởi tạo Locale
  static Locale localeResolutionCallback(Locale? locale, Iterable<Locale> supportedLocales) {
    for (final Locale supportedLocale in supportedLocales) {
      if (locale != null &&
          supportedLocale.languageCode == locale.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

  Future<bool> changeLocale(BuildContext context, Locale locale) {
    AppLocalizations.of(context)!.locale = locale;
    Intl.defaultLocale = locale.languageCode;
    return AppLocalizations.of(context)!.load();
  }

  // Convert tiền
  String displayCurrency(double price) {
    final String? languageCode = locale.languageCode;
    final String curency = NumberFormat.simpleCurrency(locale: languageCode).format(price);
    return curency;
  }

  // Kiếm tra có version ngôn ngữ mới hay ko
  bool _isNewVersionLanguage(String localVersion, String serverVersion) {
    if (localVersion != serverVersion) return true;
    return false;
  }

  // Lấy ngôn ngữ từ API, parse ra json
  Future<String> _getJsonLanguageAPI(String languageCode) async {
    final List<LanguageClientResource> language = await _commondataApi.languageGetLanguageApp(languageCode);
    final Map<String, dynamic> json = <String, dynamic>{};
    for (int i = 0; i < language.length; i++) {
      json['"${language[i].staticKey}"'] = '"${language[i].value}"';
    }
    return json.toString();
  }

  // Lưu ngôn ngữ vào file của máy
  Future<String> _updateJsonLanguage(String languageCode, File file, String versionValue) async {
    final String jsonLanguage = await _getJsonLanguageAPI(languageCode);
    await file.writeAsString(jsonLanguage);
    await LocalStoreManager.setString(UserSettings.languageVersion, versionValue);
    return jsonLanguage;
  }

  // Lấy đường dẫn file từ máy
  Future<File> _getFileLanguage(String languageCode) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File _file = File("${directory.path}/$languageCode.json");
    return _file;
  }

  // Lấy ngôn ngữ từ file của máy
  Future<String> _getJsonLanguage({String languageCode = 'vi'}) async {
    final bool _isConnected = await GetIt.I<ConnectivityCore>().checkConnect();
    final File _file = await _getFileLanguage(languageCode);
    if(!_isConnected)
      return await _file.readAsString();
    final String path = _file.path;
    final bool checkExists = await File(path).exists();
    // Nếu file chưa tồn tại, tạo file
    if (!checkExists) {
      await _file.create();
    }
    final String localVersion = LocalStoreManager.getString(UserSettings.languageVersion);
    final String serverVersion = appSettings.appSettings.versionLanguage;
    if (localVersion.isNullOrEmpty) {
      return await _updateJsonLanguage(languageCode, _file, serverVersion);
    } else {
      if (_isNewVersionLanguage(localVersion, serverVersion)) {
        return await _updateJsonLanguage(languageCode, _file, serverVersion);
      }
      return await _file.readAsString();
    }
  }

  // Update version ngôn ngữ
  Future<void> dialogUpdateVersion({String languageCode = 'vi'}) async {
    final String localVersion = LocalStoreManager.getString(UserSettings.languageVersion);
    final String serverVersion = appSettings.appSettings.versionLanguage;
    final File _file = await _getFileLanguage(languageCode);
    if (_isNewVersionLanguage(localVersion, serverVersion)) {
      updateLanguageDialog();
      final String jsonLanguage = await _updateJsonLanguage(languageCode, _file, serverVersion);
      Map<String, dynamic> jsonMap = <String, dynamic>{};
      jsonMap = json.decode(jsonLanguage);
      _localizedStrings = jsonMap.map((String key, dynamic value) {
        return MapEntry<String, String>(key, value.toString());
      });
    }
    return;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final Iterable<Locale> _supportLocale;

  _AppLocalizationsDelegate(this._supportLocale);

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return _supportLocale.map((e) => e.languageCode).contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
