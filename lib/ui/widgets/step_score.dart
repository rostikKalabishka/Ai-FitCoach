import 'dart:math';

import 'package:flutter/material.dart';

class StepScore extends StatelessWidget {
  const StepScore(
      {super.key,
      this.child,
      required this.percent,
      required this.fillColors,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth,
      this.padding,
      this.margin});
  final Widget? child;
  final double percent;
  final Color fillColors;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  final double? padding;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      CustomPaint(
        painter: MyPainter(
            fillColors: fillColors,
            freeColor: freeColor,
            lineColor: lineColor,
            lineWidth: lineWidth,
            percent: (percent)),
      ),
      Container(
        padding: EdgeInsets.all(padding ?? 0),
        margin: EdgeInsets.all(margin ?? 0),
        child: Center(
          child: child,
        ),
      )
    ]);
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final Color fillColors;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  const MyPainter(
      {required this.percent,
      required this.fillColors,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);

    drawBackground(canvas, size);

    drawFreeArc(canvas, arcRect);

    drawFilledArc(canvas, arcRect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final fillPaint = Paint();
    fillPaint.color = lineColor;
    fillPaint.style = PaintingStyle.stroke;
    fillPaint.strokeWidth = lineWidth;
    fillPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect, -pi / 2, pi * 2 * percent, false, fillPaint);
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final freePaint = Paint();
    freePaint.color = freeColor;
    freePaint.style = PaintingStyle.stroke;
    freePaint.strokeWidth = lineWidth;
    canvas.drawArc(arcRect, pi * 2 * percent - (pi / 2), pi * 2 * (1 - percent),
        false, freePaint);
  }

  void drawBackground(Canvas canvas, Size size) {
    final backgroundPaint = Paint();
    backgroundPaint.color = fillColors;
    backgroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPaint);
  }

  Rect calculateArcsRect(Size size) {
    const linesMargin = 0;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }
}
