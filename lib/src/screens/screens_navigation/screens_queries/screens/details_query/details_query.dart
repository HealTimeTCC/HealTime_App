import 'package:flutter/material.dart';

import '../../../../../../shared/decorations/fonts_google.dart';
import '../../../../../../shared/decorations/screen_background.dart';
import 'logic/details_query.dart';

class DetailsQuery extends StatelessWidget {
  const DetailsQuery(
      {super.key, required this.queryId, required this.personId, required this.statusQuery});

  final int queryId;
  final int personId;
  final int statusQuery;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //#region Appbar personalizada
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: size.width * .08,
                          color: const Color(0xff1AE8E4),
                        ),
                      ),
                      SizedBox(width: size.width * .02),
                      Expanded(
                        child: Text(
                          'Detalhes',
                          style: FontGoogle.textTitleGoogle(size: size),
                        ),
                      ),
                      if (statusQuery == 1) ... [
                        PopupMenuButton(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () async => await LogicDetailsQuery.removeQuery(
                                  context: context,
                                  personId: personId,
                                  queryId: queryId),
                              child: Text('Encerrar agendamento'),
                            ),
                            PopupMenuItem(
                              child: Text('Cancelar agendamento'),
                            )
                          ],
                        )
                      ],
                    ],
                  ),
                ),
                //#endregion

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * .1, vertical: size.height * .02),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Nome do paciente',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: FontGoogle.textSubTitleGoogle(size: size),
                      ),
                      SizedBox(height: size.height * .02),
                      Text(
                        'Data da consulta',
                        textAlign: TextAlign.center,
                        style: FontGoogle.textSubTitleGoogle(size: size),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: size.width * .02),
                        child: Text(
                          '2023-10-02 11:15',
                          style: FontGoogle.textNormaleGoogle(size: size * .8),
                        ),
                      ),
                      SizedBox(height: size.height * .02),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Conheça o médico',
                            textAlign: TextAlign.center,
                            style: FontGoogle.textSubTitleGoogle(size: size),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * .02),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Nome do médico',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: FontGoogle.textNormaleGoogle(
                                        size: size * .8),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * .02,
                                ),
                                Text(
                                  'Especialidade',
                                  style: FontGoogle.textNormaleGoogle(
                                      size: size * .8),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * .03),
                      Text(
                        'Detalhes da consulta',
                        textAlign: TextAlign.center,
                        style: FontGoogle.textSubTitleGoogle(size: size),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * .02),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: size.height * .02),
                            Text(
                              _messageStatusQuery(1),
                              style:
                                  FontGoogle.textNormaleGoogle(size: size * .8),
                            ),
                            SizedBox(height: size.height * .02),
                            Text(
                              _messageEncaminhamento(1),
                              style:
                                  FontGoogle.textNormaleGoogle(size: size * .8),
                            ),
                            SizedBox(height: size.height * .02),
                            Text(
                              'Motivo da consulta',
                              style: FontGoogle.textSubTitleGoogle(
                                  size: size * .9),
                            ),
                            Text(
                              _messageEncaminhamento(1),
                              style:
                                  FontGoogle.textNormaleGoogle(size: size * .8),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String _messageEncaminhamento(status) {
    switch (status) {
      case 1:
        {
          return 'Para essa consulta, é importante que o paciente vá acompanhado.';
        }
      default:
        {
          return 'Para essa consulta, o paciente pode comparecer sozinho, sem a '
              'necessidade de acompanhante.';
        }
    }
  }

  String _messageStatusQuery(int status) {
    switch (status) {
      case 1:
        {
          return 'Sua consulta está agendada com sucesso. '
              'Aguarde a data e horário marcados.';
        }
      case 2:
        {
          return 'Sua consulta foi concluída. Esperamos que '
              'tenha sido útil e que tenha tido uma boa experiência.';
        }
      case 3:
        {
          return 'Sua consulta foi cancelada. Pedimos desculpas pelo '
              'transtorno e estamos à disposição para agendar uma nova consulta.';
        }
      case 4:
        {
          return 'Sua consulta foi remarcada com sucesso. Aguarde a nova data e '
              'horário marcados.';
        }
      default:
        {
          return 'Sua consulta está em nossa lista de espera. Assim que houver '
              'disponibilidade, entraremos em contato com você.';
        }
    }
  }
}
