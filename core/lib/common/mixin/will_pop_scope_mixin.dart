// import 'package:flutter/cupertino.dart';
//
// mixin MixWillPopScope<T extends StatefulWidget> on State<T> {
//   ModalRoute<dynamic>? _route;
//
//
//   @override
//   void didChangeDependencies({bool isPop = true}) {
//     super.didChangeDependencies();
//     _route?.removeScopedWillPopCallback(() async => Future<bool>.value(isPop));
//     _route = ModalRoute.of(context);
//     _route?.addScopedWillPopCallback(() async => Future<bool>.value(isPop));
//   }
//
// }
