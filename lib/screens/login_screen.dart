import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../theme/body_theme.dart';
import '../theme/fonts.dart';
import '../widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 String form = "Login";

 Widget Login(){
   return Container(
     //height:300,
     decoration: const BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.only(
         topLeft: Radius.circular(70),
         bottomRight: Radius.circular(70),
       ),
     ),
     child: Padding(
       padding: const EdgeInsets.all(24),
       child: Column(
         children: [
           const SizedBox(
             height: 16,
           ),
           Text(
             "Hello Again!",
             style: heading,
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 64.0),
             child: Text(
               "Fill your details or continue with social media",
               style: subTitle,
               textAlign: TextAlign.center,
             ),
           ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               const InputField(
                 title: 'Email Address',
                 hint: 'xyz@gmail.com',
               ),
               const InputField(
                 title: 'Password',
                 hint: '******',
                 widget: Icon(Icons.remove_red_eye_outlined),
                 textType: TextInputType.visiblePassword,
               ),
               const SizedBox(
                 height: 6,
               ),
               TextButton(
                 onPressed: (){},
                 child: Text(
                   "Forgot Password?",
                   style: subTitle,
                 ),)
             ],
           ),
           const SizedBox(height: 24,),
           SizedBox(
             width: double.infinity,
             height: 45,
             child: ElevatedButton(
                 onPressed: () {},
                 style: ButtonStyle(
                     foregroundColor: MaterialStateProperty.all(Colors.white),
                     textStyle: MaterialStateProperty.all(GoogleFonts.raleway(fontSize: 16)),
                     shape: MaterialStateProperty.all<
                         RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(
                             16.0), // Adjust the radius here
                       ),
                     ),
                     backgroundColor:
                     MaterialStateProperty.all(primaryPurple)),
                 child: const Text("Sign In")),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('New User?',style: titleStyle,),
               TextButton(
                 onPressed: (){
                   updateWidget();
                 }, child:  Text('Create Account',style: subTitle,),)
             ],
           ),
         ],
       ),
     ),
   );
 }

 Widget Register(){
   return Container(
     //height:300,
     decoration: const BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.only(
         topLeft: Radius.circular(70),
         bottomRight: Radius.circular(70),
       ),
     ),
     child: Padding(
       padding: const EdgeInsets.all(24),
       child: Column(
         children: [
           const SizedBox(
             height: 16,
           ),
           Text(
             "lo Again!Hel",
             style: heading,
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 64.0),
             child: Text(
               "Fill your details or continue with social media",
               style: subTitle,
               textAlign: TextAlign.center,
             ),
           ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               const InputField(
                 title: 'Email Address',
                 hint: 'xyz@gmail.com',
               ),
               const InputField(
                 title: 'Password',
                 hint: '******',
                 widget: Icon(Icons.remove_red_eye_outlined),
                 textType: TextInputType.visiblePassword,
               ),const InputField(
                 title: 'Password',
                 hint: '******',
                 widget: Icon(Icons.remove_red_eye_outlined),
                 textType: TextInputType.visiblePassword,
               ),
               const SizedBox(
                 height: 6,
               ),
               TextButton(
                 onPressed: (){},
                 child: Text(
                   "Forgot Password?",
                   style: subTitle,
                 ),)
             ],
           ),
           const SizedBox(height: 24,),
           SizedBox(
             width: double.infinity,
             height: 45,
             child: ElevatedButton(
                 onPressed: () {},
                 style: ButtonStyle(
                     foregroundColor: MaterialStateProperty.all(Colors.white),
                     textStyle: MaterialStateProperty.all(GoogleFonts.raleway(fontSize: 16)),
                     shape: MaterialStateProperty.all<
                         RoundedRectangleBorder>(
                       RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(
                             16.0), // Adjust the radius here
                       ),
                     ),
                     backgroundColor:
                     MaterialStateProperty.all(primaryPurple)),
                 child: const Text("Sign In")),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('New User?',style: titleStyle,),
               TextButton(
                 onPressed: (){
                   updateWidget();
                 }, child:  Text('Create Account',style: subTitle,),)
             ],
           ),
         ],
       ),
     ),
   );
 }

 Widget renderWidget(){
   return form == "Login"? Login() :Text("55555555555555555555");
 }

 void updateWidget(){
   setState(() {
     form = form == "Login"? "Register" : "Login";
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
                          return RotationTransition(turns: animation);
                        },
                        duration: const Duration(seconds: 3),
                        child: renderWidget(),
                      ),
                      TextButton(
                        onPressed: (){
                          updateWidget();
                        }, child:  Text('Create Account',style: subTitle,),)
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
