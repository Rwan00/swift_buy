import 'package:flutter/material.dart';


import '../theme/body_theme.dart';
import '../theme/fonts.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final TextInputType? textType;

  const InputField(
      {required this.title,
      required this.hint,
      this.controller,
      this.widget,
      this.textType,
      super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                controller: controller,
                keyboardType: textType,
                autofocus: false,
                style: titleStyle,
                cursorColor: primaryPurple,
                decoration: InputDecoration(
                  suffixIcon: widget,
                  hintText: hint,
                  hintStyle: subTitle,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: lightPurple,
                        style: BorderStyle.solid,
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: primaryDeepPurple,
                        width: 1,
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
