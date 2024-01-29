import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import '../theme/body_theme.dart';

EasySplashScreen splashScreen(navigator) {
  return EasySplashScreen(
    logo: Image.asset("assets/images/logo.png",height: 520,width: 520,),
    logoWidth: 170,

    backgroundColor: primaryDeepPurple,
    showLoader: true,

    loaderColor: Colors.white,
    navigator:  navigator,
    durationInSeconds: 5,
  );
}