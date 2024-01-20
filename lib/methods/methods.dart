import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';


import '../screens/on_boarding.dart';
import '../theme/fonts.dart';





void navigateTo(context,widget) => Navigator.push(context,  MaterialPageRoute(builder: (context)=>widget));

void animatedNavigateTo(BuildContext context,Widget widget,PageTransitionType direction,Curve curve){
  Navigator.push(
      context,
      PageTransition(
        child: widget,
        type: direction,
        curve: curve,
        //alignment: Alignment.bottomLeft,
        duration: const Duration(milliseconds: 700),
      ));
}

void animatedNavigateAndDelete(BuildContext context,Widget widget,PageTransitionType direction,Curve curve){
  Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        child: widget,
        type: direction,
        curve: curve,
        //alignment: Alignment.bottomLeft,
        duration: const Duration(milliseconds: 700),
      ), (Route<dynamic> route) => false);
}
