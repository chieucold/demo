import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/bloc/bloc_index.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/common.dart';
import 'package:core/common/route/open_container_wrapper.dart';
import 'package:core/components/advertisement_slider_widget/advertisement_slider_widget.dart';
import 'package:core/components/bnd_pull_to_refresh.dart';
import 'package:core/components/dialog/bnd_general_dialog.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/global_variable_resource.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:exam/core/common/injection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:vitan_edu/core/common/deep_link.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/common/vitan_user.dart';
import 'package:vitan_edu/core/service/awsome_notification_service.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:core/common/dimension.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/appbar/app_bar_home_widget.dart';
import 'package:vitan_edu/features/presentation/app/bloc/app_bloc.dart';
import 'package:core/components/button/button_title_widget.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs5_supper_app_home/view/widgets/vhs5_block_list_widget.dart';
import 'package:common/components/event/widget/event_list_widget.dart';
import 'package:exam/features/domain/usecases/realtime/realtime_usecases.dart';
import 'package:vitan_edu/features/presentation/vsr/vsr3_search/view/page/vsr3_search_screen.dart';

class VHS5SupperAppHomeScreen extends StatefulWidget {
  VHS5SupperAppHomeScreen({Key? key}) : super(key: key);

  @override
  State<VHS5SupperAppHomeScreen> createState() => _VHS5SupperAppHomeScreenState();
}

class _VHS5SupperAppHomeScreenState extends State<VHS5SupperAppHomeScreen>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  final AppSettings appSettings = getItSuper();
  final AppBloc _appBloc = getItSuper();
  final VitanUser _vitanUser = getItSuper();
  final DeepLink _deepLink = getItSuper();

  final GlobalVariableResource _globalVariableResource = GetIt.I();
  late RefreshController _refreshController;
  late int selectedIndex = 0;
  late int _lockTime;
  bool _isPause = false;
  final AwesomeNotificationService awesomeNotificationService = getItSuper();

  Widget _height(double height) => SizedBox(height: height);

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();

    // init deeplink listener
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _deepLink.init();
    });

    _refreshController = RefreshController(initialRefresh: false);
    _lockTime = LocalStoreManager.getInt(UserSettings.keyLockTime);
    _vitanUser.checkVersion();
    BlocProvider.of<AppBloc>(context).stream.listen((event) {
      _lockTime = event.appModel.durationLockScreen;
      logger.d(_lockTime);
    });
    _initNotification();
  }

  Future<void> _initNotification() async {
    await awesomeNotificationService.initializeNoticationApp();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _disposeNotification();
    _deepLink.dispose();
    LocalStoreManager.setString(UserSettings.currentScreen, '');
    super.dispose();
  }

  void _disposeNotification() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      //await InAppReviewService.incrementTime(isBackGround: false);
      if (_appBloc.isPassCode && _isPause) {
        if (!_globalVariableResource.isOpenFile) {
          DateTime _timeLock = DateTime.parse(LocalStoreManager.getString(UserSettings.keyCurrentTimeLock));
          int _compareTime = DateTime.now().difference(_timeLock).inMinutes;
          logger.d(_compareTime);
          if (_compareTime >= _lockTime) {
            await showLockScreen(context,
                streamController: _appBloc.verificationNotifier, onComplete: (String text) => Navigator.pop(context));
            _isPause = false;
          }
        } else {
          _globalVariableResource.setOpenFile(false);
        }
      }
    } else if (state == AppLifecycleState.paused) {
      if (_appBloc.isPassCode) {
        LocalStoreManager.setString(UserSettings.keyCurrentTimeLock, DateTime.now().toString());
        _isPause = true;
      }
      //await InAppReviewService.incrementTime(isBackGround: true);

      logger.d('OnPause');
    } else if (state == AppLifecycleState.detached) {
      logger.d('TurnOff App');
      LocalStoreManager.setString(UserSettings.currentScreen, '');
    }
  }

  void initOnRealTime(BuildContext context) {
    getIt<RealtimeUsecases>().onCompetitionUserStart(context);
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: CustomTheme.textWhiteColor,
      appBar: AppBarHomeWidget(
        title: appSettings.configs.bndSuperAppTitle,
        titleWidget: Images.svgAssets(Images.icLogoHome),
        secondaryTitle: AppLocalizations.of(context)!.translate('home'),
        action: _actionAppbar,
        // hasLeading: false,
        appbarBackgroundColor: CustomTheme.supperAppThemeColor,
        blockEnum: BlockEnum.SupperApp,
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    initOnRealTime(context);
    return Container(
      // margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: BNDPullToRefresh(
        controller: _refreshController,
        onRefresh: () {
          setState(() {
            selectedIndex++;
          });
          Future<void>.delayed(const Duration(milliseconds: 500), () {
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          });
        },
        child: GestureDetector(
          onTap: () async {
            // await LocalStoreManager.clear();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: AdvertisementSliderWidget(
                      key: Key('home_AdvertisementSliderWidget_${selectedIndex.toString()}'),
                      numberItem: 4,
                      position: AdvertisementPositionEnum.supperAppHome,
                      slideControllerSize: 10,
                      slideControllerColorActive: CustomTheme.supperAppThemeColor,
                      slideControllerMargin: 14),
                  margin: EdgeInsets.only(top: height(context, 10)),
                ),
                _height(28),
                VHS5BlockListWidget(key: Key('home_VHS5Block${selectedIndex.toString()}')),
                _height(20),
                // Divider(thickness: 6, color: CustomTheme.driverColor),
                // VHS5SaleListWidget(),
                // Divider(thickness: 6, color: CustomTheme.driverColor),
                EventListWidget(key: Key('home_VHS5Event${selectedIndex.toString()}')),
                _height(CoreColor.paddingBottom)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _actionAppbar => Container(
        // margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        margin: EdgeInsets.fromLTRB(0, 12, 60.sp, 6),
        // padding: EdgeInsets.symmetric(horizontal: 12),
        child: OpenContainerWrapper(
          closedBuilder: (_, VoidCallback openContainer) {
            return BndTouch(
              onPressed: openContainer,
              child: Container(
                // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: CustomTheme.white),
                child:
                    Images.svgAssets(Images.icSearch, width: 14, height: 14, color: CustomTheme.cricleBackgroundColor),
              ),
            );
          },
          openRadius: 16,
          // openElevation: 0.0,
          // closedElevation: 0.0,
          // closedColor: CustomTheme.transparent,
          // openColor: CustomTheme.transparent,
          // transitionDuration: Duration(milliseconds: 5000),
          pageGoTo:
              VSR3SearchScreen(blockModel: listBlockWithVitan.firstWhere((e) => e.id == BlockEnum.SupperApp.index)),
        ),
      );

  @override
  bool get wantKeepAlive => true;
}
