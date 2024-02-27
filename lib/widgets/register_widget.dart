import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swift_buy/cubits/register_cubit/register_cubit.dart';
import 'package:swift_buy/cubits/register_cubit/register_state.dart';

import '../helper/cache_helper.dart';
import '../helper/end_points.dart';
import '../methods/methods.dart';
import '../screens/shop_layout.dart';
import '../theme/body_theme.dart';
import '../theme/fonts.dart';
import 'input_field.dart';
import 'my_btn.dart';

class RegisterWidget extends StatelessWidget {
  final void Function() onPressed;
  const RegisterWidget({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
      listener: (context, state) {
        if (state is ShopRegisterSuccessState) {
           
          if (state.loginModel.status && passwordController.text == confirmPasswordController.text) {
            print(state.loginModel.message);
            buildSnackBar(
                context: context,
                text: state.loginModel.message!,
                clr: primaryDeepPurple);
            CacheHelper.saveData(
                    key: "token", value: state.loginModel.data!.token)
                .then((value) {
              token = CacheHelper.getData(key: "token");
              animatedNavigateAndDelete(
                  context: context,
                  widget: const ShopLayout(),
                  direction: PageTransitionType.fade,
                  curve: Curves.easeInOutBack);
            });
          } 
          else{
            buildSnackBar(
                context: context,
                text: state.loginModel.message!,
                clr: const Color.fromARGB(255, 92, 1, 1));
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopRegisterCubit.get(context);
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
                      textType: TextInputType.emailAddress,
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
                    InputField(
                      title: "Phone",
                      hint: '+20*****',
                      controller: phoneController,
                      textType: TextInputType.phone,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ConditionalBuilder(
                    condition: state is! ShopRegisterLoadingState,
                    builder: (context) {
                      return AppBtn(
                        label: "Sign Up",
                        onPressed: () {
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            buildSnackBar(
                                context: context,
                                text: "Password Dosen't Match",
                                clr: const Color.fromARGB(255, 92, 1, 1));
                          } else {
                            cubit.userRegister(
                            email: emailController.text,
                            password: passwordController.text,
                            name: usernameController.text,
                            phone: phoneController.text,
                            );
                          }
                        },
                      );
                    },
                    fallback: (context) => Center(
                      child: Image.asset(
                        "assets/images/loading.gif",
                        height: 95,
                        width: 95,
                      ),
                    ),
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
      },
    );
  }
}
