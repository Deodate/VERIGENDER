import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    // Define the SVG string with gender icons
    const String svgString = '''
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500">
      <!-- Female symbol -->
      <circle cx="150" cy="150" r="60" stroke="white" stroke-width="20" fill="none"/>
      <line x1="150" y1="210" x2="150" y2="320" stroke="white" stroke-width="20"/>
      <line x1="80" y1="280" x2="220" y2="280" stroke="white" stroke-width="20"/>
      
      <!-- Male symbol -->
      <circle cx="350" cy="250" r="60" stroke="white" stroke-width="20" fill="none"/>
      <line x1="390" y1="210" x2="450" y2="150" stroke="white" stroke-width="20"/>
      <line x1="400" y1="200" x2="450" y2="200" stroke="white" stroke-width="20"/>
      <line x1="450" y1="150" x2="450" y2="200" stroke="white" stroke-width="20"/>
      
      <!-- Text -->
      <text x="200" y="400" fill="black" font-family="Arial" font-size="40">Veri</text>
      <text x="280" y="400" fill="black" font-family="Arial" font-size="40">Gender</text>
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
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF6a0dad), // Match background color
                  ),
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.string(
                    svgString,
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

// StarPatternPainter class remains unchanged
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