import 'package:flutter/material.dart';

class NavCustomPainter1 extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter1(double startingLoc, int itemsLength, this.color, this.textDirection) {
    final double span = 1.0 / itemsLength;
    s = 0.2;
    final double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    // ..strokeWidth = 2;

    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.05) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.50,
        (loc + s * 0.50) * size.width,
        size.height * 0.55,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.50,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05,
        (loc + s + 0.05) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(double startingLoc, int itemsLength, this.color, this.textDirection) {
    final double span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.05) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.50,
        (loc + s * 0.50) * size.width,
        size.height * 0.54,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.50,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05,
        (loc + s + 0.05) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
