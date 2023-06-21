import 'dart:async';
import 'package:flutter/material.dart';

class SizeTextWidget extends StatefulWidget {
  final String primaryTitle;
  final String? secondaryTitle;
  final TextStyle? textStyle;
  const SizeTextWidget({
    Key? key,
    this.primaryTitle = '',
    this.secondaryTitle,
    this.textStyle,
  }) : super(key: key);

  @override
  State<SizeTextWidget> createState() => _SizeTextWidgetState();
}

class _SizeTextWidgetState extends State<SizeTextWidget> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  int _index = 0;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(milliseconds: 1750), vsync: this);
    _animation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
    _startController();
    super.initState();
  }

  Future<void> _startController() async {
    await Future<void>.delayed(const Duration(milliseconds: 2500));
    _controller
      ..forward()
      ..addListener(_listener);
  }

  Future<void> _listener() async {
    if (_animation.isDismissed) {
      await Future<void>.delayed(const Duration(milliseconds: 2500));
      if (mounted) {
        await _controller.forward();
      }
    } else if (_animation.isCompleted) {
      _index++;
      await _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return _index % 2 == 0 ? _fadeText(widget.primaryTitle) : _fadeText(widget.secondaryTitle ?? '');
      },
    );
  }

  Widget _fadeText(String text) {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.horizontal,
      axisAlignment: -1,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: _child(text),
      ),
    );
  }

  Widget _child(String text) {
    return Text(text, style: widget.textStyle ?? const TextStyle(fontSize: 20));
  }
}
