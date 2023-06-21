import 'dart:async';
import 'package:api/common/model/app_settings/app_settings_entity.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/common.dart';
import 'package:core/common/core_module.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:guide/features/route/route_const.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uni_links/uni_links.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

class DeepLink {
  BehaviorSubject<Uri?> _currentLink = BehaviorSubject<Uri?>();
  late StreamSubscription _subscription;

  Stream<Uri?> get stream => _currentLink.stream;

  AppSettings _appSettings = getItSuper<AppSettings>();

  Future<void> init() async {
    try {
      Uri? initialUri = await getInitialUri();
      if (initialUri != null) {
        /// khi app chưa mở thì sẽ bắn vào InitURI để chờ app mở có link
        logger.d('initialUri $initialUri');
        // _currentLink.add(initialUri);
        _checkUriGo(initialUri);
      }

      _subscription = uriLinkStream.listen((Uri? uri) {
        /// khi app đang mở sẽ bắn URI trực tiếp
        logger.d('Handle DeepLink $uri');
        // _currentLink.add(uri!);
        _checkUriGo(uri ?? Uri());
      });
    } catch (e) {
      logger.e(e);
    }
  }

  void dispose() {
    _subscription.cancel();
    _currentLink.close();
  }

  /// test deep link
  /// usr/bin/xcrun simctl openurl booted "unilinks://web.vitan.dev/commondata/short-link-detail/8459"

  void _checkGo(Uri uri) async {
    String _url = uri.host + uri.path;
    final String _path = await Utils.regexPath(uri.path) ?? '';
    final List<ConfigDeepLink> _listConfig = _appSettings.configs.configDeepLink ?? [];

    int _getConfigIndex = _listConfig.indexWhere((element) => element.url == _path);
    if (_getConfigIndex >= 0) {
      final ConfigDeepLink _config = _listConfig[_getConfigIndex];
      final String _objectId = await Utils.regexUrlId(_config.regexId, _url) ?? '';

      notificationRouteGoTo(
          _config.objectType, navigatorKey!.currentState!.context, _config.action, int.parse(_config.blockId),
          objectId: int.parse(_objectId));
    }
  }

  String? _getRouteName(Uri uri) {
    final String _currentScreen = LocalStoreManager.getString(UserSettings.currentScreen);
    final BlockEnum blockType = parseStringToBlockEnum(uri.path.replaceAll('/', ''));
    print('CurrentScreen $_currentScreen');
    switch (blockType) {
      case BlockEnum.Learn:
        return _currentScreen != avl1HomePage && uri.path != _currentScreen ? avl1HomePage : null;
      case BlockEnum.Exam:
        return _currentScreen != vhe8HomeScreenRouteName && uri.path != _currentScreen ? vhe8HomeScreenRouteName : null;

      case BlockEnum.Guide:
        return _currentScreen != vg1HomePage && uri.path != _currentScreen ? vg1HomePage : null;
      default:
        return null;
    }
  }

  void _checkUriGo(Uri uri) {
    // if (uri.host.contains('vitanedu.com')) {
    //   final String? _routeName = _getRouteName(uri);
    //   if (_routeName != null) {
    //     Navigator.pushNamed(navigatorKey!.currentState!.context, _routeName);
    //   }
    // } else {
    _checkGo(uri);
    // }
  }
}
