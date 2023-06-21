class AppConfig {
  static const String idAppName = "BnD.CE.MobileApp";
  static const List<String> idAppScopes = <String>["profile", "email", "offline_access"]; //, "openid"
  static const int competitionTimeWaitSeconds = 5 * 60;
  static const int pageSize = 20;
  static int timerTimeOut = const Duration(minutes: 3).inMilliseconds;
}
