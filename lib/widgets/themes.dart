import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.tajawal().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: darkBlueColor,
      accentColor: darkBlueColor,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.tajawal().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamcolor,
      buttonColor: lightBluishColor,
      accentColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(),
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          )));

  //colors
  static Color creamColor = Color.fromARGB(255, 236, 234, 234);
  static Color darkCreamcolor = Color.fromARGB(255, 43, 42, 42);
  static Color darkBlueColor = Color.fromARGB(255, 20, 3, 103);
  static Color lightBluishColor = Color.fromARGB(255, 143, 44, 235);
}
