import 'package:contest/widget/app/views/contest_app.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const ContestHome();
//   }
// }
class ContestHome extends StatelessWidget {
  final String url;
  const ContestHome({Key? key, this.url = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContestApp(url: url);
  }
}
