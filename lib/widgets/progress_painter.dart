import 'dart:math';

import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double value;
  final Color progressColor;

  ProgressPainter({
    required this.value,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    const startAngle = -pi / 2;
    final sweepAngle = value * 2 * pi;
    const useCenter = false;
    final paint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(ProgressPainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.progressColor != progressColor;
  }
}
