// import 'package:flutter/material.dart';
// import 'package:ks_global/generated/l10n.dart';
//
// class SearchBar extends StatelessWidget {
//   final void Function(String value) onTyped;
//   final double elevation;
//
//   const SearchBar({
//     Key key,
//     this.onTyped,
//     this.elevation = 0,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: elevation,
//       borderRadius: BorderRadius.all(Radius.circular(5.0)),
//       color: Theme.of(context).cardColor,
//       child: Container(
//         height: 38,
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(horizontal: 15),
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: TextField(
//                 textAlign: TextAlign.center,
//                 onChanged: onTyped,
//                 maxLines: 1,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: Colors.grey,
//                   ),
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//                   border: InputBorder.none,
//                   hintText: S.of(context).search,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
