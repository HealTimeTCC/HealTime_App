import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../shared/decorations/screen_background.dart';

class NullContentQueries extends StatelessWidget {
  const NullContentQueries({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        const BackgroundPage(),

        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .08,
              vertical: size.height * .05,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Lottie.asset('assets/json/notfound.json'),
                Text(
              'No momento não existe nenhum agendamento cadastrado.',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: const Color(0xff1c1c1c),
                  fontSize: size.width * .05,
                  fontWeight: FontWeight.w500),
            ),
              ],
            )
          ),
        )
      ],
    );
  }
}
