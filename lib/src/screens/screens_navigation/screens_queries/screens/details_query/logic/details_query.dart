import 'package:flutter/cupertino.dart';
import 'package:healtime/shared/dto/dto_encerrar_query.dart';

import '../../../../../../../services/api/api_queries.dart';

class LogicDetailsQuery {
  static Future<void> removeQuery(
      {required BuildContext context,
      required int queryId,
      required int personId}) async {

    EncerrarQuery query = EncerrarQuery(
        consultaId: queryId,
        motivoAlteracao: 'Teste amigsdgsfdgfhgfrhgfdho',
        pacienteId: personId,
        statusConsultaId: 2);

    await ApiQueries.encerrarQuery(query);
  }
}
