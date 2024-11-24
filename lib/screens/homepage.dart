import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6a0dad), // Purple background from the hex code
      body: Stack(
        children: [
          // Background stars pattern
          Positioned.fill(
            child: CustomPaint(
              painter: StarPatternPainter(),
            ),
          ),
          // Centered logo
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white12, // Slight white overlay for the circle
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    'lib/assets/VeriGender.png', // Make sure to add the logo to your assets
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for the star pattern background
class StarPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF5a0b9d) // Slightly darker purple for stars
      ..style = PaintingStyle.fill;

    // Draw stars at fixed positions
    final starPositions = [
      Offset(size.width * 0.2, size.height * 0.2),
      Offset(size.width * 0.8, size.height * 0.3),
      Offset(size.width * 0.3, size.height * 0.7),
      Offset(size.width * 0.7, size.height * 0.8),
      Offset(size.width * 0.5, size.height * 0.5),
      Offset(size.width * 0.15, size.height * 0.85),
      Offset(size.width * 0.85, size.height * 0.15),
    ];

    for (final position in starPositions) {
      drawStar(canvas, position, 15, paint);
    }
  }

  void drawStar(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();
    final angleStep = 2 * 3.14159 / 5;
    final halfAngleStep = angleStep / 2;

    for (var i = -3.14159 / 2; i < 3.14159 * 1.5; i += angleStep) {
      final point1 = Offset(
        center.dx + size * cos(i),
        center.dy + size * sin(i),
      );
      final point2 = Offset(
        center.dx + size * 0.4 * cos(i + halfAngleStep),
        center.dy + size * 0.4 * sin(i + halfAngleStep),
      );

      if (i == -3.14159 / 2) {
        path.moveTo(point1.dx, point1.dy);
      } else {
        path.lineTo(point1.dx, point1.dy);
      }
      path.lineTo(point2.dx, point2.dy);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}