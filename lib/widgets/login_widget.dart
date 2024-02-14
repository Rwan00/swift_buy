import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';


import '../cubits/sign_cubit/sign_cubit.dart';
import '../cubits/sign_cubit/sign_state.dart';
import '../helper/cache_helper.dart';
import '../helper/end_points.dart';
import '../methods/methods.dart';
import '../screens/shop_layout.dart';
import '../theme/body_theme.dart';
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
    return BlocConsumer<ShopLoginCubit, ShopLoginState>(
      listener: (context, state) {
        if(state is ShopLoginSuccessState){
           if(state.loginModel.status){
             print(state.loginModel.message);
            buildSnackBar(context: context,text:  state.loginModel.message!,clr:  primaryDeepPurple);
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
             buildSnackBar(context:  context,text:  state.loginModel.message!,
               clr:  const Color.fromARGB(255, 92, 1, 1));
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopLoginCubit.get(context);
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
                    condition: state is! ShopLoginLoadingState,
                    builder: (context) => AppBtn(
                      label: 'Sign In',
                      onPressed: () {
                        cubit.userLogin(
                            email: emailController.text,
                            password: passwordController.text);
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
