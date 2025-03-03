import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    titleMedium: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 24, fontWeight: FontWeight.w600),
    titleLarge: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 26, fontWeight: FontWeight.w600),
    displayLarge: TextStyle(fontFamily: 'Lexend', fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontFamily: 'Lexend', fontSize: 24, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontFamily: 'Lexend', fontSize: 18, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(fontFamily: 'Lexend', fontSize: 16, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontFamily: 'Lexend', fontSize: 14, fontWeight: FontWeight.w300),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: 'Lexend', fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(fontFamily: 'Lexend', fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
    bodyLarge: TextStyle(fontFamily: 'Lexend', fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: TextStyle(fontFamily: 'Lexend', fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
    bodySmall: TextStyle(fontFamily: 'Lexend', fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white),
  );
}