import 'package:flutter/material.dart';


import '../theme/body_theme.dart';
import '../theme/fonts.dart';

class InputField extends StatefulWidget {
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
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool showPwd = false;
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
              widget.title,
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
                obscureText: widget.isPassword && !showPwd,
                controller: widget.controller,
                keyboardType: widget.textType,
                autofocus: false,
                style: titleStyle,
                cursorColor: primaryPurple,
                decoration: InputDecoration(
                  suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPwd = !showPwd;
                      });
                    },
                    icon:
                        Icon(showPwd ? Icons.visibility_outlined : Icons.visibility_off_outlined))
                : widget.widget,
                  hintText: widget.hint,
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
