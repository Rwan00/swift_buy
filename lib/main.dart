import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/bloc_observer.dart';
import 'helper/dio_helper.dart';
import 'theme/body_theme.dart';
import 'widgets/splash_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
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

