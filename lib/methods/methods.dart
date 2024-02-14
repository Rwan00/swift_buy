import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:page_transition/page_transition.dart';
import 'package:swift_buy/helper/cache_helper.dart';

import '../screens/sign_screen.dart';
import '../theme/body_theme.dart';
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
      (Route<dynamic> route) => false);
}

SnackBar buildSnackBar(
    {required BuildContext context, required String text, required Color clr}) {
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

void signOut(context) {
  CacheHelper.removeData(key: "token").then((value) {
    if (value!) {
      animatedNavigateAndDelete(
        context: context,
        widget: const SignScreen(),
        curve: Curves.easeInCirc,
        direction: PageTransitionType.fade,
      );
    }
  });
}

void buildDialog(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  final AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    contentTextStyle: subTitle,
    title: Text(
      "Logout",
      style: heading,
    ),
    content: SizedBox(
      height: height * 0.13,
      child: Column(
        children: <Widget>[
          const Divider(
            color: Colors.grey,
          ),
          const Text("Are You Sure You Want To Logout?"),
          const SizedBox(height: 7),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 92, 1, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      signOut(context);
                    },
                    child: Text(
                      "Logout",
                      style: GoogleFonts.lato(color: Colors.white),
                    )),
              ),
              SizedBox(
                width: width * 0.035,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          primaryDeepPurple.withOpacity(0.6)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.lato(color: Colors.white),
                    )),
              ),
            ],
          ),
        ],
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return alert;
    },
    barrierDismissible: true,
    //barrierColor: Colors.orange.withOpacity(0.3)
  );
}
