import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:core/components/curved_navigation_bar/custom_navigator/bloc/hide_appear_navigator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'modal_custom_navigator.dart';

const double avtSize = 21;
const double avtSecondSize = 11;

class NavigatorBarCustom extends StatefulWidget {
  final double height;
  final List<InfoScreen> listInfoScreen;
  final double spaceLeftandRight;
  final double heightIcon;
  final Color colorIcon;
  final ValueChanged<int>? onTap;
  final int durationAnimation;
  final int menuActiveIndex;
  final Color? colorLine;
  final double fontTitle;
  final PageController? pageController;
  final PreferredSizeWidget? appbar;

  const NavigatorBarCustom({
    Key? key,
    required this.height,
    this.spaceLeftandRight = 10,
    this.heightIcon = 40,
    required this.listInfoScreen,
    this.onTap,
    this.colorIcon = Colors.brown,
    this.durationAnimation = 350,
    this.menuActiveIndex = 0,
    this.colorLine,
    this.fontTitle = 14,
    this.pageController,
    this.appbar,
  }) : super(key: key);

  @override
  _NavigatorBarCustomState createState() => _NavigatorBarCustomState();
}

class _NavigatorBarCustomState extends State<NavigatorBarCustom> with SingleTickerProviderStateMixin {
  int _index = 0;
  late AnimationController _animationController;
  late double newCoordinates = 0, oldCoordinates = 0;
  late PageController _pageController;
  final HideAppearNavigatorBloc _hideAppearBloc = GetIt.I<HideAppearNavigatorBloc>();

