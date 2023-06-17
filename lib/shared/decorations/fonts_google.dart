import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class FontGoogle {
  //FONTE PARA TEXTO NORMAL
  static TextStyle? textNormaleGoogle({
    required Size size,
    Color? colorText,
    FontWeight? fontWeightStyle,
    double? letter,
  }) =>
      GoogleFonts.getFont(
        'Poppins',
        decoration: TextDecoration.none,
        letterSpacing: letter ?? 0,
        color: colorText ?? const Color(0xff1c1c1c),
        fontSize: size.width * .05,
        fontWeight: fontWeightStyle ?? FontWeight.w400,
      );

//FONTE VOLTADA PARA SUBTITULO
  static TextStyle? textSubTitleGoogle(
          {required Size size, Color? colorText, FontWeight? fontWeightText}) =>
      GoogleFonts.getFont('Poppins',
          decoration: TextDecoration.none,
          color: colorText ?? const Color(0xff1c1c1c),
          fontSize: size.width * .05,
          fontWeight: fontWeightText ?? FontWeight.w500);

//FONTE VOLTADA PARA TITULO
  static TextStyle? textTitleGoogle(
          {required Size size,
          Color? colorText,
          FontWeight? fontWeightGoogle}) =>
      GoogleFonts.getFont(
        'Poppins',
        decoration: TextDecoration.none,
        color: colorText ?? const Color(0xff1c1c1c),
        fontSize: size.width * .06,
        fontWeight: fontWeightGoogle ?? FontWeight.w400,
      );

  static TextStyle? textNormalGreyGoogle({
    required Size size,
    Color? colorText,
    FontWeight? fontWeight,
  }) =>
      GoogleFonts.getFont(
        'Poppins',
        decoration: TextDecoration.none,
        color: colorText ?? const Color(0xff6A6A6A),
        fontSize: size.width * .05,
        fontWeight: fontWeight ?? FontWeight.w400,
      );
}
