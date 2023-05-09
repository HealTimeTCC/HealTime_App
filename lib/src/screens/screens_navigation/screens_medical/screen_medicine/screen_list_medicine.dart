import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/decorations/screen_background.dart';
import 'Widget/model_list_medicine.dart';

class ListaRemedios extends StatelessWidget {
  const ListaRemedios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackgroundPage(),
        Positioned(
          top: 0,
          right: 20,
          left: 0,
          child: SafeArea(
              child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: Color(0xff18CDCA), size: 35),
              ),
              Expanded(
                child: Text(
                  'Lista de Remédios',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.getFont('Poppins',
                      decoration: TextDecoration.none,
                      color: const Color(0xff1c1c1c),
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )),
        ),
        Positioned(
          top: 150,
          right: 0,
          left: 0,
          child: Center(child: ModelListMedicine()))
      ]),
    );
  }
}
