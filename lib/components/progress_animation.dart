import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color valueColor;

  ProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.valueColor,
  });

  @override
  void paint(Canvas canvas, Size size) {

    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      backgroundPaint,
    );

    final Paint progressPaint = Paint()
      ..color = valueColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final double progressWidth = size.width * progress;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(progressWidth, size.height / 2),
      progressPaint,
    );

    final iconPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(Icons.watch_later_outlined.codePoint),
        style: TextStyle(
          fontSize: 12,
          color: valueColor,
          fontFamily: Icons.watch_later_outlined.fontFamily,
          package: Icons.watch_later_outlined.fontPackage,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    iconPainter.layout();
    iconPainter.paint(
      canvas,
      Offset(progressWidth - iconPainter.width / 2, 0),
    );
  }

  @override
  bool shouldRepaint(covariant ProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}


