import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healtime/shared/dto/dto_encerrar_query.dart';
import 'package:provider/provider.dart';

import '../../../../../../../services/api/api_queries.dart';
import '../../../../../../../services/provider/queries/provider_queries.dart';

class LogicDetailsQuery {
  static Future<void> alterStatusQuery(
      {required BuildContext context,
      required int queryId,
        required statusId,
      required int personId}) async {

    final NavigatorState navigator = Navigator.of(context);
    final ProviderQueries providerList = Provider.of<ProviderQueries>(context, listen:  false);

    EncerrarQuery query = EncerrarQuery(
        consultaId: queryId,
        motivoAlteracao: 'Teste amigsdgsfdgfhgfrhgfdho',
        pacienteId: personId,
        statusConsultaId: statusId);

    await ApiQueries.encerrarQuery(query);
    providerList.alterStatusQuery(queryId, statusId);

    navigator.pop();
  }
}
