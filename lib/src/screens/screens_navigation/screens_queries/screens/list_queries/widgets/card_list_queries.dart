import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/api/api_queries.dart';
import '../../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../../shared/dto/dto_info_basic_queries.dart';
import '../../../../../../../shared/models/maps/enum_status_consulta.dart';
import '../../../../../../../shared/models/model_especialidades.dart';
import '../../../../../../../shared/models/model_pessoa.dart';

class CardListQueries {
  static Container modelCardList({
    required BuildContext context,
    required DtoInfoBasicQueries infoBasic,
  }) {
    final Size size = MediaQuery.of(context).size;
    final ProviderQueries providerQueries =
        Provider.of<ProviderQueries>(context, listen: false);

    final Iterable<ModelEspecialidades> specialties =
        providerQueries.listSpecialties.where(
      (element) => element.especialidadeId == infoBasic.especialidadeId,
    );

    final ModelEspecialidades specialty = specialties.first;

    /* Container que vai ficar atrás para dar a cor de fundo do card */
    return Container(
      margin: EdgeInsets.only(bottom: size.width * .05),
      decoration: BoxDecoration(
        color: const Color(0xff278F8E),
        borderRadius: BorderRadius.circular(size.width * .02),
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(1, 2),
            color: Colors.black12,
          )
        ],
      ),

      /* Container que vai ficar na frente, responsavel pelo conteúdo do card */
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: size.height * .02,
          horizontal: size.width * .045,
        ),
        margin: EdgeInsets.only(bottom: size.width * .006),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(size.width * .02),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    specialty.descEspecialidade,
                    textAlign: TextAlign.center,
                    style: FontGoogle.textTitleGoogle(
                      size: size * .7,
                    ),
                  ),
                ),
                Icon(
                  infoBasic.encaminhamento == 'S'
                      ? Icons.people_outline
                      : Icons.person_outline,
                  color: const Color(0xff278F8E),
                ),
              ],
            ),
            Text(
              '${DateFormat('dd/MM/yyyy').format(infoBasic.dataConsulta)} - '
              '${DateFormat('HH').format(infoBasic.dataConsulta)}h'
              '${DateFormat('mm').format(infoBasic.dataConsulta)}',
              textAlign: TextAlign.center,
              style: FontGoogle.textSubTitleGoogle(
                size: size * .7,
              ),
            ),
            SizedBox(height: size.height * .03),
            Text(
              infoBasic.motivoConsulta,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: FontGoogle.textNormaleGoogle(
                size: size * .85,
              ),
            ),
            SizedBox(height: size.height * .03),
            Row(
              children: [
                FutureBuilder<Pessoa?>(
                  future: ApiQueries.getDetailsPerson(infoBasic.pacienteId),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        {
                          return _cardUser(
                            size: size,
                            msg: 'Carregando....',
                          );
                        }
                      default:
                        {
                          if (snapshot.data == null) Container();

                          final Pessoa? person = snapshot.data;

                          if (person == null) {
                            return Expanded(
                              flex: 2,
                              child: _cardUser(
                                size: size,
                                msg: 'Não informado',
                              ),
                            );
                          }

                          return Expanded(
                            flex: 2,
                            child: _cardUser(
                              size: size,
                              msg: '${person.nomePessoa} '
                                  '${person.sobreNomePessoa}',
                            ),
                          );
                        }
                    }
                  },
                ),
                SizedBox(
                  width: size.width * .02,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: size.height * .005),
                    decoration: BoxDecoration(
                        color: const Color(0xff58DAD8),
                        borderRadius: BorderRadius.circular(size.width * .03)),
                    child: Text(
                      StatusConsulta[infoBasic.statusConsultaId],
                      textAlign: TextAlign.center,
                      style: FontGoogle.textSubTitleGoogle(
                        size: size * .7,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Container _cardUser({
    required String msg,
    required Size size,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.height * .005,
        horizontal: size.width * .035,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFFCC8C),
        borderRadius: BorderRadius.circular(size.width * .03),
      ),
      child: Text(
        msg,
        textAlign: TextAlign.left,
        style: FontGoogle.textSubTitleGoogle(
          size: size * .75,
        ),
      ),
    );
  }
}
