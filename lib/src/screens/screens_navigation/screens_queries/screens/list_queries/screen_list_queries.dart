import 'package:flutter/material.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/list_queries/widgets/body_full_content.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/list_queries/widgets/body_null_content.dart';
import 'package:provider/provider.dart';

import '../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../shared/decorations/fonts_google.dart';
import '../../../../../../shared/decorations/screen_background.dart';
import '../../../../../../shared/models/model_pessoa.dart';
import '../register_queries/screen_register_queries.dart';

class ListQueries extends StatelessWidget {
  const ListQueries({Key? key, required this.pessoa}) : super(key: key);

  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer<ProviderQueries>(
      builder: (context, value, child) => FutureBuilder(
        future: value.initialValues(
          id: pessoa.pessoaId!,
          context: context,
          status: value.statusQuery,
        ),
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
                            style: FontGoogle.textNormaleGoogle(size: size),
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
                    elevation: 1,
                    onPressed: () {
                      value.disposeEncaminhamento();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterQueries(
                              dataPessoa: pessoa
                          ),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width * .05),
                    ),
                    foregroundColor: const Color(0xff1AE8E4),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: size.width * .09,
                    ),
                  ),
                  //EXIBIR A VIEW DE ACORDO COM O CONTEUDO QUE CHEGAR DA API
                  body: value.statusCode != 200
                      ? const NullContentQueries()
                      : ListContentQueries(idPerson: pessoa.pessoaId!),
                );
              }
          }
        },
      ),
    );
  }
}