  InfoScreen get _currentScreen => widget.listInfoScreen[_index];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      value: _index / widget.listInfoScreen.length,
    );
    _pageController = widget.pageController ?? PageController(keepPage: true, initialPage: widget.menuActiveIndex);
    if (widget.menuActiveIndex > 0)
      Future<void>.delayed(const Duration(milliseconds: 200), () {
        _buttonTap(widget.menuActiveIndex);
      });
    _pageController.addListener(() {
      _buttonTap(_pageController.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Stack(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              alignment: AlignmentDirectional.bottomStart,
              // ignore: always_specify_types
              children: [
                Scaffold(
                  appBar: widget.appbar,
                  body: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: widget.listInfoScreen.map((InfoScreen e) => e.screenWidget).toList(),
                  ),
                ),
                _buildModal(),
                // IndexedStack(
                //   children: widget.listInfoScreen.map((InfoScreen e) => e.screenWidget).toList(),
                //   index: _index,
                // ),
                //widget.listInfoScreen[_index].screenWidget,

                // Icon when choose
                GestureDetector(
                  onTap: () {
                    final bool isShowDialog = widget.listInfoScreen[_index].widgetPopup != null;
                    if (isShowDialog) {
                      _hideAppearBloc.changeStatus(false);
                    }
                  },
                  child: Container(
                    height: widget.heightIcon,
                    width: widget.heightIcon,
                    alignment: AlignmentDirectional.bottomStart,
                    margin: EdgeInsetsDirectional.only(
                        bottom: paddingBottomIcon(newCoordinates, oldCoordinates, _animationController.value,
                            widget.height - widget.heightIcon / 2 + 1),
                        start: widget.spaceLeftandRight +
                            (MediaQuery.of(context).size.width - widget.spaceLeftandRight * 2) *
                                _animationController.value +
                            (MediaQuery.of(context).size.width - widget.spaceLeftandRight * 2) /
                                (widget.listInfoScreen.length * 2) +
                            -widget.heightIcon +
                            widget.heightIcon / 2),
                    decoration: BoxDecoration(
                        color: widget.listInfoScreen[_index].avt != null ? CoreColor.white : widget.colorIcon,
                        borderRadius: BorderRadius.all(
                          Radius.circular((MediaQuery.of(context).size.width - widget.spaceLeftandRight * 2) /
                              widget.listInfoScreen.length *
                              2),
                        ),
                        border: Border.all(color: widget.colorIcon, width: 1)),
                    child: widget.listInfoScreen[_index].avt ??
                        Center(
                          child: Transform(
                            child: widget.listInfoScreen[_index].item,
                            alignment: FractionalOffset.center,
                            transform: Matrix4.identity()..rotateZ(0),
                          ),
                        ),
                  ),
                ),
                Container(
                  height: widget.height,
                  alignment: AlignmentDirectional.bottomCenter,
                  child: CustomPaint(
                      painter: NavigatorBarBackground(widget.listInfoScreen,
                          context: context,
                          index: _animationController.value * widget.listInfoScreen.length,
                          spaceLeftandRight: widget.spaceLeftandRight,
                          sizeIcon: widget.heightIcon),
                      child: Container()),
                ),
                Container(
                  height: widget.height,
                  alignment: AlignmentDirectional.bottomCenter,
                  child: CustomPaint(
                      painter: NavigatorBar(widget.listInfoScreen,
                          index: _animationController.value * widget.listInfoScreen.length,
                          context: context,
                          spaceLeftAndRight: widget.spaceLeftandRight,
                          sizeIcon: widget.heightIcon,
                          colorLine: widget.colorLine ?? const Color.fromRGBO(86, 162, 91, 1)),
                      child: Container()),
                ),
                Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  margin: EdgeInsetsDirectional.only(start: widget.spaceLeftandRight, end: widget.spaceLeftandRight),
                  height: widget.height,
                  child: Column(
                    // ignore: always_specify_types
                    children: [
                      Expanded(
                        // flex: 1,
                        child: Container(
                            child: Row(
                                children: widget.listInfoScreen.map((InfoScreen infoScreen) {
                          return Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    final int index = widget.listInfoScreen.indexOf(infoScreen);
                                    final bool isShowDialog = widget.listInfoScreen[index].widgetPopup != null;
                                    final Function? onTap = widget.listInfoScreen[index].onTap;
                                    if (onTap != null)
                                      onTap(context);
                                    else {
                                      if (isShowDialog) {
                                        _hideAppearBloc.changeStatus(false);
                                      }
                                      _pageController.jumpToPage(index);
                                    }
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(top: 8, left: 0, right: 0, bottom: 0),
                                      child: Column(
                                        // ignore: always_specify_types
                                        children: [
                                          // Icon default
                                          Expanded(flex: 1, child: _buildIconNavigator(infoScreen)),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              widget.listInfoScreen[widget.listInfoScreen.indexOf(infoScreen)]
                                                  .contentItems,
                                              textAlign: TextAlign.center,
                                              style: textStyleBodySmall.copyWith(
                                                  fontSize: widget.fontTitle,
                                                  color: (widget.listInfoScreen.indexOf(infoScreen) != _index)
                                                      ? const Color.fromRGBO(159, 170, 185, 1)
                                                      : Colors.black),
                                            ),
                                          ),
                                        ],
                                      ))));
                        }).toList())),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _buttonTap(int index) {
    // if (isShowDialog) widget.listInfoScreen[index] = widget.listInfoScreen[_index];

    if (_index != index) {
      setState(() {
        newCoordinates = index.toDouble() / widget.listInfoScreen.length;
        oldCoordinates = _index.toDouble() / widget.listInfoScreen.length;
        //final int timeAnimation = (index > _index) ? index - _index : _index - index;
        _index = index;
        _animationController.animateTo(_index / widget.listInfoScreen.length,
            duration: Duration(milliseconds: widget.durationAnimation), curve: Curves.easeOut);
        if (widget.onTap != null) widget.onTap!(_index);
      });
    }
  }

  Widget _buildModal() {
    if (_currentScreen.widgetPopup != null) {
      return ModalCustomNavigator(popupWidget: _currentScreen.widgetPopup!);
    }

    return const SizedBox();
  }

  double paddingBottomIcon(
      double newCoordinates, double oldCoordinates, double currentCoordinates, double heightContainer) {
    double heightIcon = 0;
    if (newCoordinates == 0 && oldCoordinates == 0) {
      return heightContainer;
    }
    if (newCoordinates < oldCoordinates) {
      heightIcon = heightContainer -
          ((currentCoordinates > ((newCoordinates + (oldCoordinates - newCoordinates) / 2)))
              ? ((oldCoordinates - currentCoordinates) *
                  heightContainer /
                  (oldCoordinates - ((newCoordinates + (oldCoordinates - newCoordinates) / 2))))
              : ((currentCoordinates - newCoordinates) *
                  heightContainer /
                  (((newCoordinates + (oldCoordinates - newCoordinates) / 2)) - newCoordinates)));
    } else {
      heightIcon = heightContainer -
          ((currentCoordinates < (oldCoordinates + (newCoordinates - oldCoordinates) / 2))
              ? ((currentCoordinates - oldCoordinates) *
                  heightContainer /
                  ((oldCoordinates + (newCoordinates - oldCoordinates) / 2) - oldCoordinates))
              : ((newCoordinates - currentCoordinates) *
                  heightContainer /
                  (newCoordinates - (oldCoordinates + (newCoordinates - oldCoordinates) / 2))));
    }

    return heightIcon;
  }

  Widget _buildIconNavigator(InfoScreen infoScreen) {
    final List<InfoScreen> _info = widget.listInfoScreen;
    if (infoScreen == _info[_index]) {
      return const SizedBox.shrink();
    }
    return infoScreen.secondAvt ??
        infoScreen.avt ??
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              top: 0,
              right: -8,
              child: infoScreen.iconNotification ?? const SizedBox(),
            ),
            infoScreen.item
          ],
        );
  }
}

