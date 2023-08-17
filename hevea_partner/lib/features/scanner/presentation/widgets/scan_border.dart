import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderFrameOverlay extends StatelessWidget {
  final double borderWidth;
  final Color borderColor;
  final double cornerRadius;

  const BorderFrameOverlay({
    Key? key,
    this.borderWidth = 4,
    required this.borderColor,
    required this.cornerRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CornerBorderPainter(
        borderWidth: borderWidth,
        borderColor: borderColor,
        cornerRadius: cornerRadius,
      ),
    );
  }
}

class CornerBorderPainter extends CustomPainter {
  final double borderWidth;
  final Color borderColor;
  final double cornerRadius;

  CornerBorderPainter({
    required this.borderWidth,
    required this.borderColor,
    required this.cornerRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();

    // Define the starting point
    double startX = 37;
    double startY = 150.h;

    // Top-left corner
    path.moveTo(startX, startY + cornerRadius.h);
    path.arcToPoint(Offset(startX + cornerRadius.h, startY),
        radius: Radius.circular(cornerRadius.r));
    path.lineTo(startX + cornerRadius.h, startY);

    // Top-right corner
    double endX = (startX + 310).w;
    path.moveTo(endX - cornerRadius.h, startY);
    path.arcToPoint(Offset(endX, startY + cornerRadius.h),
        radius: Radius.circular(cornerRadius.r));
    path.lineTo(endX, startY + cornerRadius.h);

    // Bottom-right corner
    double endY = (startY + 480).h;
    path.moveTo(endX, endY - cornerRadius.h);
    path.arcToPoint(Offset(endX - cornerRadius.h, endY),
        radius: Radius.circular(cornerRadius.r));
    path.lineTo(endX - cornerRadius.h, endY);

    // Bottom-left corner
    path.moveTo(startX + cornerRadius.h, endY);
    path.arcToPoint(Offset(startX, endY - cornerRadius.h),
        radius: Radius.circular(cornerRadius.r));
    path.lineTo(startX, endY - cornerRadius.h);

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CornerBorderPainter oldDelegate) {
    return oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.cornerRadius != cornerRadius;
  }
}
