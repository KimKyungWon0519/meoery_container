import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getLightTheme() {
    return ThemeData(
      fontFamily: 'Human',
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        foregroundColor: Color.fromRGBO(208, 171, 238, 1),
        elevation: 0.0,
      ),
      primarySwatch: createMaterialColor(
        const Color.fromRGBO(208, 171, 238, 1),
      ),
      datePickerTheme: const DatePickerThemeData(),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 24),
        bodyMedium: TextStyle(fontSize: 18),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            const Color.fromRGBO(208, 171, 238, 1),
          ),
          overlayColor: MaterialStateProperty.all(
            const Color.fromRGBO(243, 234, 251, 1),
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontFamily: 'Human',
              fontSize: 18,
            ),
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color.fromRGBO(208, 171, 238, 1),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
