import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/body_theme.dart';

class AppBtn extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final Color? clr ;
   const AppBtn({required this.label, required this.onPressed,this.clr, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle:
                MaterialStateProperty.all(GoogleFonts.raleway(fontSize: 16)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(clr ?? primaryDeepPurple.withOpacity(0.6))),
        child: Text(
          label,
        ),
        );
  }
}
