import 'package:flutter/material.dart';
import 'package:healtime/shared/dto/dto_query.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/details_query/widgets/alert_cancel_close_query.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/details_query/widgets/model_cart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../shared/decorations/fonts_google.dart';
import '../../../../../../shared/decorations/screen_background.dart';
import 'logic/details_query.dart';

class DetailsQuery extends StatelessWidget {
  const DetailsQuery(
      {super.key,
      required this.queryId,
      required this.personId,
      required this.statusQuery});

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
                          'Status da Consulta',
                          style: FontGoogle.textTitleGoogle(size: size * .8),
                        ),
                      ),
                      if (statusQuery == 1) ...[
                        PopupMenuButton(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: GestureDetector(
                                onTap: () async {
                                  await LogicDetailsQuery.alterStatusQuery(
                                      context: context,
                                      statusId: 2,
                                      motivo: 'Encerramento de consulta.',
                                      personId: personId,
                                      queryId: queryId);
                                  if (context.mounted) Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.close_outlined,
                                      color: Color(0xff1AE8E4),
                                    ),
                                    SizedBox(width: size.width * .02),
                                    Expanded(
                                      child: Text(
                                        'Encerrar agendamento',
                                        style: FontGoogle.textNormaleGoogle(
                                            size: size * .8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  AlertCancelCloseQuery.alertCancelCloneQuery(
                                      context: context,
                                      personId: personId,
                                      queryId: queryId,
                                      status: 3);
                                },
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.delete,
                                      color: Color(0xff1AE8E4),
                                    ),
                                    SizedBox(width: size.width * .02),
                                    Expanded(
                                      child: Text(
                                        'Cancelar agendamento',
                                        style: FontGoogle.textNormaleGoogle(
                                            size: size * .8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ],
                  ),
                ),
                //#endregion

                FutureBuilder(
                  future: LogicDetailsQuery.initialDetailsQuery(
                      context: context, personId: personId, queryId: queryId),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        {
                          return Container();
                        }
                      default:
                        {
                          return Consumer<ProviderQueries>(
                            builder: (context, value, child) {
                              DtoQuery detailsQuery = value.detailsQueryGet!;
                              String nameSpecialty = value.nameEspecialidadeGet;
                              String namePerson = value.namePersonGet!;
                              String nameDoctor = value.nameDoctorGet!;

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .1,
                                    vertical: size.height * .02),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ModelCartSingle(
                                        colorContainer: const Color(0xff18CDCA),
                                        subTitleText: nameSpecialty,
                                        titleText: 'Especialidade: '),
                                    SizedBox(height: size.height * .04),
                                    ModelCartTwo(
                                      colorContainerPrimary:
                                          const Color(0xffD0D0D0),
                                      subTitleTextPrimary:
                                          DateFormat('dd/MM/yyyy').format(
                                        DateTime.parse(detailsQuery
                                            .dataSolicitacaoConsulta),
                                      ),
                                      titleTextPrimary: 'Data de Agendamento:',
                                      subTitleTextSecondary:
                                          DateFormat('dd/MM/yyyy HH:mm').format(
                                        DateTime.parse(
                                            detailsQuery.dataConsulta),
                                      ),
                                      titleTextSecondary: 'Data da Consulta:',
                                      colorContainerSecondary:
                                          const Color(0xffFFB963),
                                    ),
                                    SizedBox(height: size.height * .04),
                                    ModelCartTwo(
                                      colorContainerPrimary:
                                          const Color(0xffFFCC8C),
                                      subTitleTextPrimary: nameDoctor,
                                      titleTextPrimary: 'Seu médico:',
                                      subTitleTextSecondary: namePerson,
                                      titleTextSecondary: 'Paciente:',
                                      colorContainerSecondary:
                                          const Color(0xffE0DFDF),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                    }
                  },
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
