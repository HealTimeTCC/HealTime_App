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

    final navigator = Navigator.of(context);
    final scaffold = ScaffoldMessenger.of(context);
    final Size size = MediaQuery.of(context).size;

    /* Exibir mensagem para o usuário */
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.transparent,
        content: LoadingData(textLoading: 'Cadastrando agendamento...', permissCircula: true),
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

    navigator.pop();

    scaffold.clearSnackBars();
    if (response['statusCode'] == 200) {
      showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: LoadingData(textLoading: 'Agendamento cadastrado com sucesso!', permissCircula: false),
        ),
      );

      await Future.delayed(const Duration(seconds: 3));

      navigator.pop();
    } else {
      scaffold.showSnackBar(
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
