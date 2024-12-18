import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: const Color(0xFFF4E8FF),
    fontFamily: 'Roboto Bold',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white, // Text color
          fontFamily: 'Roboto Regular',
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.transparent, // Transparent to show gradient
        shadowColor:
            Colors.transparent, // Removes shadow for clean gradient look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
