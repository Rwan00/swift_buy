import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy/cubits/shop_cubit/shop_state.dart';
import 'package:swift_buy/models/login_model.dart';
import 'package:swift_buy/widgets/my_btn.dart';

import '../cubits/shop_cubit/shop_cubit.dart';
import '../methods/methods.dart';
import '../widgets/input_field.dart';

class EditInfoScreen extends StatelessWidget {
  final ShopLoginModel userData;
  const EditInfoScreen({required this.userData, super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopCubit.get(context);
          usernameController.text = userData.data!.name!;
          emailController.text = userData.data!.email!;
          phoneController.text = userData.data!.phone!;
          print(userData.data!.name);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Edit"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                    title: "Phone",
                    hint: '+20*****',
                    controller: phoneController,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 120,
                    height: 42,
                    child: AppBtn(
                      label: "Save",
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 120,
                    height: 42,
                    child: AppBtn(
                      clr: const Color.fromARGB(255, 118, 3, 3),
                      label: "Log Out",
                      onPressed: () => buildDialog(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
