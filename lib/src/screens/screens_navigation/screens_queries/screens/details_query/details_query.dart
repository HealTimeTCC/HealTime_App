import 'package:flutter/material.dart';
import 'package:healtime/shared/dto/dto_query.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/details_query/widgets/alert_cancel_close_query.dart';
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
    final ProviderQueries providerQueries = Provider.of<ProviderQueries>(context, listen: false);

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
                          'Detalhes da consulta',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontGoogle.textTitleGoogle(size: size * .9),
                        ),
                      ),
                      if (statusQuery == 1) ...[
                        PopupMenuButton(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onSelected: (value) async {
                            switch (value) {
                              case 2:
                                {
                                  await LogicDetailsQuery.alterStatusQuery(
                                      context: context,
                                      statusId: value,
                                      motivo: 'Encerramento de consulta.',
                                      personId: personId,
                                      queryId: queryId);
                                }
                                break;
                              default:
                                {
                                  AlertCancelCloseQuery.alertCancelCloneQuery(
                                      context: context,
                                      personId: personId,
                                      queryId: queryId,
                                      status: value);
                                }
                                break;
                            }
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 2,
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
                            PopupMenuItem(
                              value: 3,
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
                          String nameSpecialty = providerQueries.nameEspecialidadeGet;
                          DtoQuery detailsQuery = providerQueries.detailsQueryGet!;
                          String namePerson = providerQueries.namePersonGet!;
                          String nameDoctor = providerQueries.nameDoctorGet!;

                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .1,
                                vertical: size.height * .02),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Paciente ',
                                  style: FontGoogle.textSubTitleGoogle(
                                      size: size),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * .02),
                                  child: Text(
                                    namePerson,
                                    style: FontGoogle.textNormaleGoogle(
                                        size: size * .85),
                                  ),
                                ),
                                SizedBox(height: size.height * .03),
                                Text(
                                  'Informações da consulta',
                                  textAlign: TextAlign.center,
                                  style: FontGoogle.textTitleGoogle(
                                      size: size * .85),
                                ),
                                SizedBox(height: size.height * .02),
                                Text(
                                  'Seu médico ',
                                  style: FontGoogle.textSubTitleGoogle(
                                      size: size),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * .02),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          nameDoctor,
                                          style:
                                          FontGoogle.textNormaleGoogle(
                                              size: size * .85),
                                        ),
                                      ),
                                      Text(
                                        nameSpecialty,
                                        style: FontGoogle.textNormaleGoogle(
                                            size: size * .85),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: size.height * .02),
                                Text(
                                  'Data da consulta ',
                                  style: FontGoogle.textSubTitleGoogle(
                                      size: size),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * .02),
                                  child: Text(
                                    DateFormat('dd/MM/yyyy HH:mm').format(
                                      DateTime.parse(
                                          detailsQuery.dataConsulta),
                                    ),
                                    style: FontGoogle.textNormaleGoogle(
                                        size: size * .85),
                                  ),
                                ),
                                SizedBox(height: size.height * .02),
                                Text(
                                  'Data da solicitação ',
                                  style: FontGoogle.textSubTitleGoogle(
                                      size: size),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * .02),
                                  child: Text(
                                    DateFormat('dd/MM/yyyy').format(
                                      DateTime.parse(detailsQuery
                                          .dataSolicitacaoConsulta),
                                    ),
                                    style: FontGoogle.textNormaleGoogle(
                                        size: size * .85),
                                  ),
                                ),
                              ],
                            ),
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
}
