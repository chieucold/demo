import 'dart:io';

import 'package:intl/intl.dart';

const String localeVN = 'vi_VN';
const String localeEnUS = 'en_US';
const String localeFormat = localeVN;
final NumberFormat _numFormat = NumberFormat("#,###", localeFormat);
final NumberFormat numFormatDecimal = NumberFormat("#,##0.00", localeFormat);
final NumberFormat _numFormatCurrency = NumberFormat("###,###,###.##", localeFormat);
final NumberFormat _numFormatCurrencyNotDecimal = NumberFormat("###,###,###", localeFormat);
final DateFormat _dateFormatFull = DateFormat("dd/MM/yyyy HH:mm:ss");
final DateFormat _dateFormatDMYHHmm = DateFormat("dd/MM/yyyy HH:mm");
final DateFormat _dateFormatDMY = DateFormat("dd/MM/yyyy");
final DateFormat _formatYMDHMS = DateFormat("yyyyMMddHHmmss");
final DateFormat _dateFormatDM = DateFormat("dd/MM");
final DateFormat _dateFormatY = DateFormat("yyyy");
final DateFormat _dateFormatM = DateFormat("MM");
final DateFormat _dateFormatD = DateFormat("dd");
final DateFormat _dateFormatHours = DateFormat("hh");
final DateFormat _dateFormatMinute = DateFormat("mm");
final DateFormat _dateFormatDMYcf = DateFormat("yyyy-MM-ddTHH:mm:ss");
final DateFormat _dateFormat24h = DateFormat("hh:mm - dd/MM/yyyy");
final DateFormat _dayFormat24h = DateFormat("hh:mm - dd/MM");
final NumberFormat numFormatter = NumberFormat("#,##0", localeFormat);
final DateFormat formatDate = DateFormat("dd-MM-yyyy");
final DateFormat formatHours = DateFormat("hh:mm a");
final DateFormat formatDateTime = DateFormat("hh:mm a dd/MM/yyyy");
final DateFormat _formatMMMYYYY = DateFormat("MMMM yyyy");
final DateFormat _formatMMYYYY = DateFormat("MM/yyyy");
final DateFormat _formatEEE = DateFormat("EEE");
final DateFormat _formatWithOutYY = DateFormat("HH:mm dd MMM");
final DateFormat formatime24h = DateFormat("HH:mm");
final DateFormat formaDuration = DateFormat("HH:mm:ss");
final DateFormat formatDMYHHmm = DateFormat("dd/MM/yyyy HH:mm");
final DateFormat _dateFormatYMD = DateFormat("yyyy-MM-dd");

extension StringExtension on String {
  String get capitalize => this.isNullOrEmpty ? "" : '${this[0].toUpperCase()}${substring(1)}';

  String get firstLowerCase => this.isNullOrEmpty ? "" : '${this[0].toLowerCase()}${substring(1)}';

  String get capitalizeFirstofEach =>
      replaceAll(RegExp(' +'), ' ').split(" ").map((String str) => str.capitalize).join(" ");

  String get camelCase => replaceAll("-", " ").split(" ").map((String str) => str.capitalize).join().firstLowerCase;
}

extension StringNullExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

const _kb = 1024;
const _M = 1000000;
//exp: 1%
const _minRate = 1;

extension Nilly on num {
  num get safeNum => this;

  num roundAsFixed(int frag) {
    return toStringAsFixed(frag).strSafeNum;
  }

  num get safePeriodMonth {
    final n = this;
    final x = (n == 0) ? 12 : n;
    return x;
  }

  //109.139.000 -> '109,14'
  //90.000.000 -> '90'
  //90.123.000 -> '90,12'
  //### 900.123 -> '900.123' //hâm => 900 tỉ 123 triệu
  //### min: _M
  //------------
  //9,012 -> '9,01'
  //90,812 -> '90,81'
  //90,689 -> '90,69'
  //90 -> '90'
  //999 -> '999'
  //999,123 -> '999,12'
  //999,999 -> '999,99'
  //max: 999,999 (because: 1000 triệu, hâm)
  String get millionFormat {
    final n = safeNum;
    final d = (n >= _M) ? (n / _M) : n;
    return d._decimalFormat();
  }

  String pad({int pad = 2}) {
    return safeNum.toString().padLeft(2, '0');
  }

  String get mbFormat {
    final n = safeNum / _kb;
    return "${n._decimalFormat()} Mb";
  }

  String get sign => safeNum >= 0 ? "+" : "";

  String get currencyFormat => _numFormatCurrency.format(safeNum);

  String get currencyFormatNotDecimal => _numFormatCurrencyNotDecimal.format(safeNum);

  //for int, x >= 1000
  String get numFormat => _numFormat.format(safeNum);

  //đã chia cho total
  //=> nhân với 100
  String get dividedPercentFormat {
    //return "${(safeNum * 100)}%";
    return "${(safeNum * 100)._decimalFormat()}%";
  }

