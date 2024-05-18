import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileCircularIndicator extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final double value;
  final String image;

  CustomProfileCircularIndicator({
    required this.size,
    required this.strokeWidth,
    required this.value,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 180.sp,
        height: 180.sp,
        child: Stack(
          children: [
            Positioned(
              left: 30,
              top: 30,
              right: 30,
              bottom: 30,
              child: CustomPaint(
                size: Size(size, size),
                painter: CircularIndicatorPainter(
                  strokeWidth: strokeWidth,
                  value: 1,
                  gradientColors: [
                    Color(0xff2C2C2E),
                    Color(0xff2C2C2E),
                    Color(0xff2C2C2E),
                  ],
                  calories: int.fromEnvironment(image),
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 30,
              right: 30,
              bottom: 30,
              child: CustomPaint(
                size: Size(size, size),
                painter: CircularIndicatorPainter(
                  strokeWidth: strokeWidth,
                  value: value,
                  gradientColors: [
                    Color(0xffE79332),
                    Color(0xffFF2424),
                    Color(0xffD0FD3E),
                  ],
                  calories: int.fromEnvironment(image),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 15,
              right: 15,
              bottom: 15,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(30.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                   // color: Colors.red,
                    image: DecorationImage(image: AssetImage("assets/images/login2.png"),fit: BoxFit.fill)
                    )
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    //
    //   child:
    // );
  }
}

class CircularIndicatorPainter extends CustomPainter {
  final double strokeWidth;
  final double value;
  final int calories;
  final List<Color> gradientColors;

  CircularIndicatorPainter(
      {required this.strokeWidth,
        required this.value,
        required this.calories,
        required this.gradientColors});

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2;
    Offset center = Offset(radius, radius);

    Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startAngle = -math.pi / 2;
    double sweepAngle = 2 * math.pi * value;

    // Define rainbow colors

    // Create a linear gradient shader
    final Shader gradientShader = LinearGradient(
      colors: gradientColors,
    ).createShader(Rect.fromCircle(center: center, radius: radius));

    // Apply gradient shader to paint
    paint.shader = gradientShader;

    // Draw the arc with gradient colors
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
