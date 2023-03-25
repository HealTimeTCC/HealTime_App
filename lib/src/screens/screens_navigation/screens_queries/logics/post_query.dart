import 'package:flutter/material.dart';
import 'package:healtime/shared/utility/extesion_datetime.dart';

import '../../../../../shared/dto/dto_query.dart';

class PostQuery {
  static Future<void> modelPostQuery({
    required int especialidadeId,
    required int medicoId,
    required DateTime dateAgendamento,
    required TimeOfDay timeAgendamento,
    required DateTime dateConsulta,
    required TimeOfDay timeConsulta,
    required int flagEncaminhamento,
    required String motivoConsulta
  }) async {

    /* Formatando os dados para envio */
    DateTime dateTimeAgendamento = DateTime.now();
    DateTime dateTimeConsulta = DateTime.now();

    dateTimeAgendamento = dateTimeAgendamento.formatDateTimeOfDay(date: , time: );

    /* Montando o objeto */
    DtoQuery dtoQuery = DtoQuery(dataConsulta: dateTimeConsulta,
        dataSolicitacaoConsulta: dateTimeAgendamento,
        encaminhamento: flagEncaminhamento == 0 ? "S" : "N",
        especialidadeId: especialidadeId,
        medicoId: medicoId,
        pacienteId: 1,
        statusConsultaId: 1);
  }
}
