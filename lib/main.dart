import 'package:flutter/material.dart';
import 'theme/body_theme.dart';
import 'widgets/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: BodyTheme.light,
      home:  splashScreen(),
    );
  }
}

