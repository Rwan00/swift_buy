import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../methods/methods.dart';
import '../theme/body_theme.dart';
import '../theme/fonts.dart';
import 'input_field.dart';

Widget login(void Function() onPressed, BuildContext context) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              "Fill your details",
              style: subTitle,
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InputField(
                title: 'Email Address',
                hint: 'xyz@gmail.com',
                controller: emailController,
              ),
              InputField(
                title: 'Password',
                hint: '******',
                isPassword: true,
                widget: const Icon(Icons.remove_red_eye_outlined),
                textType: TextInputType.visiblePassword,
                controller: passwordController,
              ),
              const SizedBox(
                height: 6,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: subTitle,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    buildSnackBar(context, "Required All Fields!!");
                  } else if (!emailController.text.contains("@")) {
                    buildSnackBar(context, "Invalid Email");
                  } 
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle: MaterialStateProperty.all(
                        GoogleFonts.raleway(fontSize: 16)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            16.0), // Adjust the radius here
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(primaryPurple)),
                child: const Text("Sign In")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New User?',
                style: titleStyle,
              ),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  'Create Account',
                  style: subTitle,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
