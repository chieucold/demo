import 'package:flutter/cupertino.dart';

class BndBottomNavigatorWidget extends StatelessWidget {
  final Widget? bottomButton;
  final Widget body;

  const BndBottomNavigatorWidget({Key? key, required this.body, this.bottomButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Expanded(child: body), bottomButton ?? const SizedBox.shrink()],
    );
  }
}
