import 'package:flutter/material.dart';

class BnDButton extends StatefulWidget {
  final Widget title;
  final Widget? iconRight;
  final Widget? iconLeft;
  final bool isDisable;
  final VoidCallback? onPressed;

  //final ButtonSize? buttonSize;
  final Color? backGroundColor;
  final Color? shadowColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Duration? animationDuration;
  final double? radius;
  final Widget? child;
  final OutlinedBorder? shape;
  final Gradient? gradient;
  final ButtonStyle? style;
  final double? width;

  const BnDButton(
      {Key? key,
      required this.title,
      this.iconLeft,
      this.iconRight,
      this.onPressed,
      //this.buttonSize,
      this.backGroundColor,
      this.elevation,
      this.isDisable = false,
      this.shadowColor,
      this.padding = const EdgeInsets.all(0),
      this.alignment,
      this.animationDuration,
      this.margin = const EdgeInsets.all(0),
      this.radius = 0.0,
      this.child,
      this.shape,
      this.gradient,
      this.style,
      this.width})
      : super(key: key);

  @override
  _BnDButtonState createState() => _BnDButtonState();
}

class _BnDButtonState extends State<BnDButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: widget.padding,
      margin: widget.margin,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: widget.style ??
            ElevatedButton.styleFrom(
              elevation: widget.elevation,
              primary: widget.backGroundColor,
              shadowColor: widget.shadowColor,
              alignment: widget.alignment,
              padding: widget.gradient != null ? const EdgeInsets.all(0) : widget.padding,
              animationDuration: widget.animationDuration,
              shape: widget.shape,
            ),
        child: widget.gradient != null
            ? Ink(
                padding: widget.padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(widget.radius!)),
                  gradient: widget.gradient,
                ),
                child: _child(),
              )
            : _child(),
      ),
    );
  }

  Widget _child() {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        Center(
            child: Padding(
                padding:
                    EdgeInsets.only(right: widget.iconRight != null ? 20 : 4, left: widget.iconLeft != null ? 12 : 4),
                child: widget.title)),
        _buildIconLeft(),
        _buildIconRight(),
      ],
    );
  }

  Widget _buildIconRight() {
    if (widget.iconRight != null) {
      return Align(child: widget.iconRight ?? const SizedBox(), alignment: Alignment.centerRight);
    }
    return const SizedBox();
  }

  Widget _buildIconLeft() {
    if (widget.iconLeft != null) {
      return Align(child: widget.iconLeft ?? const SizedBox(), alignment: Alignment.centerLeft);
    }
    return const SizedBox();
  }
}
