import 'package:flutter/material.dart';
import 'package:swift_buy/widgets/my_btn.dart';

import '../widgets/input_field.dart';

class EditInfoScreen extends StatelessWidget {
  const EditInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
            const SizedBox(height: 24,),
            SizedBox(
              width: 120,
                height: 42,
                child: AppBtn(
                    label: "Save",
                    onPressed: (){},
                ),
            ),
          ],
        ),
      ),
    );
  }
}
