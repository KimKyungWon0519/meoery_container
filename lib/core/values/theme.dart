import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getLightTheme() {
    return ThemeData(
      fontFamily: 'Human',
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
