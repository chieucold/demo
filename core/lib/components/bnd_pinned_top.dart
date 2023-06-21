import 'package:flutter/material.dart';

class BndPinnedTop extends StatefulWidget {
  const BndPinnedTop({Key? key, required this.headerWidget, required this.bodyWidget}) : super(key: key);
  final Widget headerWidget;
  final Widget bodyWidget;

  @override
  _BndPinnedTopState createState() => _BndPinnedTopState();
}

class _BndPinnedTopState extends State<BndPinnedTop> {
  final ScrollController _controller = ScrollController();
  final GlobalKey _keyPinnedWidget = GlobalKey();

  double? _offsetTababar;

  bool isShow = false;

  @override
  void initState() {
    _controller.addListener(() {
      _getWidgetInfo();
      if (isShow == false && _offsetTababar != null) {
        if (_controller.offset >= _offsetTababar!) {
          isShow = true;
          setState(() {});
        }
      }

      if (isShow == true && _offsetTababar != null) {
        if (_controller.offset < _offsetTababar!) {
          isShow = false;
          setState(() {});
        }
      }
      print('~~~> ${_controller.offset}');
    });
    super.initState();
  }

  void _getWidgetInfo() {
    final RenderBox renderBox = _keyPinnedWidget.currentContext?.findRenderObject() as RenderBox;

    _offsetTababar ??= renderBox.localToGlobal(Offset.zero).dy - 56 - MediaQuery.of(context).padding.top;
    print('Offset dy:   $_offsetTababar');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            widget.headerWidget,
            _buildPinnedWidget(key: _keyPinnedWidget),
          ],
        ),
      ),
      Visibility(
        visible: isShow,
        child: _buildPinnedWidget(),
      ),
    ]);
  }

  Widget _buildPinnedWidget({Key? key}) {
    return Container(
      key: key,
      child: widget.bodyWidget,
    );
  }
}
