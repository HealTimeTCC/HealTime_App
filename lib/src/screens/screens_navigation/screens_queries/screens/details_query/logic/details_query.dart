import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healtime/services/provider/login/provider_login.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:healtime/shared/dto/dto_encerrar_query.dart';
import 'package:healtime/shared/dto/dto_query.dart';
import 'package:healtime/shared/models/model_especialidades.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/api/api_queries.dart';
import '../../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../../shared/consts/consts_required.dart';
import '../../../../../../../shared/models/model_doctor.dart';
import '../widgets/alert_cancel_close_query.dart';

class LogicDetailsQuery {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static Future<void> alterStatusQuery(
      {required BuildContext context,
      required int queryId,
      required statusId,
      required String motivo,
      required int personId}) async {
    final NavigatorState navigator = Navigator.of(context);
    final ProviderQueries providerList =
        Provider.of<ProviderQueries>(context, listen: false);
    final ProviderLogin providerLogin =
        Provider.of<ProviderLogin>(context, listen: false);

    EncerrarQuery query = EncerrarQuery(
        consultaId: queryId,
        motivoAlteracao: motivo,
        pacienteId: personId,
        statusConsultaId: statusId);

    final String address = providerLogin.addressServer ?? uriApiBase;

    await ApiQueries.encerrarQuery(query);
    await providerList.alterStatusQuery(queryId, 1, personId, address);

    navigator.pop();
  }

  static Future<void> initialDetailsQuery(
      {required BuildContext context,
      required int personId,
      required int queryId}) async {
    final ProviderQueries providerQueries =
        Provider.of<ProviderQueries>(context, listen: false);

    if (providerQueries.dtoQuery == null) {
      DtoQuery? dtoQuery =
          await ApiQueries.detailsQuery(personId: personId, queryId: queryId);

      providerQueries.addDtoQuery(dtoQuery);

      if (dtoQuery != null) {
        int doctorId = dtoQuery.medicoId;
        int specialtyId = dtoQuery.especialidadeId;

        ModelEspecialidades specialty =
            await ApiQueries.getDetailsSpecialty(specialtyId);
        await providerQueries.addSpecialty(specialty.descEspecialidade);

        Pessoa? person = await ApiQueries.getDetailsPerson(personId);
        await providerQueries
            .addPerson('${person!.nomePessoa} ${person.sobreNomePessoa}');

        Medico? doctor = await ApiQueries.getDetailsDoctor(doctorId);
        await providerQueries.addNameDoctor(doctor!.NmMedico);

        await providerQueries.addDetailsQuery(dtoQuery);
      }
    }
  }

  static Future<void> checkCancelQuery({
    required BuildContext context,
    required int personId,
    required int queryId,
    required String dateStringQuery,
  }) async {
    try {
      final Size size = MediaQuery.of(context).size;
      DateTime dateQuery = DateTime.parse(dateStringQuery);

      bool checkDate = (DateTime.now().isBefore(dateQuery) ||
          dateQuery.isAtSameMomentAs(DateTime.now()));

      if (checkDate) {
        await alterStatusQuery(
          context: context,
          statusId: 2,
          motivo: 'Encerramento de consulta.',
          personId: personId,
          queryId: queryId,
        );
      } else {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.width * .02)
            ),
            backgroundColor: Colors.redAccent,
            duration: const Duration(seconds: 4),
            content: Text(
              'Desculpe, não será possível encerrar a consulta, '
              'pois a data a data atual é antes da data da consulta.',
              style: FontGoogle.textNormaleGoogle(
                size: size * .8,
                colorText: Colors.white,
              ),
            ),
          ),
        );
      }
    } catch (ex) {
      print('Ixi');
    }
  }
}
