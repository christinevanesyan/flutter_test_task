import 'package:flutter/material.dart';
import 'package:flutter_test_task/core/constants/app_fonts.dart';

class AppTypography {
  AppTypography._();

  static const TextStyle bodyRegular =
      TextStyle(fontWeight: FontWeight.w400, fontSize: 14);

  static const TextStyle subtitleMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
  );

  static const TextStyle headingRetro = TextStyle(
    fontFamily: AppFonts.pressStart2P,
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );
}
