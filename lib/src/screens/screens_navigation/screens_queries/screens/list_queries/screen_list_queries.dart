import 'package:flutter/material.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/list_queries/widgets/body_full_content.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/list_queries/widgets/body_null_content.dart';
import 'package:provider/provider.dart';

import '../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../shared/decorations/fonts_google.dart';
import '../../../../../../shared/decorations/screen_background.dart';
import '../../../../../../shared/models/maps/enum_status_consulta.dart';
import '../../../../../../shared/models/model_pessoa.dart';
import '../register_queries/screen_register_queries.dart';

class ListQueries extends StatefulWidget {
  const ListQueries({Key? key, required this.pessoa}) : super(key: key);

  final Pessoa pessoa;

  @override
  State<ListQueries> createState() => _ListQueriesState();
}

class _ListQueriesState extends State<ListQueries> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ProviderQueries>(context);

    return Consumer<ProviderQueries>(
      builder: (context, value, child) => RefreshIndicator(
        onRefresh: () async => setState(() {}),
        color: const Color(0xff1AE8E4),
        child: FutureBuilder(
          future: value.initialValues(
            id: widget.pessoa.pessoaId!,
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
                            builder: (context) =>
                                RegisterQueries(dataPessoa: widget.pessoa),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.width * .05),
                      ),
                      foregroundColor: const Color(0xff1AE8E4),
                      backgroundColor: const Color(0xff1AE8E4),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: size.width * .09,
                      ),
                    ),
                    //EXIBIR A VIEW DE ACORDO COM O CONTEUDO QUE CHEGAR DA API
                    body: Stack(
                      children: [
                        const BackgroundPage(),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /* AppBar personalizada */
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * .03),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            size: size.width * .08,
                                            color: const Color(0xff1AE8E4),
                                          ),
                                        ),
                                        SizedBox(width: size.width * .02),
                                        Expanded(
                                          child: Text(
                                            'Minhas consultas',
                                            style: FontGoogle.textTitleGoogle(
                                                size: size),
                                          ),
                                        ),
                                        PopupMenuButton(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          itemBuilder: (context) =>
                                              StatusConsulta.keys
                                                  .map((int value) {
                                            return PopupMenuItem(
                                              value: value,
                                              onTap: () {
                                                provider.alterListQueries(
                                                    status: value,
                                                    context: context,
                                                    id: widget
                                                        .pessoa.pessoaId!);
                                              },
                                              child: Text(
                                                StatusConsulta[value],
                                                style: FontGoogle
                                                    .textNormaleGoogle(
                                                        size: size),
                                              ),
                                            );
                                          }).toList(),
                                          child: Icon(
                                            Icons.filter_alt_outlined,
                                            color: const Color(0xff1AE8E4),
                                            size: size.width * .08,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        value.statusCode != 200
                            ? const NullContentQueries()
                            : ListContentQueries(
                                idPerson: widget.pessoa.pessoaId!),
                      ],
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
