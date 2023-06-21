// import 'package:core/assets/images/images.dart';
// import 'package:core/common/app_settings/app_settings.dart';
// import 'package:core/common/constants/block_settings.dart';
// import 'package:core/components/appbar/app_bar_supper_app.dart';
// import 'package:core/components/core_component.dart';
// import 'package:core/language/app_localizations.dart';
// import 'package:core/common/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:vitan_edu/core/common/injection.dart';

// import 'package:vitan_edu/core/theme/custom.dart';
// import 'package:core/common/dimension.dart';

// class MenuBar extends StatefulWidget {
//   @override
//   _MenuBarState createState() => _MenuBarState();
// }

// class _MenuBarState extends State<MenuBar> with SingleTickerProviderStateMixin {
//   int indexMenu = 1;
//   late final AnimationController _controller;
//   final AppSettings appSettings = getItSuper();

//   @override
//   void initState() {
//     super.initState();
//     // setState(() {
//     //   final Random random = Random();
//     //   final int randomNumber = random.nextInt(7);
//     //   indexMenu = randomNumber;
//     //   print(indexMenu);
//     // });
//     _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this)..forward();
//     _controller.reverse();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: width(context, 12)),
//       child: GestureDetector(
//         behavior: HitTestBehavior.opaque,
//         child: Images.svgAssets(
//           Images.menu_icon,
//           color: CustomTheme.textColor,
//         ),
//         onTap: () =>
//             // ignore: always_specify_types
//             {
//           _openDialogBoxFromTop(
//               context, listBlock, indexMenu, _controller, appSettings.getAppSettings.configs.bndCompanyTitle)
//         },
//       ),
//     );
//   }
// }

