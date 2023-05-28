import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healtime/shared/dto/dto_query.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/screens/details_query/widgets/alert_cancel_close_query.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../shared/decorations/fonts_google.dart';
import 'logic/details_query.dart';

class DetailsQuery extends StatefulWidget {
  const DetailsQuery(
      {super.key,
      required this.queryId,
      required this.personId,
      required this.statusQuery});

  final int queryId;
  final int personId;
  final int statusQuery;

  @override
  State<DetailsQuery> createState() => _DetailsQueryState();
}

class _DetailsQueryState extends State<DetailsQuery> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ProviderQueries providerQueries =
        Provider.of<ProviderQueries>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xffFFEEDA),
      body: SafeArea(
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
                    onPressed: () async {
                      await providerQueries.addQueryDispose();
                      if (context.mounted) Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: size.width * .08,
                      color: const Color(0xff004241),
                    ),
                  ),
                  SizedBox(width: size.width * .02),
                  Expanded(
                    child: Text(
                      'Detalhes da consulta',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: FontGoogle.textTitleGoogle(
                        size: size * .9,
                        colorText: const Color(0xff004241),
                      ),
                    ),
                  ),
                  if (widget.statusQuery == 1) ...[],
                ],
              ),
            ),
            //#endregion

            FutureBuilder(
              future: LogicDetailsQuery.initialDetailsQuery(
                  context: context,
                  personId: widget.personId,
                  queryId: widget.queryId),
              builder: (context, snapshot) {


                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    {
                      return Column(
                        children: [
                          SizedBox(height: size.height * .35),
                          const CircularProgressIndicator(
                            color: Color(0xff004241),
                          ),
                          SizedBox(height: size.height * .04),
                          Text(
                            'Obtendo informações...',
                            style: FontGoogle.textNormaleGoogle(size: size),
                          )
                        ],
                      );
                    }
                  default:
                    {
                      final String nameSpecialty =
                          providerQueries.nameEspecialidadeGet;
                      final String namePerson = providerQueries.namePersonGet!;
                      final DtoQuery detailsQuery =
                          providerQueries.detailsQueryGet!;
                      final String nameDoctor = providerQueries.nameDoctorGet!;

                      return Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: SvgPicture.asset(
                              'assets/svg/user.svg',
                              height: size.height * .18,
                            ),
                          ),
                          SizedBox(
                            height: size.height * .892,
                            child: Container(
                              margin: EdgeInsets.only(top: size.height * .2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(size.width * .1),
                                  topRight: Radius.circular(size.width * .1),
                                ),
                              ),
                              child: ListView(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * .08,
                                    vertical: size.height * .03),
                                children: [
                                  Text(
                                    namePerson,
                                    style: FontGoogle.textTitleGoogle(
                                        size: size,
                                        fontWeightGoogle: FontWeight.w700),
                                  ),
                                  Text(
                                    'Médico(a): $nameDoctor',
                                    style: FontGoogle.textTitleGoogle(
                                      size: size * .8,
                                    ),
                                  ),
                                  SizedBox(height: size.height * .02),
                                  Text(
                                    'Detalhes',
                                    style: FontGoogle.textTitleGoogle(
                                        size: size * .8,
                                        fontWeightGoogle: FontWeight.w600),
                                  ),
                                  const Divider(
                                    color: Color(0xff949999),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Data da consulta',
                                          style: FontGoogle.textTitleGoogle(
                                              size: size * .7,
                                              fontWeightGoogle:
                                                  FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        DateFormat('dd/MM/yyyy').format(
                                            DateTime.parse(
                                                detailsQuery.dataConsulta)),
                                        style: FontGoogle.textTitleGoogle(
                                            size: size * .7,
                                            fontWeightGoogle: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * .01),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Hora da consulta',
                                          style: FontGoogle.textTitleGoogle(
                                              size: size * .7,
                                              fontWeightGoogle:
                                                  FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        '${DateFormat('HH:mm').format(DateTime.parse(detailsQuery.dataConsulta))}h',
                                        style: FontGoogle.textTitleGoogle(
                                            size: size * .7,
                                            fontWeightGoogle: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * .02),
                                  Text(
                                    'Motivo consulta',
                                    style: FontGoogle.textTitleGoogle(
                                        size: size * .8,
                                        fontWeightGoogle:
                                        FontWeight.w600),
                                  ),
                                  SizedBox(height: size.height * .01),
                                  Text(
                                    detailsQuery.motivoConsulta,
                                    style: FontGoogle.textTitleGoogle(
                                        size: size * .7,
                                        fontWeightGoogle: FontWeight.w500),
                                  ),

                                  SizedBox(height: size.height * .02),
                                  Text(
                                    'Especialidade',
                                    style: FontGoogle.textTitleGoogle(
                                        size: size * .8,
                                        fontWeightGoogle: FontWeight.w600),
                                  ),
                                  SizedBox(height: size.height * .01),
                                  Text(
                                    nameSpecialty,
                                    style: FontGoogle.textTitleGoogle(
                                        size: size * .7,
                                        fontWeightGoogle: FontWeight.w500),
                                  ),
                                  if (widget.statusQuery == 1) ...[
                                    SizedBox(height: size.height * .05),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () async =>
                                                await LogicDetailsQuery
                                                    .alterStatusQuery(
                                                        context: context,
                                                        statusId: 2,
                                                        motivo:
                                                            'Encerramento de consulta.',
                                                        personId:
                                                            widget.personId,
                                                        queryId:
                                                            widget.queryId),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: size.height * .01),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFFB963),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        size.width * .02),
                                              ),
                                              child: Text(
                                                'Encerrar',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FontGoogle.textTitleGoogle(
                                                        size: size * .8,
                                                        fontWeightGoogle:
                                                            FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: size.width * .05),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () => AlertCancelCloseQuery
                                                .alertCancelCloneQuery(
                                                    context: context,
                                                    personId: widget.personId,
                                                    queryId: widget.queryId,
                                                    status: 3),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: size.height * .01),
                                              decoration: BoxDecoration(
                                                color: const Color(0xff58DAD8),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        size.width * .02),
                                              ),
                                              child: Text(
                                                'Cancelar',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FontGoogle.textTitleGoogle(
                                                        size: size * .8,
                                                        fontWeightGoogle:
                                                            FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