  //for double, nullable
  String get percentFormat {
    return "${safeNum._decimalFormat()}%";
  }

  String get interestRateFormat {
    return "${_real._decimalFormat()}%";
  }

  //có thể đã đc api chia 100
  //0.9 => 90
  //0.2 => 20
  //1.1 => 1.1
  //12 => 12
  num get _real {
    final n = safeNum;
    return (n >= _minRate) ? n : n * 100;
  }

  //for double not null
  String _decimalFormat({int fix = 1}) =>
      (this is int) ? numFormat : _numFormatCurrency.format(double.parse(toStringAsFixed(fix)));

  String get signNumFormat => "$sign$numFormat";
}

extension Dilly on DateTime? {
  String get formatDuration => (this != null) ? formaDuration.format(this!) : "";

  String get formatDM => (this != null) ? _dateFormatDM.format(this!) : "";

  String get formatYY => (this != null) ? _dateFormatY.format(this!) : "";

  String get formatMM => (this != null) ? _dateFormatM.format(this!) : "";

  String get formatDD => (this != null) ? _dateFormatD.format(this!) : "";

  String get formatDMY => (this != null) ? _dateFormatDMY.format(this!) : "";

  String get formatYMDHMS => (this != null) ? _formatYMDHMS.format(this!) : "";

  String get formatDMYHHmm => (this != null) ? _dateFormatDMYHHmm.format(this!) : "";

  String get formatFull => (this != null) ? _dateFormatFull.format(this!) : "";

  String get format24h => (this != null) ? _dateFormat24h.format(this!) : "";

  String get formatdHMDM => (this != null) ? _dayFormat24h.format(this!) : "";

  String get formatDateHours => (this != null) ? _dateFormatHours.format(this!) : "";

  String get formatDateMinute => (this != null) ? _dateFormatMinute.format(this!) : "";

  String get formatMMMYYYY => (this != null) ? _formatMMMYYYY.format(this!) : "";
  String get formatEEE => (this != null) ? _formatEEE.format(this!) : "";
  String get formatMMYYYY => (this != null) ? _formatMMYYYY.format(this!) : "";
  String get formatWithOutYY => (this != null) ? _formatWithOutYY.format(this!) : "";
  String get formatYMD => (this != null) ? _dateFormatYMD.format(this!) : "";

  String get chatTime {
    if (this == null) return '';
    final DateTime now = DateTime.now();
    if (now.formatDMY == this.formatDMY) {
      return formatHours.format(this!);
    }
    return DateFormat("hh:mm a dd/MM").format(this!);
  }
}

const pdf = '.pdf';

extension Silly on String? {
  String? get unBreak => this != null ? this!.replaceAll('\n', '') : null;
  bool isPdf({bool get = false}) {
    final url = this != null ? this!.toLowerCase() : null;
    return get || !Platform.isIOS ? url?.contains(pdf) ?? false : url?.endsWith(pdf) ?? false;
  }

  String get toPdfPath {
    var path = this != null ? this!.substring(this!.lastIndexOf("://") + 1).replaceAll("/", "_") : "";
    if (!path.isPdf()) path += pdf;
    return path;
  }

  //f: formatted
  int? get fToInt => int.tryParse(this!.replaceAll(",", ""))?.safeNum as int;

  int get trimLength => this?.replaceAll(' ', '').length ?? 0;

  int get safeLength => this?.length ?? 0;

  String get spreadFormat => "${this} m2";

  //2020-03-15T09:21:26.000Z
  DateTime? get strToDateCf {
    return isNullOrEmpty ? null : _dateFormatDMYcf.parse(this!);
  }

  DateTime? get strToDate {
    return isNullOrEmpty ? null : _dateFormatDMY.parse(this!);
  }

  String get parenthesesFormat => "($this)";

  int? get toInt => this != null ? int.tryParse(this!) : null;

  String? get formatPhoneNumber {
    var phone = this;
    if (phone != null) {
      if (phone.startsWith("+84")) return phone;
      phone = this!.replaceAll("[^\\d.]", "");
      if (phone.startsWith('0')) {
        phone = this!.replaceFirst('0', '84');
      }
      final builder = StringBuffer();
      builder.write('+');
      if (phone.startsWith('84')) {
        builder.write(phone);
      } else {
        builder
          ..write('84')
          ..write(phone);
      }
      return builder.toString();
    }
    return null;
  }

  String? get correctUrl {
    final url = this;
    if (url != null) {
      var start = url.indexOf("http://");
      if (start < 0) start = url.indexOf("https://");
      return start <= 0 ? url : url.substring(start);
    }
    return null;
  }

  String get strDecimal {
    return strSafeNum._decimalFormat();
  }

  num get strSafeNum {
    if (isNullOrEmpty) return 0;
    return double.tryParse(this!)!.safeNum;
  }

  String get normalSearchText {
    if (this == null) return '';
    return this!.trim().toLowerCase();
  }
}
