import 'package:flutter/material.dart';

enum ButtonState { SHOW_ONLY_TEXT, SHOW_ONLY_ICON, SHOW_TEXT_ICON }

class BnDAnimatedButton extends StatefulWidget {
  final String? startText, endText;
  final BtnStyle? buttonStyle;
  final IconData? iconData;
  final double? iconSize;
  final Duration? animationDuration;
  final Function? onTap;
  final double? elevation;

  BnDAnimatedButton(
      {this.startText,
        this.endText,
        this.iconData,
        this.iconSize,
        this.animationDuration,
        this.buttonStyle,
        this.onTap,
        this.elevation});

  @override
  _BnDAnimatedButtonState createState() => _BnDAnimatedButtonState();
}

class _BnDAnimatedButtonState extends State<BnDAnimatedButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late ButtonState _currentState;
  late Duration _smallDuration;
  late Animation<double> _scaleFinalTextAnimation;

  @override
  void initState() {
    super.initState();
    _currentState = ButtonState.SHOW_ONLY_TEXT;
    _smallDuration = Duration(
        milliseconds: (widget.animationDuration!.inMilliseconds * 0.2).round());
    _controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _controller.addListener(() {
      double _controllerValue = _controller.value;
      if (_controllerValue < 0.2) {
        setState(() {
          _currentState = ButtonState.SHOW_ONLY_ICON;
        });
      } else if (_controllerValue > 0.8) {
        setState(() {
          _currentState = ButtonState.SHOW_TEXT_ICON;
        });
      }
    });

    _controller.addStatusListener((currentStatus) {
      if (currentStatus == AnimationStatus.completed) {
        return widget.onTap!();
      }
    });

    _scaleFinalTextAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius:
      BorderRadius.all(Radius.circular(widget.buttonStyle!.borderRadius)),
      child: InkWell(
        onTap: () {
          _controller.forward();
        },
        child: AnimatedContainer(
          duration: _smallDuration,
          height: widget.iconSize,
          decoration: BoxDecoration(
            color: (_currentState == ButtonState.SHOW_ONLY_ICON ||
                _currentState == ButtonState.SHOW_TEXT_ICON)
                ? widget.buttonStyle!.secondaryColor
                : widget.buttonStyle!.primaryColor,
            border: Border.all(
                color: (_currentState == ButtonState.SHOW_ONLY_ICON ||
                    _currentState == ButtonState.SHOW_TEXT_ICON)
                    ? widget.buttonStyle!.primaryColor
                    : Colors.transparent),
            borderRadius: BorderRadius.all(
                Radius.circular(widget.buttonStyle!.borderRadius)),
          ),
          padding: EdgeInsets.symmetric(
            horizontal:
            (_currentState == ButtonState.SHOW_ONLY_ICON) ? 1.0 : 1.0,
            vertical: 5.0,
          ),
          child: AnimatedSize(
            vsync: this,
            curve: Curves.easeIn,
            duration: _smallDuration,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                getTextWidget(),
                SizedBox(
                  width:
                  _currentState == ButtonState.SHOW_TEXT_ICON ? 1.0 : 1.0,
                ),
                (_currentState == ButtonState.SHOW_ONLY_ICON ||
                    _currentState == ButtonState.SHOW_TEXT_ICON)
                    ? Icon(
                  widget.iconData,
                  size: widget.iconSize,
                  color: widget.buttonStyle!.primaryColor,
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTextWidget() {
    if (_currentState == ButtonState.SHOW_ONLY_TEXT) {
      return Text(
        widget.startText!,
        style: widget.buttonStyle!.startTextStyle,
      );
    } else if (_currentState == ButtonState.SHOW_ONLY_ICON) {
      return Container();
    } else {
      return ScaleTransition(
        scale: _scaleFinalTextAnimation,
        child: Text(
          widget.endText!,
          style: widget.buttonStyle!.endTextStyle,
        ),
      );
    }
  }
}

class BtnStyle {
  final TextStyle startTextStyle, endTextStyle;
  final Color primaryColor, secondaryColor;
  final double borderRadius;

  BtnStyle(
      {required this.primaryColor,
        required this.secondaryColor,
        required this.startTextStyle,
        required this.endTextStyle,
        required this.borderRadius});
}
