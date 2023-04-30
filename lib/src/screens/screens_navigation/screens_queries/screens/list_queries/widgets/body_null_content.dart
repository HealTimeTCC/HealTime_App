import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../../shared/decorations/screen_background.dart';

class NullContentQueries extends StatelessWidget {
  const NullContentQueries({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderQueries>(context);
    final Size size = MediaQuery.of(context).size;

    return Align(
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
                _messageNotFound(provider.statusQuery),
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont('Poppins',
                    decoration: TextDecoration.none,
                    color: const Color(0xff1c1c1c),
                    fontSize: size.width * .05,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )),
    );
  }

  String _messageNotFound(int status) {
    switch (status) {
      case 1:
        {
          return 'Não há consultas agendadas no momento.';
        }
      case 2:
        {
          return 'Não há consultas encerradas registradas.';
        }
      case 3:
        {
          return 'Não há consultas canceladas no momento.';
        }
      case 4:
        {
          return 'Não há consultas remarcadas registradas.';
        }
      default:
        {
          return 'Não há consultas em fila de espera no momento.';
        }
    }
  }
}