class NavigatorBarBackground extends CustomPainter {
  final double sizeIcon;
  final List<InfoScreen> listInfoScreen;
  final double index;
  final double spaceLeftandRight;
  final BuildContext context;

  NavigatorBarBackground(this.listInfoScreen,
      {required this.index, required this.sizeIcon, required this.context, required this.spaceLeftandRight}) {
    widthCurve = sizeIcon * 2;
    spaceLeftCurve = spaceLeftandRight +
        index * (MediaQuery.of(context).size.width - spaceLeftandRight * 2) / listInfoScreen.length +
        (MediaQuery.of(context).size.width - spaceLeftandRight * 2) / (listInfoScreen.length * 2) -
        widthCurve / 2;
  }

  double widthNavigatorBar = 0;
  double heightNavigatorBar = 0;
  double widthCurve = 0;
  double spaceLeftCurve = 0;
  double spaceLeftCurve1 = 0;
  double spaceCurver = 3;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(spaceLeftCurve, 0)
      ..quadraticBezierTo(spaceLeftCurve + widthCurve / 7, widthCurve * 0.45 * (1 / 20),
          spaceLeftCurve + widthCurve / 5, widthCurve * 0.45 * (1 / 4))
      ..quadraticBezierTo(spaceLeftCurve + widthCurve / 2, widthCurve * 0.52, spaceLeftCurve + widthCurve * 4 / 5,
          widthCurve * 0.45 * (1 / 4))
      ..quadraticBezierTo(
          spaceLeftCurve + widthCurve * 6 / 7, widthCurve * 0.45 * (1 / 20), spaceLeftCurve + widthCurve, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class NavigatorBar extends CustomPainter {
  final double sizeIcon;
  final List<InfoScreen> listInfoScreen;
  final double index;
  final double spaceLeftAndRight;
  final BuildContext context;
  final Color colorLine;
  double widthNavigatorBar = 0;
  double heightNavigatorBar = 0;
  double widthCurve = 0;
  double spaceLeftCurve = 0;
  double spaceLeftCurve1 = 0;
  double heightCurve = 0.45;
  double spaceCurver = 3;

  NavigatorBar(this.listInfoScreen,
      {required this.context,
      required this.sizeIcon,
      required this.index,
      required this.spaceLeftAndRight,
      required this.colorLine}) {
    widthCurve = sizeIcon * 2;
    spaceLeftCurve = spaceLeftAndRight +
        index * (MediaQuery.of(context).size.width - spaceLeftAndRight * 2) / listInfoScreen.length +
        (MediaQuery.of(context).size.width - spaceLeftAndRight * 2) / (listInfoScreen.length * 2) -
        widthCurve / 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = colorLine;

    final Paint paint2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.white;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(spaceLeftCurve, 0)
      ..quadraticBezierTo(spaceLeftCurve + widthCurve / 7, widthCurve * 0.45 * (1 / 20),
          spaceLeftCurve + widthCurve / 5, widthCurve * 0.45 * (1 / 4))
      ..quadraticBezierTo(spaceLeftCurve + widthCurve / 2, widthCurve * 0.52, spaceLeftCurve + widthCurve * 4 / 5,
          widthCurve * 0.45 * (1 / 4))
      ..quadraticBezierTo(
          spaceLeftCurve + widthCurve * 6 / 7, widthCurve * 0.45 * (1 / 20), spaceLeftCurve + widthCurve, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);

    final Path path2 = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height);
    path2.close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class InfoScreen {
  Widget item;
  String contentItems;
  Widget screenWidget;
  Widget? avt;
  Widget? secondAvt;
  Widget? iconNotification;
  Function? onTap;
  Widget? widgetPopup;

  InfoScreen(
    this.item,
    this.contentItems,
    this.screenWidget, {
    this.onTap,
    this.avt,
    this.secondAvt,
    this.iconNotification,
    this.widgetPopup,
  });
}
