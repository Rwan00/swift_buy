import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/on_boarding.dart';
import '../theme/body_theme.dart';

EasySplashScreen splashScreen(navigator) {
  return EasySplashScreen(
    logo: Image.asset("assets/images/logo.png",height: 320,),
    logoWidth: 170,

    backgroundColor: primaryPurple,
    showLoader: true,

    loaderColor: Colors.white,
    navigator:  navigator,
    durationInSeconds: 5,
    title:  Text(
      "Swift Buy",
      style: GoogleFonts.raleway(color: Colors.white,fontSize: 45,fontWeight: FontWeight.w700),
    ),
  );
}