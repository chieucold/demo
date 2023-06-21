import 'package:core/common/bnd_cupertino_will_pop_scope/src/cupertino_will_pop_scope_page_transitions_builder.dart';
import 'package:core/common/common.dart';
import 'package:core/common/connectivity/connectivity_core.dart';
import 'package:core/common/core_module.dart';
import 'package:core/components/bnd_date_time_picker_dropdown.dart';
import 'package:core/components/curved_navigation_bar/custom_navigator/bloc/hide_appear_navigator_bloc.dart';
import 'package:core/components/in_app_update/in_app_update_service.dart';
import 'package:core/components/keyboard_dissmiss_widget/bnd_keyboard_dismiss_widget.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/shared_preferences/local_storage_manager.dart';
import 'package:exam/core/common/custom_navigator_observers.dart';
// import 'package:exam/core/common/custom_navigator_observers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:core/components/core_component.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:guide/core/common/injection.dart';
import 'package:guide/core/widgets/tab/bloc/top_bar_guide_bloc.dart';
import 'package:guide/features/presentation/home_page/bloc/vg0_user_follow_bloc.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom_theme.dart';
import 'package:vitan_edu/features/presentation/app/bloc/app_bloc.dart';
import 'package:vitan_edu/features/presentation/app/bloc/app_state.dart';
import 'package:vitan_edu/features/route/route_generator.dart';
import 'package:core/components/notification/bloc/noti_count_bloc.dart';

class BndApp extends StatefulWidget {
  const BndApp({Key? key}) : super(key: key);

  @override
  _BndAppState createState() => _BndAppState();
}

class _BndAppState extends State<BndApp> {
  final AppBloc _appBloc = getItSuper();
  final NotiCountBloc _notiCountBloc = getItSuper();
  final HideAppearNavigatorBloc _hideAppearBloc = getItSuper();
  final bool isFirstRun = LocalStoreManager.getBool(SharedPreferenceKey.isFirstRun);
  final ConnectivityCore _connectivityCore = getItSuper();
  final TabbarGuideBloc _tabbarGuideBloc = getItSuper();
  final Vg0UserFollowBloc _vg0userFollowBloc = getItGuide();

  @override
  void initState() {
    super.initState();
    // InAppUpdateService().checkForUpdate();
    _init();

    //Cấu hình chỉ dọc
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);

    //Cấu hình màu status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ));
  }

  void _init() {
    _appBloc.init();
    _connectivityCore.handlerNetWorkChange();
  }

  @override
  Widget build(BuildContext context) {
    return _app();
  }

  String _getLanguage(AppState state) {
    if (state is AppChangeState) return state.appModel.language;
    return 'vi';
  }

  bool _getTheme(AppState state) {
    if (state is AppChangeState) return state.appModel.theme;
    return true;
  }

  Widget _app() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (BuildContext context) => _appBloc,
        ),
        BlocProvider<NotiCountBloc>(
          create: (context) => _notiCountBloc,
        ),
        BlocProvider<HideAppearNavigatorBloc>(
          create: (context) => _hideAppearBloc,
        ),
        BlocProvider<TabbarGuideBloc>(
          create: (context) => _tabbarGuideBloc..initial(),
        ),
        BlocProvider<Vg0UserFollowBloc>(
          create: (context) => _vg0userFollowBloc,
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (_, AppState state) => DynamicTheme(
          context,
          isThemeLight: _getTheme(state),
          child: MaterialApp(
              navigatorObservers: [CustomNavigatorObserver()],
              debugShowCheckedModeBanner: false,
              theme: getTheme(context, _getTheme(state)).copyWith(
                  pageTransitionsTheme: PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  // TargetPlatform.android: ZoomPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
                },
                // builders: {
                //   TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                //     transitionType: SharedAxisTransitionType.horizontal,
                //   ),
                //   TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                //     transitionType: SharedAxisTransitionType.horizontal,
                //   ),
                // },
                // builders: {
                //   TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
                //   TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
                // },
              )),
              useInheritedMediaQuery: true,
              // darkTheme: darkThemeData(context),
              navigatorKey: navigatorKey,
              locale: Locale(_getLanguage(state)),
              supportedLocales: AppLocalizations.locales,
              localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: AppLocalizations.localeResolutionCallback,
              initialRoute: appInitRouteName,
              onGenerateRoute: RouteGeneratorSuper.generatorRoute,
              builder: EasyLoading.init(
                builder: (BuildContext context, Widget? child) {
                  EasyLoading.instance.userInteractions = false;
                  return BndKeyboardDismissWidget(
                    dismissOnCapturedTaps: true,
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: ScreenUtilInit(
                        designSize: const Size(360, 690),
                        minTextAdapt: true,
                        splitScreenMode: true,
                        builder: () => Container(
                          child: kDebugMode
                              ? Stack(
                                  children: <Widget>[
                                    child!,
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        child: FloatingActionButton(
                                          onPressed: () {
                                            BNDAlice.showScreen();
                                          },
                                          backgroundColor: Colors.red,
                                          child: const Text("A"),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : child!,
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
