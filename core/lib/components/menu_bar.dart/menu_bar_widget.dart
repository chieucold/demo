import 'package:core/assets/images/images.dart';
import 'package:core/common/app_settings/app_settings.dart';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/constants/block_settings.dart';
import 'package:core/common/dimension.dart';
import 'package:core/common/enums/block_enum.dart';
import 'package:core/common/route/route_core_const.dart';
import 'package:core/components/appbar/app_bar_supper_app.dart';
import 'package:core/components/block/widgets/block_item_widget.dart';
import 'package:core/components/bnd_touch.dart';
import 'package:core/components/core_component.dart';
import 'package:core/language/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MenuBarWidgetWidget extends StatefulWidget {
  final int idMiniApp;
  final Color colorMiniApp;

  const MenuBarWidgetWidget({Key? key, required this.idMiniApp, this.colorMiniApp = const Color(0xFF006600)})
      : super(key: key);

  @override
  _MenuBarWidgetState createState() => _MenuBarWidgetState();
}

class _MenuBarWidgetState extends State<MenuBarWidgetWidget> with SingleTickerProviderStateMixin {
  int idMiniApp = 0;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    idMiniApp = widget.idMiniApp;
    _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this)..forward();
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: BndTouch(
        onPressed: () =>
            _openDialogBoxFromTop(context, listBlock, idMiniApp, _controller, widget.colorMiniApp, _onClose),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 3,
              child: Container(
                child: Images.svgAssets(Images.menu_icon, color: CoreColor.textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onClose() async {
    _controller.reverse();
    // ignore: always_specify_types
    await Future.delayed(const Duration(milliseconds: 200), () => Navigator.pop(context));
  }
}

// ignore: always_specify_types
Future _openDialogBoxFromTop(
  BuildContext context,
  List<BlockModel> listBlock,
  int idMiniApp,
  AnimationController _controller,
  Color colorChoose,
  Function onClose,
) {
  // late final String product_menu_text = 'product_menu';
  // late final String company_text = 'BnD Career EcoSystem';
  final String _title = GetIt.I<AppSettings>().getAppSettings.configs.bndSuperAppTitle;
  _controller.forward();
  return showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (BuildContext _animation, Animation<double> _secondaryAnimation, Animation<double> _child) {
      late final Animation<Offset> _offsetAnimationTop =
          Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, -2.0)).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ));
      late final Animation<Offset> _offsetAnimationBottom =
          Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, 2.0)).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ));
      return Scaffold(
        backgroundColor: CoreColor.white,
        appBar: AppBarSupperApp(height: 0, backgroundColor: CoreColor.dialogBackgroundColor),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: SlideTransition(
                    position: _offsetAnimationTop,
                    child: Container(
                      // height: height(context, 660),
                      padding: EdgeInsets.only(top: height(context, 12)),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(60)),
                          color: CoreColor.backgroundMenuBarColor,
                          boxShadow: CoreColor.listShadowMenuApp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  _buidlListMenu(
                                      idMiniApp,
                                      colorChoose,
                                      onClose,
                                      listBlock.where((BlockModel e) => e.mainFunction == true).toList(),
                                      context,
                                      _title.toUpperCase(),
                                      Images.imgVitanMenu,
                                      onTitleTap: () => Navigator.pop(context)),
                                  Container(
                                      padding: CoreColor.paddingBodyDefault,
                                      child: Divider(color: CoreColor.dividerColor, height: 24)),
                                  _buidlListMenu(
                                    idMiniApp,
                                    colorChoose,
                                    onClose,
                                    listBlock.where((BlockModel e) => e.mainFunction == false).toList(),
                                    context,
                                    '$_title+'.toUpperCase(),
                                    Images.imgVitanPlusMenu,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // height: height(context, 40),
                            padding: const EdgeInsets.only(bottom: 8, top: 8),
                            child: Row(
                              children: <Widget>[
                                // Container(
                                //   padding: EdgeInsets.only(left: width(context, 40)),
                                //   child: GestureDetector(
                                //     behavior: HitTestBehavior.opaque,
                                //     onTap: () {},
                                //     child: Text(company_text, style: textStyleBodyDefault),
                                //   ),
                                // ),
                                // Container(
                                //   margin: EdgeInsets.only(left: width(context, 40)),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //     children: <Widget>[
                                //       GestureDetector(
                                //         behavior: HitTestBehavior.opaque,
                                //         onTap: () {},
                                //         child: Container(
                                //           padding: EdgeInsets.only(left: width(context, 15)),
                                //           child: const Icon(Icons.face, size: 20),
                                //         ),
                                //       ),
                                //       GestureDetector(
                                //         behavior: HitTestBehavior.opaque,
                                //         onTap: () {},
                                //         child: Container(
                                //           padding: EdgeInsets.only(left: width(context, 15)),
                                //           child: const Icon(Icons.add_call, size: 20),
                                //         ),
                                //       ),
                                //       // GestureDetector(
                                //       //   behavior: HitTestBehavior.opaque,
                                //       //   onTap: () {},
                                //       //   child: Container(
                                //       //     padding: EdgeInsets.only(left: width(context, 15)),
                                //       //     child: const Icon(Icons.adb, size: 20),
                                //       //   ),
                                //       // ),
                                //       GestureDetector(
                                //         behavior: HitTestBehavior.opaque,
                                //         onTap: () => goToSettingApp(context, settingsApp),
                                //         child: Container(
                                //           padding: EdgeInsets.only(left: width(context, 15)),
                                //           child: const Icon(Icons.settings, size: 20),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: _offsetAnimationBottom,
                child: BndTouch(
                  // behavior: HitTestBehavior.opaque,
                  onPressed: () {
                    onClose();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 12, bottom: MediaQuery.of(context).viewPadding.bottom + 12),
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: CoreColor.textWhiteColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: CoreColor.closeButton)),
                        child: Center(
                          child: Icon(
                            Icons.close,
                            color: CoreColor.closeButton,
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buidlListMenu(int idMiniApp, Color colorChoose, Function onClose, List<BlockModel> _listBlock,
    BuildContext context, String text, String imgTitle,
    {Function()? onTitleTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BndTouch(
          onPressed: onTitleTap == null
              ? null
              : () async {
                  if (idMiniApp == BlockEnum.SupperApp.index) {
                    await onClose();
                  } else {
                    await onClose();
                    onTitleTap();
                  }
                },
          child: Container(
            // height: height(context, 40),
            padding: const EdgeInsets.only(top: 12),
            margin: EdgeInsets.only(left: width(context, 50)),
            // child: Text(
            //   text,
            //   style: textStyleBodyDefaultBold,
            //   textAlign: TextAlign.left,
            // ),
            child: BNDImage(imageUrl: imgTitle, height: 26),
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.only(top: 20),
          itemCount: _listBlock.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final BlockModel _item = _listBlock[index];
            return BndTouch(
              onPressed: idMiniApp == _item.id
                  ? null
                  : () async {
                      final String route = _item.routeName;
                      if (route.isEmpty || _item.isActive != true)
                        showMessage(AppLocalizations.of(context)!.translate('the_function_is_developing'));
                      else {
                        await onClose();
                        if (route == vhs5HomeSupperAppRouteName) {
                          Navigator.pop(context);
                        } else {
                          await Navigator.pushNamedAndRemoveUntil(
                              context, route, ModalRoute.withName(vhs5NavigatorBarWidget));
                        }
                      }
                      // Navigator.pushNamed(context, vhs5HomeSupperAppRouteName);
                    },
              // behavior: HitTestBehavior.opaque,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: width(context, 30), right: width(context, 30)),
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      color: idMiniApp == _item.id ? CoreColor.white : null,
                    ),
                    child: BlockItemWidget(item: _item),
                    // child: ListTile(
                    //   dense: true,
                    //   // title: Text(
                    //   //   AppLocalizations.of(context)!.translate(_listBlock[index].title),
                    //   //   style: textStyleBodyDefault.copyWith(
                    //   //       fontWeight: idMiniApp == _listBlock[index].id ? FontWeight.w700 : null,
                    //   //       color: idMiniApp == _listBlock[index].id ? CoreColor.textWhiteColor : CoreColor.textColor),
                    //   // ),
                    //   title: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: <Widget>[
                    //       Text(
                    //         AppLocalizations.of(context)!.translate(_listBlock[index].name),
                    //         style: textStyleBodyDefault.copyWith(
                    //             fontWeight: FontWeight.w700,
                    //             color:
                    //                 idMiniApp == _listBlock[index].id ? CoreColor.textWhiteColor : CoreColor.textColor),
                    //       ),
                    //       Container(
                    //         child: Text(
                    //           AppLocalizations.of(context)!.translate(_item.title),
                    //           style: textStyleBodySmall.copyWith(
                    //               color: idMiniApp == _listBlock[index].id
                    //                   ? CoreColor.textWhiteColor
                    //                   : CoreColor.textColor),
                    //           maxLines: 1,
                    //           overflow: TextOverflow.ellipsis,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    //   leading: Images.svgAssets(_item.icon),
                    // ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 4),
        ),
      ],
    ),
  );
}

class ListBlock {
  int id;
  String title;
  IconData icon;
  Color backgroundColor;

  ListBlock(this.id, this.title, this.icon, this.backgroundColor);
}
