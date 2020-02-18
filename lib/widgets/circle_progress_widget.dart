import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleProgressWidget extends CustomPainter {
  double currentProgress;

  CircleProgressWidget(this.currentProgress);

  @override
  void paint(Canvas canvas, Size size) {

    Rect rect = new Rect.fromCircle(
      center: new Offset(165.0, 55.0),
      radius: 180.0,
    );
    final Gradient gradient = new RadialGradient(
      colors: <Color>[
        Color.fromARGB(240, 38, 0, 130),
        Color.fromARGB(255, 255, 67, 90)
      ],
      stops: [
        0.7,
        1.0,
      ],
    );

    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 14
      ..color = Colors.grey[200]
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 14
      ..color = Color.fromARGB(240, 38, 0, 130)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(rect);

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -5 / 4 * pi,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
