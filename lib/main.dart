import 'package:flutter/material.dart';
import 'package:verigender/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veri Gender',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6a0dad)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Veri Gender'),
    );
  }
}
