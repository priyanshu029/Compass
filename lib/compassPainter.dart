import 'package:flutter/material.dart';
import 'dart:math';


class CompassPainter extends CustomPainter {

  CompassPainter({ @required this.angle }) ;

  final double angle;
  double get rotation => -2 * pi * (angle / 360);

  Paint get _brush => new Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 7.0;
  Paint get _brushP => new Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {

    Paint circle = _brush
      ..color = Colors.amber[900];

    Paint needle = _brushP
      ..color = Colors.green[400];

    double radius = min(size.width / 3, size.height / 3);
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset start = Offset.lerp(Offset(center.dx, radius), center, .6);
    Offset end = Offset.lerp(Offset(center.dx, radius), center, 0.4);

    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);
    canvas.translate(-center.dx, -center.dy);

    canvas.drawLine(start, end, needle);
    canvas.drawCircle(center, radius, circle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}