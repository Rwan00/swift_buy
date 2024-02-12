
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';


import '../theme/fonts.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void animatedNavigateTo(
    {required BuildContext context,
    required Widget widget,
    required PageTransitionType direction,
    required Curve curve}) {
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

void animatedNavigateAndDelete(
    {required BuildContext context,
   required Widget widget,
    required PageTransitionType direction,
    required Curve curve}) {
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


  SnackBar buildSnackBar({required BuildContext context, required String text, required Color clr}) {
    final snackBar = SnackBar(
      //padding: const EdgeInsets.all(0.0),
      //margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: clr,
      content: Text(
        text,
        style: subTitle.copyWith(color: Colors.white),
      ),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return snackBar;
  }

