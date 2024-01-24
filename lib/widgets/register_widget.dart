import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../methods/methods.dart';
import '../theme/body_theme.dart';
import '../theme/fonts.dart';
import 'input_field.dart';
import 'my_btn.dart';



class RegisterWidget extends StatelessWidget {
  final void Function() onPressed;
  const RegisterWidget({required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
    return  Container(
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
          Text(
            "Register Account",
            style: heading,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Text(
              "Hurry And Be One Of Us",
              style: subTitle,
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InputField(
                title: 'User Name',
                hint: 'Enter Your Name',
                controller: usernameController,
              ),
              InputField(
                title: 'Email Address',
                hint: 'xyz@gmail.com',
                controller: emailController,
              ),
              InputField(
                title: 'Password',
                hint: '******',
                widget: const Icon(Icons.remove_red_eye_outlined),
                textType: TextInputType.visiblePassword,
                isPassword: true,
                controller: passwordController,
              ),
              InputField(
                title: 'Confirm Password',
                hint: '******',
                widget: const Icon(Icons.remove_red_eye_outlined),
                textType: TextInputType.visiblePassword,
                isPassword: true,
                controller: confirmPasswordController,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: AppBtn(
              label: "Sign Up",
              onPressed: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    usernameController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  buildSnackBar(context, "Required All Fields!!");
                } else if (!emailController.text.contains("@")) {
                  buildSnackBar(context, "Invalid Email");
                } else if (passwordController.text.length < 5) {
                  buildSnackBar(context, "Password is Too Short");
                } else if (confirmPasswordController.text !=
                    passwordController.text) {
                  buildSnackBar(context, "Password Didn't Match!");
                }
                else{

                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already Have Account?',
                style: titleStyle,
              ),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  'Log In',
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
}
