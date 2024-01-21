import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/on_boarding.dart';
import '../theme/fonts.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void animatedNavigateTo(BuildContext context, Widget widget,
    PageTransitionType direction, Curve curve) {
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

void animatedNavigateAndDelete(BuildContext context, Widget widget,
    PageTransitionType direction, Curve curve) {
  Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        child: widget,
        type: direction,
        curve: curve,
        //alignment: Alignment.bottomLeft,
        duration: const Duration(milliseconds: 700),
      ),
      (Route<dynamic> route) => false);}


  SnackBar buildSnackBar(BuildContext context,String text) {
    final snackBar = SnackBar(
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.black,
      content: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30.0),
            ),
            // height: 70,
            // width: 200,

            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: subTitle.copyWith(color: Colors.white),
              ),
            )),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return snackBar;
  }

