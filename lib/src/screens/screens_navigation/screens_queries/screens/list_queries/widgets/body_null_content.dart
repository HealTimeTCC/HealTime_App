import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NullContentQueries extends StatelessWidget {
  const NullContentQueries({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Align(
      child: Text('Seguinte ainda vou melhorar quando não tiver consulta caramba', 
          style: GoogleFonts.getFont('Poppins',
          decoration: TextDecoration.none,
          color: const Color(0xff1c1c1c),
          fontSize: size.width * .05,
          fontWeight: FontWeight.w400),
        ),
    );
  }
}