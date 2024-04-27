import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xffF9F9F9),
    secondary: Color(0xff0D0140),
    background: Color(0xffF9F9F9),
    onPrimary: Color(0xff0D0140),
    shadow: Color(0xFF99ABC6),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF0D3E44),
    secondary: Color(0xff28A77D),
    background: Color(0xff121212),
    onPrimary: Color(0xffF9F9F9),
    shadow: Color(0xFF2A6971),
  ),
);
