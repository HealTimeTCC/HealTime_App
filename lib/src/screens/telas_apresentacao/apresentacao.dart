import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Apresentacao extends StatelessWidget {
  const Apresentacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: const Color(0xff18CDCA),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.05),
              child: Text(
                textAlign: TextAlign.center,
                'Selecione um tipo de perfil',
                style: GoogleFonts.getFont('Poppins',
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: size.height * 0.2),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1AE8E4),
                padding: const EdgeInsets.all(16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
              child: Text(
                'Cuidador',
                style: GoogleFonts.getFont('Poppins',
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff172331),
                padding: const EdgeInsets.all(16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
              child: Text(
                'Paciente',
                style: GoogleFonts.getFont('Poppins',
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
              child: Text(
                'Resposánvel',
                style: GoogleFonts.getFont('Poppins',
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
