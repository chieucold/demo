import 'package:core/common/common.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:matomo/matomo.dart';

class Tracking {
  String get currentScreen => LocalStoreManager.getString(UserSettings.currentScreen);

  void initialize({String? userId}) {
    MatomoTracker().initialize(siteId: 3, url: ApiPath.trackingUrl, visitorId: userId);
  }

  void trackEvent(String title, {String eventAction = 'Button-Click', int? eventValue}) {
    MatomoTracker.trackEvent(title, eventAction, eventValue: eventValue, widgetName: currentScreen);
  }

  void trackScreen(String screenName, {String eventName = ''}) {
    MatomoTracker.trackScreenWithName(screenName, eventName);
  }
}
