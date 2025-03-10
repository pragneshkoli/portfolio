import 'package:flutter/material.dart';
import 'package:my_portfolio/screens/home_screen.dart';
import 'package:my_portfolio/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pragnesh Koli',
      debugShowCheckedModeBanner: false, // Hides the debug banner
      theme: ThemeData(
        fontFamily: 'Orbitron',
        brightness: Brightness.dark,
        // Dark theme for Solo Leveling vibes
        primaryColor: Colors.blueAccent,
        // System glow color
        scaffoldBackgroundColor: Colors.black,
        // Dark background
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(Colors.transparent),
          // Change color
          thickness: WidgetStateProperty.all(1),
          // Thickness
          radius: Radius.circular(10), // Rounded edges
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
