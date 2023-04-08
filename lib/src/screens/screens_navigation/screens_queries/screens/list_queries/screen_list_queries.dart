import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/list_queries/widgets/body_full_content.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/list_queries/widgets/body_null_content.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/screen_register_queries.dart';
import 'package:provider/provider.dart';

import '../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../shared/background/screen_background.dart';
import '../../../../../../shared/models/model_pessoa.dart';

class ListQueries extends StatelessWidget {
  const ListQueries({Key? key, required this.pessoa}) : super(key: key);

  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ProviderQueries>(context);

    return FutureBuilder(
      future: provider.initialValues(id: pessoa.pessoaId),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            {
              return Stack(
                children: [
                  const BackgroundPage(),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(
                          color: Color(0xff18CDCA),
                        ),
                        SizedBox(height: size.height * .05),
                        Text(
                          'Obtendo os dados necessários',
                          style: GoogleFonts.getFont('Poppins',
                              decoration: TextDecoration.none,
                              color: const Color(0xff1c1c1c),
                              fontSize: size.width * .05,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          default:
            {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegisterQueries(
                          dataPessoa: pessoa,
                          listEspecialidades:
                              provider.mapEspecialidades['body']),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * .05)),
                  foregroundColor: const Color(0xff1AE8E4),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: size.width * .09,
                  ),
                ),
                body: provider.statusCode != 200
                    ? const NullContentQueries()
                    : const ListContentQueries(),
              );
            }
        }
      },
    );
  }
}
