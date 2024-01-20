import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'body_theme.dart';


TextStyle get heading {
  return GoogleFonts.raleway(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: primaryDeepPurple
  );
}
TextStyle get subTitle {
  return GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: const Color.fromRGBO(112, 123, 129, 1)
  );
}

TextStyle get titleStyle {
  return GoogleFonts.raleway(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: primaryDeepPurple
  );
}
