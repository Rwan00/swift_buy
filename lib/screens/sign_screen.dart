import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/body_theme.dart';
import '../theme/fonts.dart';
import '../widgets/input_field.dart';
import '../widgets/login_widget.dart';
import '../widgets/register_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
String form = "Login";

  

  

  Widget renderWidget() {
    return form == "Login" ? login(updateWidget) : register(updateWidget);
  }

  void updateWidget() {
    setState(() {
      form = form == "Login" ? "Register" : "Login";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryPurple,
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            Center(
                child: Image.asset(
              "assets/images/logo.png",
              height: 190,
            )),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      AnimatedSwitcher(
                        
                        switchInCurve: Curves.bounceInOut,
                        switchOutCurve: Curves.easeOutCirc,
                        transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
                        duration: const Duration(seconds: 3),
                        child: renderWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /*const SizedBox(
              height:64,
            )*/
          ],
        ));
  }
}
