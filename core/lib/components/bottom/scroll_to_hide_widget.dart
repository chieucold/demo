import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  const ScrollToHideWidget({
    Key? key,
    required this.child,
    required this.controller,
    this.height = 80,
    this.duration = const Duration(milliseconds: 750),
    this.isBottom = true,
  }) : super(key: key);
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  final double height;
  final bool isBottom;

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

/// [Example]
/// return Scaffold(
///     appBar: Appbar(),
///     body: SingleChildScrollView(
///         controller: _controller,
///         child: child,
///   ),
///     bottomNavigationBar: ScrollToHideWidget(
///         controller: _controller,
///         heigh: _height,
///         child: child,
///   );
/// }

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool _isVisible = true;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller..addListener(_listen);
  }

  @override
  void dispose() {
    _controller.removeListener(_listen);
    super.dispose();
  }

  void _listen() {
    final ScrollDirection _direction = _controller.positions.last.userScrollDirection;
    if (_direction == ScrollDirection.forward) {
      widget.isBottom ? _show() : _hide();
    } else if (_direction == ScrollDirection.reverse) widget.isBottom ? _hide() : _show();
  }

  void _show() {
    if (!_isVisible) setState(() => _isVisible = true);
  }

  void _hide() {
    if (_isVisible) setState(() => _isVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: _isVisible ? widget.height : 0,
      child: Wrap(
        children: <Widget>[widget.child],
      ),
    );
  }
}
