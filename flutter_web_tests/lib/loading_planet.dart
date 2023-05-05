import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_tests/constants.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 200),
      builder: (BuildContext context, double value, Widget? child) {
        return SizedBox(
          height: (height > 400) ? 400 : height,
          width: (width > 400) ? 400 : width,
          child: CustomPaint(
            painter: LoadingPlanet(value),
          ),
        );
      },
      duration: const Duration(seconds: 2),
    );
  }
}

class LoadingPlanet extends CustomPainter {
  LoadingPlanet(this.a);
  final double a;
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);

    Paint planetBrush = Paint()
      ..color = AppTheme.primaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    Paint blemishBrush = Paint()
      ..color = Colors.white.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    Paint outlineRingBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Paint outlineBrush = Paint()
      ..color = AppTheme.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawCircle(
      center,
      radius * 0.5,
      planetBrush,
    );
    canvas.drawCircle(
      Offset(
        centerX + radius * 0.2,
        centerY - radius * 0.2,
      ),
      radius * 0.2,
      blemishBrush,
    );
    canvas.drawCircle(
      center,
      radius * 0.9,
      outlineBrush,
    );

    double dotX = radius * 0.9 * cos(3.6 * a * pi / 180 - pi / 2) + centerX;
    double dotY = radius * 0.9 * sin(3.6 * a * pi / 180 - pi / 2) + centerX;

    double dot2X = radius * 0.9 * cos(3.0 * a * pi / 180 - pi / 2) + centerX;
    double dot2Y = radius * 0.9 * sin(3.0 * a * pi / 180 - pi / 2) + centerX;

    double dot3X = radius * 0.9 * cos(2.4 * a * pi / 180 - pi / 2) + centerX;
    double dot3Y = radius * 0.9 * sin(2.4 * a * pi / 180 - pi / 2) + centerX;

    canvas.drawCircle(
      Offset(dotX, dotY),
      10,
      outlineRingBrush..color = Colors.white.withOpacity(1),
    );

    canvas.drawCircle(
      Offset(dot2X, dot2Y),
      10,
      outlineRingBrush..color = Colors.white.withOpacity(0.8),
    );

    canvas.drawCircle(
      Offset(dot3X, dot3Y),
      10,
      outlineRingBrush..color = Colors.white.withOpacity(0.6),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
