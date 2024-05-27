import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  textTheme: GoogleFonts.rubikTextTheme(),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Color.fromARGB(255, 97, 97, 97)),
    titleTextStyle: TextStyle(
        color: Color.fromARGB(255, 97, 97, 97),
        fontSize: 20,),
  ),
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade700,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(Colors.grey.shade500),
    checkColor: WidgetStateProperty.all(Colors.white),
    side: WidgetStateBorderSide.resolveWith(
          (states) => BorderSide(width: 1.0, color: Colors.grey.shade100),
    ),
  ),
);