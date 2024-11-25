import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    // Updated SVG string with closer gender icons
    const String svgString = '''
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 100">
      <!-- Male symbol -->
      <circle cx="85" cy="50" r="20" stroke="white" stroke-width="6" fill="none" stroke-linecap="round"/>
      <path d="M100 35 L115 20 M115 20 L115 35 M115 20 L100 20" stroke="white" stroke-width="6" fill="none" stroke-linecap="round"/>
      
      <!-- Female symbol -->
      <circle cx="115" cy="50" r="20" stroke="white" stroke-width="6" fill="none" stroke-linecap="round"/>
      <line x1="115" y1="70" x2="115" y2="85" stroke="white" stroke-width="6" stroke-linecap="round"/>
      <line x1="100" y1="75" x2="130" y2="75" stroke="white" stroke-width="6" stroke-linecap="round"/>
      
      <!-- Text -->
      <text x="70" y="95" fill="white" font-family="Arial" font-size="16" text-anchor="middle">Veri</text>
      <text x="130" y="95" fill="white" font-family="Arial" font-size="16" text-anchor="middle">Gender</text>
    </svg>
    ''';

    return Scaffold(
      backgroundColor: const Color(0xFF6a0dad), // Purple background
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
              constraints: const BoxConstraints(
                maxWidth: 250, // Reduced maximum width
                maxHeight: 150, // Maintain maximum height
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF6a0dad),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(15),
                child: SvgPicture.string(
                  svgString,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StarPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF5a0b9d)
      ..style = PaintingStyle.fill;

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
    const angleStep = 2 * 3.14159 / 5;
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