import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    // Updated SVG string with connected gender icons and internal text
    const String svgString = '''
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600">
  <g transform="translate(50,50) scale(1.2)">
    <!-- Female symbol (left) with text -->
    <circle cx="100" cy="240" r="50" fill="none" stroke="black" stroke-width="20"/>
     <path d="M100,350 L100,300 M75,325 L125,325" stroke="black" stroke-width="20" stroke-linecap="round"/>

    <text x="100" y="255" text-anchor="middle" fill="black" font-family="Arial" font-size="24" font-weight="bold">Veri</text>
    
    <!-- Male symbol (right) with text -->
    <circle cx="170" cy="190" r="50" fill="none" stroke="black" stroke-width="20"/>
    <!-- Up arrow with wider head like in reference -->
    <path d="M170,150 L170,80" stroke="black" stroke-width="20"/>
    <path d="M130,110 L170,60 L210,110" stroke="black" stroke-width="20" stroke-linecap="round" fill="none"/>
    <text x="170" y="130" text-anchor="middle" fill="black" font-family="Arial" font-size="24" font-weight="bold">
      <tspan x="170" dy="0">G</tspan>
      <tspan x="170" dy="20">e</tspan>
      <tspan x="170" dy="20">n</tspan>
      <tspan x="170" dy="20">d</tspan>
      <tspan x="170" dy="20">e</tspan>
      <tspan x="170" dy="20">r</tspan>
    </text>
  </g>
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
                maxWidth: 300,
                maxHeight: 300,
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
