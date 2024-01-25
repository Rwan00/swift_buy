import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swift_buy_/cubits/sign_cubit/sign_cubit.dart';

import '../cubits/sign_cubit/sign_state.dart';
import '../theme/body_theme.dart';
import '../theme/fonts.dart';
import '../widgets/input_field.dart';
import '../widgets/login_widget.dart';
import '../widgets/register_widget.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
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
                    height: 210,
                  )),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              AnimatedSwitcher(
                                switchInCurve: Curves.easeInOutCirc,
                                switchOutCurve: Curves.easeOutCirc,
                                transitionBuilder:
                                    (Widget child, Animation<double> animation) {
                                  return ScaleTransition(
                                      scale: animation, child: child);
                                },
                                duration: const Duration(seconds: 1),
                                child: cubit.renderWidget(),
                              ),
                              const SizedBox(height: 32,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*const SizedBox(
                          height:64,
                        )*/
                ],
              ));
        },
      ),
    );
  }
}
