import 'package:flutter/material.dart';

class RoundSliderTrackShape extends SliderTrackShape {
  const RoundSliderTrackShape({this.disabledThumbGapWidth = 2.0, this.radius = 0});

  final double disabledThumbGapWidth;
  final double radius;

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    SliderThemeData? sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final overlayWidth = sliderTheme?.overlayShape?.getPreferredSize(isEnabled, isDiscrete).width;
    final trackHeight = sliderTheme?.trackHeight;
    assert(overlayWidth! >= 0);
    assert(trackHeight! >= 0);
    assert(parentBox.size.width >= overlayWidth!);
    assert(parentBox.size.height >= trackHeight!);

    final trackLeft = (offset.dx + overlayWidth!) / 2;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;

    final trackWidth = parentBox.size.width - overlayWidth;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    SliderThemeData? sliderTheme,
    Animation<double>? enableAnimation,
    TextDirection? textDirection,
    Offset? thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
  }) {
    if (sliderTheme?.trackHeight == 0) {
      return;
    }

    final activeTrackColorTween =
        ColorTween(begin: sliderTheme?.disabledActiveTrackColor, end: sliderTheme?.activeTrackColor);
    final inactiveTrackColorTween =
        ColorTween(begin: sliderTheme?.disabledInactiveTrackColor, end: sliderTheme?.inactiveTrackColor);
    final activePaint = Paint()..color = activeTrackColorTween.evaluate(enableAnimation!)!;
    final inactivePaint = Paint()..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    Paint? leftTrackPaint;
    Paint? rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      default:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    var horizontalAdjustment = 0.0;
    if (!isEnabled) {
      final disabledThumbRadius =
          (sliderTheme?.thumbShape?.getPreferredSize(false, isDiscrete).width) ?? 0 / 2.0;
      final gap = disabledThumbGapWidth * (1.0 - enableAnimation.value);
      horizontalAdjustment = disabledThumbRadius + gap;
    }

    final trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    //Modify this side
    final leftTrackSegment = RRect.fromLTRBR(trackRect.left, trackRect.top,
        thumbCenter!.dx - horizontalAdjustment, trackRect.bottom, Radius.circular(radius));
    context.canvas.drawRRect(leftTrackSegment, leftTrackPaint);
    final rightTrackSegment = RRect.fromLTRBR(thumbCenter.dx + horizontalAdjustment, trackRect.top,
        trackRect.right, trackRect.bottom, Radius.circular(radius));
    context.canvas.drawRRect(rightTrackSegment, rightTrackPaint);
  }
}
