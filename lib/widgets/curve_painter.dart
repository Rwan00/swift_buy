import 'package:flutter/material.dart';
import 'package:swift_buy/theme/body_theme.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = primaryDeepPurple
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..moveTo(0, size.height / 2 - 50) // Move to the starting point, adjusting y-coordinate
      ..quadraticBezierTo(
          size.width / 2, size.height / 4, size.width, size.height / 2 - 50); // Adjusting y-coordinate

    canvas.drawShadow(path, Colors.black.withOpacity(0.6), 3, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}