import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/sign_cubit/sign_cubit.dart';
import '../cubits/sign_cubit/sign_state.dart';
import '../methods/methods.dart';
import '../theme/fonts.dart';
import 'input_field.dart';
import 'my_btn.dart';

class LoginWidget extends StatelessWidget {
  final void Function() onPressed;
  const LoginWidget({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<ShopLoginCubit, ShopLogingState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                      textType: TextInputType.emailAddress,
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
                  child: ConditionalBuilder(
                    condition: state is! ShopLogingLoadingState,
                    builder: (context) => AppBtn(
                      label: 'Sign In',
                      onPressed: () {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          buildSnackBar(context, "Required All Fields!!");
                        } else if (!emailController.text.contains("@")) {
                          buildSnackBar(context, "Invalid Email");
                        } else {
                          ShopLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
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
      },
    );
  }
}
