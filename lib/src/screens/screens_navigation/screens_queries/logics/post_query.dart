import 'package:flutter/material.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/logics/format_date.dart';

import '../../../../../services/api/api_queries.dart';
import '../../../../../shared/dto/dto_query.dart';
import '../../../../../shared/loading/alert_loading.dart';
import '../../../../../shared/models/model_pessoa.dart';

class PostQuery {
  static Future<void> modelPostQuery(
      {required int especialidadeId,
      required int medicoId,
      required DateTime dateAgendamento,
      required TimeOfDay timeAgendamento,
      required DateTime dateConsulta,
      required TimeOfDay timeConsulta,
      required int flagEncaminhamento,
      required String motivoConsulta,
      required Pessoa dataPessoa,
      required BuildContext context}) async {
    /* Exibir mensagem para o usuário */
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.transparent,
        content: LoadingData(textLoading: 'Cadastrando agendamento...'),
      ),
    );

    /* Formatando os dados para envio */
    String dateTimeAgendamento = '';
    String dateTimeConsulta = '';

    dateTimeAgendamento =
        FormatDate.formaDate(date: dateAgendamento, time: timeAgendamento);
    dateTimeConsulta =
        FormatDate.formaDate(date: dateConsulta, time: timeConsulta);

    /* Montando o objeto */
    DtoQuery dtoQuery = DtoQuery(
        motivoConsulta: motivoConsulta,
        dataConsulta: dateTimeConsulta,
        dataSolicitacaoConsulta: dateTimeAgendamento,
        encaminhamento: flagEncaminhamento == 0 ? "S" : "N",
        especialidadeId: especialidadeId,
        medicoId: medicoId,
        pacienteId: dataPessoa.pessoaId,
        statusConsultaId: 1);

    Map<String, dynamic> response = await ApiQueries.postQuery(query: dtoQuery);

    if (context.mounted) {
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).clearSnackBars();
      if (response['statusCode'] == 200) {

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            duration: const Duration(seconds: 2),
            content: Text(
              response['body'],
            ),
          ),
        );
      }
    }
  }
}
