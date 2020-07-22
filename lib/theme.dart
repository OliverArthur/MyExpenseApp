import 'package:flutter/material.dart';

import './constants.dart';

final ThemeData mainTheme = ThemeData(
  primarySwatch: Colors.amber,
  backgroundColor: ligthBackgroundColor,
  scaffoldBackgroundColor: ligthBackgroundColor,
  primaryColor: primaryBgColor,
  accentColor: accentBgColor,
  appBarTheme: AppBarTheme(
    color: ligthBackgroundColor,
    elevation: elevationZero,
  ),
);

class CurvePainter extends CustomPainter {
  final Color colorFill;

  CurvePainter({this.colorFill});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var path = Path();

    paint.color = colorFill;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width * 2,
      size.height / 90,
    );
    path.quadraticBezierTo(
      size.width * 2,
      size.height * 2,
      size.width * 2,
      0,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
