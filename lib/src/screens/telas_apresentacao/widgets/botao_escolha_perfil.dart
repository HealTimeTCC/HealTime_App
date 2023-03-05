import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EscolherPerfil {
  static ElevatedButton BotaoEscolha(
      {required Color backgroundButton,
      required String textButton,
      required Color colorFontText,
      required int typeNavigator,
      required BuildContext context}) {
    return ElevatedButton(
      onPressed: () {
        _checkNavigator(context: context, type: typeNavigator);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundButton,
        padding: const EdgeInsets.all(16),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
      child: Text(
        textButton,
        style: GoogleFonts.getFont('Poppins',
            decoration: TextDecoration.none,
            color: colorFontText,
            fontSize: 16),
      ),
    );
  }

  static void _checkNavigator(
      {required int type, required BuildContext context}) {
    switch (type) {
      case 1:
        {}
        break;
      case 2:
        {}
        break;
      default:
        {}
    }
  }
}
