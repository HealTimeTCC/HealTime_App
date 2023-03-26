import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardListQueries {
  static Container modelCardList({required BuildContext context}) {
    final Size size = MediaQuery.of(context).size;
    double borderRadius = 10.0;

    /* Container que vai ficar atrás para dar a cor de fundo do card */
    return Container(
      margin: EdgeInsets.only(bottom: size.width * .05),
      decoration: BoxDecoration(
        color: const Color(0xff278F8E),
        borderRadius: BorderRadius.circular(borderRadius),
      ),

      /* Container que vai ficar na frente, responsavel pelo conteúdo do card */
      child: Container(
        padding: EdgeInsets.all(size.width * .03),
        margin: EdgeInsets.only(bottom: size.width * .01),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Área de especialização',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: const Color(0xff1c1c1c),
                        fontSize: size.width * .04,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(
                  Icons.people_outline,
                  color: Color(0xff278F8E),
                ),
              ],
            ),
            Text(
              '${DateFormat('dd/MM/yyyy').format(DateTime.now())} - '
              '${DateFormat('HH').format(DateTime.now())}h'
              '${DateFormat('mm').format(DateTime.now())}',
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: const Color(0xff1c1c1c),
                  fontSize: size.width * .03,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height * .03),
            Text(
              'Tipo de Local',
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: const Color(0xff1c1c1c),
                  fontSize: size.width * .04,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'Endereço',
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: const Color(0xff1c1c1c),
                  fontSize: size.width * .04,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: size.height * .03),
            Text(
              'Status',
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: const Color(0xff1c1c1c),
                  fontSize: size.width * .045,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
