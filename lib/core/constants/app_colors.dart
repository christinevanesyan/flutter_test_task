import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Color(0xFFEEEEEE);

  static const Color accent = Color(0xFFD3FA61);

  static const Color gray = Color(0xFF87858F);
  static const Color grayLight = Color(0xFFAAABA5);

  static const Color background = Color(0xFF131313);

  static const Color gradient1Start = Color(0xFF8924E7);

  static const Color gradient1End = Color(0xFF6A46F9);

  static const LinearGradient gradient1 = LinearGradient(
    colors: [gradient1Start, gradient1End],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Button States

  static const Color buttonDisabled = Color(0xFF908E98);

  static const Color buttonError = Color(0xFFEF5B6C);

  static const Color buttonText = white;

  static const Color buttonTextDisable = Color(0xFF404040);

  static const Color buttonTextDark = Color(0xFF1F1D24);

  static Color innerShadowColor1 = const Color(0xFF604490).withOpacity(0.3);

  static Color innerShadowColor2 = const Color(0xFFE3E3E3).withOpacity(0.20);

  static Color innerShadowColor3 = const Color(0xFFC4C4C4).withOpacity(0.2);
}
