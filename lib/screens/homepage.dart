import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
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
    <path d="M170,150 L170,70" stroke="black" stroke-width="20"/>
    <path d="M130,110 L170,60 L210,110" stroke="black" stroke-width="20" stroke-linecap="round" fill="none"/>
    <text x="170" y="170" text-anchor="middle" fill="black" font-family="Arial" font-size="24" font-weight="bold">
  <tspan x="170" dy="0">G</tspan>
  <tspan x="178" dy="15">e</tspan>
  <tspan x="170" dy="28">n</tspan>
  <tspan x="178" dy="42">d</tspan>
  <tspan x="168" dy="52">e</tspan>
  <tspan x="178" dy="62">r</tspan>
</text>
  </g>
</svg>
    ''';

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFF69B4), // Pink
              Color(0xFF1E90FF), // Blue
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(
              maxWidth: 300,
              maxHeight: 300,
            ),
            child: SvgPicture.string(
              svgString,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
