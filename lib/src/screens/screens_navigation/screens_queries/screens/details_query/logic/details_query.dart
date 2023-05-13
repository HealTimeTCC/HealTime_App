import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healtime/services/provider/login/provider_login.dart';
import 'package:healtime/shared/dto/dto_encerrar_query.dart';
import 'package:healtime/shared/dto/dto_query.dart';
import 'package:healtime/shared/models/model_especialidades.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/api/api_queries.dart';
import '../../../../../../../services/provider/queries/provider_queries.dart';
import '../../../../../../../shared/consts/consts_required.dart';
import '../../../../../../../shared/models/model_doctor.dart';

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
        Provider.of<ProviderQueries>(context);

    DtoQuery? dtoQuery =
        await ApiQueries.detailsQuery(personId: personId, queryId: queryId);

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
