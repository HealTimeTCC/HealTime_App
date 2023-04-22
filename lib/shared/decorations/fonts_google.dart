import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FontGoogle {
  //FONTE PARA TEXTO NORMAL
  static TextStyle? textNormaleGoogle({required Size size, Color? colorText}) =>
      GoogleFonts.getFont('Poppins',
          decoration: TextDecoration.none,
          color: colorText ?? const Color(0xff1c1c1c),
          fontSize: size.width * .05,
          fontWeight: FontWeight.w400);

//FONTE VOLTADA PARA SUBTITULO
  static TextStyle? textSubTitleGoogle(
          {required Size size, Color? colorText}) =>
      GoogleFonts.getFont('Poppins',
          decoration: TextDecoration.none,
          color: colorText ?? const Color(0xff1c1c1c),
          fontSize: size.width * .05,
          fontWeight: FontWeight.w500);

//FONTE VOLTADA PARA TITULO
  static TextStyle? textTitleGoogle({required Size size, Color? colorText}) =>
      GoogleFonts.getFont('Poppins',
          decoration: TextDecoration.none,
          color: colorText ?? const Color(0xff1c1c1c),
          fontSize: size.width * .06,
          fontWeight: FontWeight.w400);

  static TextStyle? textNormalGreyGoogle({required Size size, Color? colorText}) =>
      GoogleFonts.getFont('Poppins',
          decoration: TextDecoration.none,
          color: colorText ?? const Color(0xff6A6A6A),
          fontSize: size.width * .05,
          fontWeight: FontWeight.w400);
}
