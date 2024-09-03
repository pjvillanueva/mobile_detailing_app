import 'package:flutter/material.dart';

class VerticalDashedDivider extends StatelessWidget {
  final double width;
  final Color color;
  final double dashHeight;
  final double spacing;

  const VerticalDashedDivider({
    Key? key,
    this.width = 1,
    this.color = Colors.black,
    this.dashHeight = 4.0,
    this.spacing = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, double.infinity),
      painter: _VerticalDashedDividerPainter(
        color: color,
        dashHeight: dashHeight,
        spacing: spacing,
      ),
    );
  }
}

class _VerticalDashedDividerPainter extends CustomPainter {
  final Color color;
  final double dashHeight;
  final double spacing;

  _VerticalDashedDividerPainter({
    required this.color,
    required this.dashHeight,
    required this.spacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final dashWidth = size.width;
    double startY = 0.0;

    while (startY < size.height) {
      canvas.drawRect(
        Rect.fromLTWH(0, startY, dashWidth, dashHeight),
        paint,
      );
      startY += dashHeight + spacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
