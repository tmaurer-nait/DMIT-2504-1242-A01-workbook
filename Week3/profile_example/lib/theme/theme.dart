import 'package:flutter/material.dart';

ThemeData generateLightTheme(ThemeData darkTheme) {
  final lightTheme = darkTheme.copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepOrange,
      backgroundColor: Colors.teal,
      cardColor: Colors.pink,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  return lightTheme;
}
