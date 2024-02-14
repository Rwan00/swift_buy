import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/register_cubit/register_cubit.dart';
import '../cubits/sign_cubit/sign_cubit.dart';
import '../cubits/sign_cubit/sign_state.dart';
import '../theme/body_theme.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopLoginCubit(),
        ),
        BlocProvider(
          create: (context) => ShopRegisterCubit(),
        ),
      ],
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
              backgroundColor: primaryDeepPurple,
              body: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*const SizedBox(
                        height: 24,
                      ),*/
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 190,
                    ),
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
                                transitionBuilder: (Widget child,
                                    Animation<double> animation) {
                                  return ScaleTransition(
                                      scale: animation, child: child);
                                },
                                duration: const Duration(seconds: 1),
                                child: cubit.renderWidget(),
                              ),
                              const SizedBox(
                                height: 32,
                              )
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
