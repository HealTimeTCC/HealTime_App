import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/shared/decorations/screen_background.dart';

import '../../home_page/home.dart';

class IncluirMedicamento extends StatefulWidget {
  const IncluirMedicamento({super.key});

  @override
  State<IncluirMedicamento> createState() => _IncluirMedicamentoState();
}

class _IncluirMedicamentoState extends State<IncluirMedicamento> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      const BackgroundPage(),
      // Incluir um modal aqui assim:
      // ATENÇÃO! Para inclur um medicamento tenha a receita médica em mãos, pois você ira precisar
      Positioned(
          child: SafeArea(
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 8,
                color: const Color(0xff1AE8E4),
              ),
            ),
            Expanded(
                child: Text(
              'Incluir Médico',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: Color(0xff1c1c1c),
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600),
            ))
          ],
        ),
      ))
    ]);
  }
}
// IconButton(
//               onPressed: () => Navigator.of(context).pop(),
//               icon: Icon(
//                 Icons.arrow_back_ios,
//                 size: 8,
//                 color: const Color(0xff1AE8E4),
//               ),
//             ),
//             IconButton(
//               onPressed: null,
//               icon: Icon(Icons.info_outline),
//               color: Color.fromARGB(166, 117, 117, 117),
//             )