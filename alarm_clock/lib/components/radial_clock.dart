import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class RadialClock extends StatefulWidget {
  RadialClock({super.key});

  @override
  State<RadialClock> createState() => _RadialClockState();
}

class _RadialClockState extends State<RadialClock> {
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color(0xFFB0413E),
      ),

      child: Transform.rotate(
      angle: - pi / 2,

        child: CustomPaint(
          painter: RadialPainter(),
        ),
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = centerX > centerY ? centerY : centerX;

    var circleBrush = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..color = Color(0xFFEDF7F6);
      // ..color = Color(0xFFEDF7F6);

    var secHandBrush = Paint()
      ..color = Color(0xFFB76D68)
      ..strokeWidth = 2;

    var minHandBrush = Paint()
      ..color = Color(0xFF4D6A6D)
      ..strokeWidth = 5;

    var hourHandBrush = Paint()
      ..color = Color(0xFF357266)
      ..strokeWidth = 8;

    var outerDashBrush = Paint()
      ..strokeWidth = 2
      ..color = Color(0xFFEDF7F6);

    var hourHandX = centerX +
        (radius - 100) *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        (radius - 100) *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    var minHandX =
        centerX + (radius - 80) * cos(dateTime.minute * 6 * pi / 180);
    var minHandY =
        centerX + (radius - 80) * sin(dateTime.minute * 6 * pi / 180);

    var secHandX =
        centerX + (radius - 60) * cos(dateTime.second * 6 * pi / 180);
    var secHandY =
        centerX + (radius - 60) * sin(dateTime.second * 6 * pi / 180);

    canvas.drawCircle(center, radius - 40, circleBrush);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);
    canvas.drawCircle(center, 5, circleBrush);

     var outerCircleRadius = radius;
    var innerCircleRadius = radius - 20;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), outerDashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
