import 'dart:async';
import 'dart:math';
import 'package:core/common/color/core_color.dart';
import 'package:core/common/text_style.dart';
import 'package:flutter/material.dart';

class FlipTextWidget extends StatefulWidget {
  final String primaryTitle;
  final String? secondaryTitle;
  final TextStyle? textStyle;
  const FlipTextWidget({
    Key? key,
    this.primaryTitle = '',
    this.secondaryTitle,
    this.textStyle,
  }) : super(key: key);

  @override
  State<FlipTextWidget> createState() => _FlipTextWidgetState();
}

class _FlipTextWidgetState extends State<FlipTextWidget> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  late Timer _timer;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _periodic();
    super.initState();
  }

  void _periodic() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) async {
      _flip();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        final bool isFront = _controller.value < .5;
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(pi * _animation.value + (isFront ? 0 : pi)),
          alignment: FractionalOffset.center,
          child: isFront ? _child(widget.primaryTitle) : _child(widget.secondaryTitle ?? ''),
        );
      },
    );
  }

  Widget _child(String text) {
    return Text(text,
        style: widget.textStyle ?? textStyleHeadline6Default.copyWith(color: CoreColor.white, fontSize: 20));
  }

  void _flip() {
    if (mounted) {
      if (_animation.isDismissed) {
        _controller.forward();
      } else if (_animation.isCompleted) {
        _controller.reverse();
      }
    }
  }
}
