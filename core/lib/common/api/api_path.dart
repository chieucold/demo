// ignore_for_file: constant_identifier_names
class ApiPath {
  static const String COMMON_DATA = 'http://117.4.243.193:8083';
  static const String EXAM = 'http://117.4.243.193:8085'; //'http://117.4.243.193:8085';
  static const String GUIDE = 'http://117.4.243.193:8084'; //'http://117.4.243.193:8085';
  static const String SYSTEM = 'http://117.4.243.193:8081';
  static const String LEARN = 'http://117.4.243.193:8082';
  static const String REALTIME = 'http://117.4.243.193:8086';
  static const String Id = 'https://id.vitan.dev'; //'https://vitakia.ap.ngrok.io';
  static const String UPLOAD = 'https://fs1.bndtech.vn/upload';
  static const String signalrUrl = 'https://rt.vitan.dev/systemHub';
  static const String payment = 'https://web.vitan.dev';
  static const String event = 'http://117.4.243.193:8088';

  // static const String GUIDE = 'https://man.vitanedu.com/';
  // static const String COMMON_DATA = 'https://man.vitanedu.com/';
  // static const String EXAM = 'https://man.vitanedu.com/';
  // static const String SYSTEM = 'https://man.vitanedu.com/';
  // static const String LEARN = 'https://man.vitanedu.com/';
  // static const String Id = 'https://id.vitanedu.com';
  // static const String REALTIME = 'http://rt.vitanedu.com';
  // static const String UPLOAD = 'https://fs1.bndtech.vn/upload';
  // static const String signalrUrl = 'https://rt.vitanedu.com/systemHub';
  // static const String payment = 'https://vitanedu.com';
  // static const String event = 'https://vitanedu.com';

  static const String contestUrl = 'https://contest.vitan.dev/';
  static const String trackingUrl = 'https://ba.vitan.dev/matomo.php';
}

class ApiPathRelease {
  static const String GUIDE = 'https://man.vitanedu.com/';
  static const String COMMON_DATA = 'https://man.vitanedu.com/';
  static const String EXAM = 'https://man.vitanedu.com/';
  static const String SYSTEM = 'https://man.vitanedu.com/';
  static const String LEARN = 'https://man.vitanedu.com/';
  static const String REALTIME = 'http://rt.vitanedu.com';
  static const String Id = 'https://id.vitanedu.com';
  static const String UPLOAD = 'https://fs1.bndtech.vn/upload';
  static const String signalrUrl = 'https://rt.vitanedu.com/systemHub';
  static const String payment = 'https://vitanedu.com';
  static const String event = 'https://vitanedu.com';

  // static const String GUIDE = 'https://man.vitan.dev/';
  // static const String COMMON_DATA = 'https://man.vitan.dev/';
  // static const String EXAM = 'https://man.vitan.dev/';
  // static const String SYSTEM = 'https://man.vitan.dev/';
  // static const String LEARN = 'https://man.vitan.dev/';
  // static const String REALTIME = 'http://rt.vitan.dev';
  // static const String Id = 'https://id.vitan.dev';
  // static const String UPLOAD = 'https://fs1.bndtech.vn/upload';
  // static const String signalrUrl = 'https://rt.vitan.dev/systemHub';
  // static const String payment = 'https://web.vitan.dev';
}

class CoreSystemAPIPath {
  static const String getUploadServer = "/api/system/v1/public/Server/GetUploadServer";
  static const String createGroup = "/api/system/v1/public/Group/Save";
}

class CoreCommonDataAPIPath {
  static const String logMobileError = "/api/common-data/v1/public/LogMobile/LogError";
  static const String logMobileInfo = "/api/common-data/v1/public/LogMobile/LogError";
}
