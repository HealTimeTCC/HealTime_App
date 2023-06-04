import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            vertical: size.height * .02, horizontal: size.width * .05),
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
                    style: GoogleFonts.getFont(
                      'Poppins',
                      decoration: TextDecoration.none,
                      color: const Color(0xff1c1c1c),
                      fontSize: size.width * .04,
                      fontWeight: FontWeight.w600,
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
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: const Color(0xff1c1c1c),
                  fontSize: size.width * .03,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: size.height * .03),
            Text(
              infoBasic.motivoConsulta,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.getFont('Poppins',
                  decoration: TextDecoration.none,
                  color: const Color(0xff1c1c1c),
                  fontSize: size.width * .04,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400),
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
                          return Container(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * .005,
                                horizontal: size.width * .03),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFCC8C),
                              borderRadius:
                                  BorderRadius.circular(size.width * .03),
                            ),
                            child: Text(
                              'Obtendo dados...',
                              textAlign: TextAlign.center,
                              style: FontGoogle.textSubTitleGoogle(
                                size: size * .8,
                              ),
                            ),
                          );
                        }
                      default:
                        {
                          if (snapshot.data == null) Container();

                          final Pessoa person = snapshot.data!;

                          return Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * .005,
                                  horizontal: size.width * .03),
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFCC8C),
                                  borderRadius:
                                      BorderRadius.circular(size.width * .03)),
                              child: Text(
                                '${person.nomePessoa} ${person.sobreNomePessoa}',
                                style: FontGoogle.textSubTitleGoogle(
                                  size: size * .8,
                                ),
                              ),
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
                        size: size * .75,
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
}
