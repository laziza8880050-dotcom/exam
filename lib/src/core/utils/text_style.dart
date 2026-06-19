import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension CustomTextStyle on BuildContext {
  TextStyle customTextStyle({
    int maxLines =2,
    TextOverflow? overflow  =TextOverflow.ellipsis,
    Color color = Colors.white,
    double fontSize = 20,
    FontWeight weight = FontWeight.normal,
  }) => GoogleFonts.montserrat(color: color, fontSize: fontSize, fontWeight: weight, );
}
