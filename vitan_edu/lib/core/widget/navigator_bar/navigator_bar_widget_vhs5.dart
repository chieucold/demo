import 'dart:io';
import 'package:core/assets/images/images.dart';
import 'package:core/common/bnd_cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:core/common/core_module.dart';
import 'package:core/components/core_component.dart';
import 'package:core/components/curved_navigation_bar/custom_navigator/custom_navigator.dart';
import 'package:core/language/app_localizations.dart';
import 'package:core/model/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitan_edu/core/common/common_module.dart';
import 'package:vitan_edu/core/common/injection.dart';
import 'package:vitan_edu/core/theme/custom.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs5_supper_app_home/view/page/vhs5_supper_app_home_screen.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs6_personal/view/page/vhs6_personal_screen.dart';
import 'package:core/components/notification/bloc/noti_count_bloc.dart';
import 'package:core/components/notification/bloc/noti_count_state.dart';
import 'package:core/components/vhs9_notification/view/page/vhs9_notification_screen.dart';
import 'package:vitan_edu/features/presentation/vhs/vhs_vitan_net/vhs_vitan_net_screen.dart';
import 'package:vitan_edu/features/route/route_goto.dart';

// ignore: must_be_immutable
class NavigatorBarWidgetVHS5 extends StatefulWidget {
  NavigatorBarWidgetVHS5({Key? key, required this.index}) : super(key: key);
  late int index;

  @override
  _NavigatorBarWidgetVHS5State createState() => _NavigatorBarWidgetVHS5State();
}

class _NavigatorBarWidgetVHS5State extends State<NavigatorBarWidgetVHS5> {
  int get _index => widget.index;
  DateTime? currentBackPressTime;

  final GlobalKey<_NavigatorBarVHS5AvatarWidgetState> _avatarKey = GlobalKey();
  final GlobalKey<_NavigatorBarVHS5AvatarWidgetState> _avatarSecondKey = GlobalKey();
  List<String> listIconWidget = <String>[
    Images.home_icon,
    Images.icEcosystemHome,
    Images.icNotiOutline,
    Images.library_icon,
  ];

  List<Widget?> widgets = <Widget>[];
  late List<InfoScreen> listInfoScreen;

  @override
  void initState() {
    super.initState();
    listInfoScreen = getInfoScreen();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.translate('confirm_back_super_app')),
      ));
      return Future.value(false);
    }else{
      return Future.value(true);
    }
  }


  @override
  Widget build(BuildContext context) {
    settingColorIcon(statusIcon: true);

    return WillPopScope(
        onWillPop: () async {
          return await onWillPop();
        },
        child: Scaffold(body: buildBody()));
  }

  List<InfoScreen> getInfoScreen() {
    return <InfoScreen>[
      InfoScreen(
        Images.svgAssets(
          Images.icNavigatorCompetition,
          color: const Color.fromRGBO(169, 179, 194, 1),
          height: 20,
          width: 20,
        ),
        AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('VitanEdu'),
        VHS5SupperAppHomeScreen(),
      ),
      InfoScreen(
        Images.svgAssets(
          Images.icEcosystemHome,
          color: const Color.fromRGBO(169, 179, 194, 1),
          height: 20,
          width: 20,
        ),
        AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('VitanNet'),
        const VHSVitanNetScreen(),
        secondAvt: BNDImage(imageUrl: Images.imgVitanNetActive),
        avt: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomTheme.supperAppThemeColor,
          ),
          child: BNDImage(imageUrl: Images.imgVitanNet, width: 24, height: 24),
        ),
      ),
      InfoScreen(
        Images.svgAssets(
          Images.icNotiOutline,
          color: const Color.fromRGBO(169, 179, 194, 1),
          height: 20,
          width: 20,
        ),
        AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('notification'),
        VHS9NotificationScreen(onTap: notificationRouteGoTo, goToFilter: goToVHS9NotificationFilter),
        iconNotification: _buildIconNoti(),
      ),
      InfoScreen(
        Images.svgAssets(Images.library_icon),
        AppLocalizations.of(navigatorKey!.currentState!.context)!.translate('personal'),
        VHS6PersonalScreen(
          onInfoUpdated: () {
            _avatarKey.currentState!.update();
            _avatarSecondKey.currentState!.update();
          },
        ),
        avt: NavigatorBarVHS5AvatarWidget(key: _avatarKey, radius: avtSize),
        secondAvt: NavigatorBarVHS5AvatarWidget(key: _avatarSecondKey, radius: avtSecondSize),
      ),
    ];
  }

  Widget buildBody() {
    return BlocBuilder<NotiCountBloc, NotiCountState>(
      builder: (context, state) {
        listInfoScreen[2].iconNotification = _buildIconNoti(countNotification: state.data.totalNotSeen);
        return NavigatorBarCustom(
          menuActiveIndex: _index,
          onTap: (int index) {
            setState(() {
              settingColorIcon(statusIcon: false);
              widget.index = index;
              settingColorIcon(statusIcon: true);
            });
          },
          height: 55,
          listInfoScreen: listInfoScreen,
          colorIcon: CustomTheme.supperAppThemeColor,
          colorLine: CustomTheme.supperAppThemeColor,
        );
      },
    );
  }

  void settingColorIcon({bool statusIcon = true}) {
    final Widget svgPicture = Images.svgAssets(
      listIconWidget[_index],
      color: (statusIcon) ? Colors.white : const Color.fromRGBO(169, 179, 194, 1),
      height: 22,
      width: 22,
    );
    listInfoScreen[_index].item = svgPicture;
  }

  Widget _buildIconNoti({int countNotification = 0}) {
    if (countNotification == 0) {
      return const SizedBox.shrink();
    }
    return Container(
      height: 8,
      width: 8,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
    );
  }
}

class NavigatorBarVHS5AvatarWidget extends StatefulWidget {
  final double radius;

  const NavigatorBarVHS5AvatarWidget({Key? key, required this.radius}) : super(key: key);

  @override
  _NavigatorBarVHS5AvatarWidgetState createState() => _NavigatorBarVHS5AvatarWidgetState();
}

class _NavigatorBarVHS5AvatarWidgetState extends State<NavigatorBarVHS5AvatarWidget> {
  late UserInfo? _currentUser = getItSuper<AuthenticateApp>().getUserInfo();

  @override
  Widget build(BuildContext context) {
    return BnDAvatar(
      imageUrl: _currentUser?.avatar ?? '',
      name: _currentUser?.name ?? "",
      size: widget.radius,
    );
  }

  void update() {
    setState(() {
      _currentUser = getItSuper<AuthenticateApp>().getUserInfo();
    });
  }
}