// // ignore: always_specify_types
// Future _openDialogBoxFromTop(BuildContext context, List<BlockModel> listBlock, int indexMenu,
//     AnimationController _controller, String company_text) {
//   late final String product_menu_text = 'product_menu';
//   // late final String company_text = 'BnD Career EcoSystem';
//   _controller.forward();
//   return showGeneralDialog(
//     context: context,
//     barrierLabel: '',
//     barrierDismissible: true,
//     transitionDuration: const Duration(milliseconds: 400),
//     pageBuilder: (BuildContext _animation, Animation<double> _secondaryAnimation, Animation<double> _child) {
//       late final Animation<Offset> _offsetAnimationTop =
//           Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, -2.0)).animate(CurvedAnimation(
//         parent: _controller,
//         curve: Curves.linear,
//       ));
//       late final Animation<Offset> _offsetAnimationBottom =
//           Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, 2.0)).animate(CurvedAnimation(
//         parent: _controller,
//         curve: Curves.linear,
//       ));
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBarSupperApp(height: 0, backgroundColor: CustomTheme.dialogBackgroundColor),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 child: SlideTransition(
//                   position: _offsetAnimationTop,
//                   child: Container(
//                     height: height(context, 660),
//                     padding: EdgeInsets.only(top: height(context, 55)),
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.only(bottomRight: Radius.circular(60)),
//                       color: CustomTheme.dialogBackgroundColor,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Container(
//                           height: height(context, 40),
//                           margin: EdgeInsets.only(left: width(context, 50)),
//                           child: Text(
//                             AppLocalizations.of(context)!.translate(product_menu_text).toUpperCase(),
//                             style: textStyleBodyDefault,
//                             textAlign: TextAlign.left,
//                           ),
//                         ),
//                         Container(
//                             height: height(context, 505),
//                             child: MediaQuery.removePadding(
//                               context: context,
//                               removeTop: true,
//                               child: ListView.builder(
//                                   itemCount: listBlock.length,
//                                   itemBuilder: (BuildContext context, int index) {
//                                     return GestureDetector(
//                                       behavior: HitTestBehavior.opaque,
//                                       child: Column(
//                                         children: <Widget>[
//                                           Container(
//                                             margin:
//                                                 EdgeInsets.only(left: width(context, 30), right: width(context, 30)),
//                                             decoration: BoxDecoration(
//                                               borderRadius: const BorderRadius.all(Radius.circular(12)),
//                                               color: indexMenu == index ? CustomTheme.primaryColor : null,
//                                             ),
//                                             child: Column(
//                                               children: <Widget>[
//                                                 ListTile(
//                                                   dense: true,
//                                                   onTap: () {
//                                                     if (index != 1)
//                                                       showMessage(AppLocalizations.of(context)!
//                                                           .translate('the_function_is_developing'));
//                                                     //Navigator.pushNamed(context, vhs5HomeSupperAppRouteName);
//                                                   },
//                                                   title: Text(
//                                                     AppLocalizations.of(context)!.translate(listBlock[index].title),
//                                                     style: textStyleBodyDefault.copyWith(
//                                                         color: indexMenu == index
//                                                             ? CustomTheme.textWhiteColor
//                                                             : CustomTheme.textColor),
//                                                   ),
//                                                   // leading: Icon(listBlock[index].icon,
//                                                   //     size: 22,
//                                                   //     color: indexMenu == index
//                                                   //         ? CustomTheme.textWhiteColor
//                                                   //         : CustomTheme.iconDialogColor),
//                                                   leading: Images.svgAssets(listBlock[index].icon),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           ((index + 1) % 3 == 0 && index != listBlock.length)
//                                               ? Container(
//                                                   margin: EdgeInsets.only(
//                                                       left: width(context, 30), right: width(context, 30)),
//                                                   child: Divider(
//                                                     thickness: 1,
//                                                     color: CustomTheme.dividerColor,
//                                                   ),
//                                                 )
//                                               : const SizedBox(),
//                                         ],
//                                       ),
//                                     );
//                                   }),
//                             )),
//                         Container(
//                           height: height(context, 40),
//                           child: Row(
//                             children: <Widget>[
//                               Container(
//                                 padding: EdgeInsets.only(left: width(context, 30)),
//                                 child: GestureDetector(
//                                   behavior: HitTestBehavior.opaque,
//                                   onTap: () {},
//                                   child: Text(company_text, style: textStyleBodyDefault, maxLines: 2),
//                                 ),
//                               ),
//                               // Container(
//                               //   margin: EdgeInsets.only(left: width(context, 40)),
//                               //   child: Row(
//                               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               //     children: <Widget>[
//                               //       GestureDetector(
//                               //         behavior: HitTestBehavior.opaque,
//                               //         onTap: () {},
//                               //         child: Container(
//                               //           padding: EdgeInsets.only(left: width(context, 15)),
//                               //           child: const Icon(Icons.face, size: 20),
//                               //         ),
//                               //       ),
//                               //       GestureDetector(
//                               //         behavior: HitTestBehavior.opaque,
//                               //         onTap: () {},
//                               //         child: Container(
//                               //           padding: EdgeInsets.only(left: width(context, 15)),
//                               //           child: const Icon(Icons.add_call, size: 20),
//                               //         ),
//                               //       ),
//                               //       // GestureDetector(
//                               //       //   behavior: HitTestBehavior.opaque,
//                               //       //   onTap: () {},
//                               //       //   child: Container(
//                               //       //     padding: EdgeInsets.only(left: width(context, 15)),
//                               //       //     child: const Icon(Icons.adb, size: 20),
//                               //       //   ),
//                               //       // ),
//                               //       GestureDetector(
//                               //         behavior: HitTestBehavior.opaque,
//                               //         onTap: () => goToSettingApp(context, settingsApp),
//                               //         child: Container(
//                               //           padding: EdgeInsets.only(left: width(context, 15)),
//                               //           child: const Icon(Icons.settings, size: 20),
//                               //         ),
//                               //       ),
//                               //     ],
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: SlideTransition(
//                   position: _offsetAnimationBottom,
//                   child: GestureDetector(
//                     behavior: HitTestBehavior.opaque,
//                     onTap: () {
//                       _controller.reverse();
//                       // ignore: always_specify_types
//                       Future.delayed(const Duration(milliseconds: 400), () {
//                         Navigator.pop(context);
//                       });
//                     },
//                     child: Container(
//                         width: 70,
//                         height: 70,
//                         decoration: BoxDecoration(
//                             color: CustomTheme.textWhiteColor,
//                             shape: BoxShape.circle,
//                             border: Border.all(color: CustomTheme.closeButton)),
//                         child: Center(
//                           child: Icon(
//                             Icons.close,
//                             color: CustomTheme.closeButton,
//                           ),
//                         )),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
