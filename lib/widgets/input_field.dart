import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubits/shop_cubit/shop_cubit.dart';
import '../cubits/sign_cubit/sign_cubit.dart';
import '../cubits/sign_cubit/sign_state.dart';
import '../theme/body_theme.dart';
import '../theme/fonts.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final TextInputType? textType;
  final bool isPassword;

  const InputField(
      {required this.title,
      required this.hint,
      this.controller,
      this.widget,
      this.textType,
      this.isPassword = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider ( create: (context) => ShopLoginCubit(),),
      BlocProvider ( create: (context) => ShopCubit(),),
      ],
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          bool showPwd = cubit.showPwd;
          return Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      obscuringCharacter: "♡",
                      obscureText: isPassword && !showPwd,
                      controller: controller,
                      keyboardType: textType,
                      autofocus: false,
                      style: titleStyle,
                      cursorColor: primaryPurple,
                      decoration: InputDecoration(
                        suffixIcon: isPassword
                            ? IconButton(
                                onPressed: () {
                                  cubit.changePasswordVisibility();
                                },
                                icon: cubit.icon,
                              )
                            : widget,
                        hintText: hint,
                        hintStyle: subTitle,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: primaryDeepPurple,
                              width: 2,
                            )),
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
