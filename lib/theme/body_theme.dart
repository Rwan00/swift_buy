import 'package:flutter/material.dart';


import 'fonts.dart';

Color primaryPurple = const Color.fromRGBO(185, 104, 199, 1);
Color lightPurple = const Color.fromRGBO(177, 155, 217,1);
Color primaryDeepPurple = const Color.fromARGB(255, 45, 1, 51);
class BodyTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.grey[200],
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryDeepPurple,
        elevation: 20),
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        titleTextStyle: heading,
        iconTheme: const IconThemeData(color: Colors.black)),
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromRGBO(159, 145, 204, 1),
        primary: const Color.fromRGBO(61, 36, 108, 1)),
    useMaterial3: true,
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        titleTextStyle: heading.copyWith(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white)),
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromRGBO(159, 145, 204, 1),
        primary: const Color.fromRGBO(61, 36, 108, 1)),
    useMaterial3: true,
  );
}
