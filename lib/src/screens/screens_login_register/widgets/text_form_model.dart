import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModelTextForm {
  static Container modelTextForm(
      {required Size size,
      required String textLabel,
      required TextInputType typeKeyboard,
      required bool obscure,
      IconData? icon,
      Color? iconColor, required bool validator}) {

    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.04),
      child: TextFormField(
        obscureText: obscure,
        keyboardType: typeKeyboard,
        style: const TextStyle(
            letterSpacing: 1,
            color: Color(0xff1c1c1c),
            fontWeight: FontWeight.w400,
            fontSize: 18),
        cursorColor: const Color(0xff1c1c1c),
        autofocus: true,
        validator: (text) {
          if ((text == null || text.isEmpty || text.length <= 2) && obscure && validator == true) {
            return 'Senha inválida.';
          }else if (!obscure && validator == true && (text == null || text.isEmpty )) {
            return 'Campo obrigatório';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: !obscure ? null : Icon(icon, color: iconColor),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color(0xff1c1c1c), width: size.width * 0.004)),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color(0xff1c1c1c), width: size.width * 0.004)),
          labelText: textLabel,
          labelStyle: GoogleFonts.getFont('Poppins',
              decoration: TextDecoration.none,
              color: const Color(0xff1c1c1c),
              fontSize: 15,
              letterSpacing: 1,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
