// import 'package:core/common/color/core_color.dart';
// import 'package:core/common/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'src/nav_button.dart';
// import 'src/nav_custom_painter.dart';
//
// class CurvedNavigationBar extends StatefulWidget {
//   final List<InfoScreen> listInfoScreen;
//
//   final int index;
//   final Color color;
//   final Color backgroundColor;
//   final ValueChanged<int>? onTap;
//   final Curve animationCurve;
//   final Duration animationDuration;
//   final double height;
//   final Color colorsIcon;
//   final Color primaryColor;
//
//   CurvedNavigationBar({
//     Key? key,
//     this.index = 0,
//     this.color = Colors.white,
//     required this.primaryColor,
//     this.backgroundColor = Colors.white,
//     this.onTap,
//     this.animationCurve = Curves.easeOut,
//     this.animationDuration = const Duration(milliseconds: 300),
//     this.height = 70.0,
//     this.colorsIcon = Colors.brown,
//     required this.listInfoScreen,
//   })  : assert(listInfoScreen.length >= 1),
//         assert(0 <= index && index < listInfoScreen.length),
//         assert(0 <= height && height <= 75.0),
//         super(key: key);
//
//   @override
//   CurvedNavigationBarState createState() => CurvedNavigationBarState();
// }
//
// class CurvedNavigationBarState extends State<CurvedNavigationBar> with SingleTickerProviderStateMixin {
//   late double _startingPos;
//   int _endingIndex = 0;
//   late double _pos;
//   double _buttonHide = 0;
//   late Widget _icon;
//   late AnimationController _animationController;
//   late int _length;
//
//   // List<String> _contentItems = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _icon = widget.listInfoScreen[widget.index].item;
//     _length = widget.listInfoScreen.length;
//     _pos = widget.index / _length;
//     _startingPos = widget.index / _length;
//     _animationController = AnimationController(vsync: this, value: _pos);
//     _animationController.addListener(() {
//       setState(() {
//         _pos = _animationController.value;
//         final double endingPos = _endingIndex / widget.listInfoScreen.length;
//         final double middle = (endingPos + _startingPos) / 2;
//         if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
//           _icon = widget.listInfoScreen[_endingIndex].item;
//         }
//         _buttonHide = (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
//       });
//     });
//   }
//
//   @override
//   void didUpdateWidget(CurvedNavigationBar oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.index != widget.index) {
//       final double newPosition = widget.index / _length;
//       _startingPos = _pos;
//       _endingIndex = widget.index;
//       _animationController.animateTo(newPosition, duration: widget.animationDuration, curve: widget.animationCurve);
//     }
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Container(
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.bottomCenter,
//         children: <Widget>[
//           // widget.listInfoScreen[widget.index].nameScreen,
//           Positioned(
//             bottom: -40 - (75.0 - widget.height),
//             left: Directionality.of(context) == TextDirection.rtl ? null : _pos * size.width,
//             right: Directionality.of(context) == TextDirection.rtl ? _pos * size.width : null,
//             width: size.width / _length,
//             child: Container(
//               alignment: AlignmentDirectional.bottomCenter,
//               child: Transform.translate(
//                 offset: Offset(
//                   0,
//                   -(1 - _buttonHide) * 80,
//                 ),
//                 child: Material(
//                   color: widget.primaryColor,
//                   type: MaterialType.circle,
//                   child: Padding(
//                     padding: const EdgeInsets.all(13.0),
//                     child: _icon,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0 - (75.0 - widget.height),
//             child: CustomPaint(
//               painter: NavCustomPainter1(_pos, _length, widget.primaryColor, Directionality.of(context)),
//               child: Container(
//                 height: widget.height,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0 - (75.0 - widget.height),
//             child: CustomPaint(
//               painter: NavCustomPainter(_pos, _length, widget.color, Directionality.of(context)),
//               child: Container(
//                 height: widget.height,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0 - (75.0 - widget.height),
//             child: SizedBox(
//                 height: 100.0,
//                 child: Row(
//                     children: widget.listInfoScreen.map((InfoScreen item) {
//                   return NavButton(
//                     onTap: _buttonTap,
//                     position: _pos,
//                     length: _length,
//                     index: widget.listInfoScreen.indexOf(item),
//                     child: Center(child: Container(child: item.item)),
//                   );
//                 }).toList())),
//           ),
//           Positioned(
//             bottom: 0 - (58.0 - widget.height),
//             left: Directionality.of(context) == TextDirection.rtl ? null : _pos * size.width,
//             right: Directionality.of(context) == TextDirection.rtl ? _pos * size.width : null,
//             width: size.width / _length,
//             child: Center(
//               child: (widget.listInfoScreen != null)
//                   ? Text(widget.listInfoScreen[widget.index].contentItems, style: textStyleBodySmallest.copyWith())
//                   : Container(),
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0 - (100.0 - widget.height),
//             child: SizedBox(
//                 height: 100.0,
//                 child: Row(
//                     children: widget.listInfoScreen.map((InfoScreen item) {
//                   return NavButton(
//                     onTap: _buttonTap,
//                     position: _pos,
//                     length: _length,
//                     index: widget.listInfoScreen.indexOf(item),
//                     child: Center(
//                         child: Container(
//                             child: Text(
//                       widget.listInfoScreen[widget.listInfoScreen.indexOf(item)].contentItems,
//                       style: textStyleBodySmallest.copyWith(color: CoreColor.textColor1),
//                     ))),
//                   );
//                 }).toList())),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void setPage(int index) {
//     _buttonTap(index);
//   }
//
//   void _buttonTap(int index) {
//     if (widget.onTap != null) {
//       widget.onTap!(index);
//     }
//     final double newPosition = index / _length;
//     setState(() {
//       _startingPos = _pos;
//       _endingIndex = index;
//       _animationController.animateTo(newPosition, duration: widget.animationDuration, curve: widget.animationCurve);
//     });
//   }
// }
//
// // class InfoScreen {
// //   late final SvgPicture item;
// //   final String contentItems;
// //   final Widget nameScreen;
// //
// //   InfoScreen(this.item, this.contentItems, this.nameScreen);
// // }
