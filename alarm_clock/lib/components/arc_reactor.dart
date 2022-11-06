import 'dart:async';



import 'package:flutter/material.dart';
import 'dart:math';

class IronMan extends StatefulWidget {
  const IronMan({super.key});

  @override
  State<IronMan> createState() => _IronManState();
}

class _IronManState extends State<IronMan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      child: CustomPaint(
        painter: ArcReactor(),
      ),
    );
  }
}

class ArcReactor extends CustomPainter {

  List<double> coordinates (
  double radius,
  double centerX,
  double centerY,
  ) {

  double x = (sqrt(3) * radius / 2) + centerX;
  double y = (5 * radius / 2) + centerY;

  return [x,y];
  }


  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var outerCircleBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    var outerTriangleBrush = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;

    var interTriangleBrush = Paint()
      ..color = Colors.white
      ..strokeWidth = 8;

    var triangleLower = Offset(
      centerX,
      centerY + radius,
    );

    canvas.drawCircle(center, radius - 10, outerCircleBrush);
    canvas.drawLine(triangleLower, center, outerTriangleBrush);
    canvas.drawLine(triangleLower, center, outerTriangleBrush);
    canvas.drawLine(triangleLower, center, outerTriangleBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
