// lib/main.dart
import 'package:flutter/material.dart';
import 'theme.dart';
import 'onboarding_screen.dart';

void main() {
  runApp(BurgerApp());
}

class BurgerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burger',
      theme: AppTheme.theme,
      home: OnboardingScreen(),
    );
  }
}