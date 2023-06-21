import 'package:contest/main.dart';
import 'package:contest/theme/contest_theme.dart';
import 'package:core/assets/images/images.dart';
import 'package:core/common/bnd_cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:core/common/mixin/will_pop_scope_mixin.dart';
import 'package:core/components/curved_navigation_bar/custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class NavigatorBarContest extends StatefulWidget {
  NavigatorBarContest({Key? key, required this.index}) : super(key: key);

  late int index;

  @override
  _NavigatorBarContestState createState() => _NavigatorBarContestState();
}

class _NavigatorBarContestState extends State<NavigatorBarContest>{
  int get _index => widget.index;

  List<String> listIconWidget = <String>[
    Images.home_icon,
    Images.group_icon,
    Images.icNavigatorCompetition,
    Images.library_icon,
  ];

  List<Widget?> widgets = <Widget>[];

  late List<InfoScreen> listInfoScreen;

  @override
  void initState() {
    super.initState();
    listInfoScreen = <InfoScreen>[
      InfoScreen(
          Images.svgAssets(
            Images.home_icon,
            color: const Color.fromRGBO(169, 179, 194, 1),
            height: 20,
            width: 20,
          ),
          'Cuộc thi',
          const ContestHome()),
      InfoScreen(
          Images.svgAssets(
            Images.group_icon,
            color: const Color.fromRGBO(169, 179, 194, 1),
            height: 20,
            width: 20,
          ),
          'Trò chơi',
          Container()),
      InfoScreen(
        Images.svgAssets(
          Images.icNavigatorCompetition,
          color: const Color.fromRGBO(169, 179, 194, 1),
          height: 20,
          width: 20,
        ),
        'Hoa hậu',
        Container(),
      ),
      // InfoScreen(
      //   Images.svgAssets(Images.library_icon),
      //   'Thư viện',
      //   const VHE10InformationMemberExamPage(isIndividual: true),
      //   avt: BnDAvatar(
      //     imageUrl: currentUser?.avatar ?? '',
      //     name: currentUser?.name ?? 'A',
      //     size: 21,
      //   ),
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    settingColorIcon(statusIcon: true);
    return ConditionalWillPopScope(
        onWillPop: () async {
          // await LocalStoreManager.setCurrentScreen(vhs5HomeSupperAppRouteName);
          return Future<bool>.value(true);
        },
        shouldAddCallback: false,
        child: Scaffold(body: buildBody()));
  }

  Widget buildBody() => NavigatorBarCustom(
        colorLine: ContestTheme.primaryContestColor,
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
        colorIcon: ContestTheme.primaryContestColor,
      );

  void settingColorIcon({bool statusIcon = true}) {
    final Widget svgPicture = Images.svgAssets(
      listIconWidget[_index],
      color: (statusIcon) ? Colors.white : const Color.fromRGBO(169, 179, 194, 1),
      height: 22,
      width: 22,
    );
    final InfoScreen infoScreen = InfoScreen(
        svgPicture, listInfoScreen[_index].contentItems, listInfoScreen[_index].screenWidget,
        avt: listInfoScreen[_index].avt);

    listInfoScreen[_index] = infoScreen;
  }
}
