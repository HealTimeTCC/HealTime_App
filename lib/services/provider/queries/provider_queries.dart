import 'package:flutter/material.dart';

import '../../../shared/dto/dto_info_basic_queries.dart';
import '../../../shared/dto/dto_query.dart';
import '../../../shared/loading/alert_loading.dart';
import '../../../shared/models/model_pessoa.dart';
import '../../../src/screens/screens_navigation/screens_queries/logics/format_date.dart';
import '../../api/api_queries.dart';

class ProviderQueries extends ChangeNotifier {
  int _statusCode = 0;
  int get statusCode => _statusCode;

  List<DtoInfoBasicQueries> _listQueries = [];
  List<DtoInfoBasicQueries> get listQueries => _listQueries;

  Map<String, dynamic> _mapEspecialidades = {};
  Map<String, dynamic> get mapEspecialidades => _mapEspecialidades;

  Future<void> initialValues({required int id}) async {
    //LIMPANDO LISTAS PARA RECEBER OS VALORES ATUALIZADOS DA API
    _listQueries.clear();
    _mapEspecialidades.clear();

    /* OBTER OS DADOS BÁSICOS DA CONSULTA MÉDICA */
    Map<String, dynamic> mapData =
        await ApiQueries.getInfoQueries(status: 1, id: id);

    if (mapData['statusCode'] != 0) {
      List<dynamic> listd = mapData['body'];

      _listQueries = listd.map((e) => DtoInfoBasicQueries.fromJson(e)).toList();
      _statusCode = mapData['statusCode'];
    }else {
      _statusCode = 0;
    }
    /*=========================================================================*/

    /* PRÉ-CARREGAR AS ESPECIALIDADES PARA O ENVIO */

    _mapEspecialidades = await ApiQueries.getEspecialidades();

    /*=========================================================================*/
  }


  Future<void> postQuerie({
    required int especialidadeId,
    required int medicoId,
    required DateTime dateAgendamento,
    required TimeOfDay timeAgendamento,
    required DateTime dateConsulta,
    required TimeOfDay timeConsulta,
    required int flagEncaminhamento,
    required String motivoConsulta,
    required Pessoa dataPessoa,
    required BuildContext context
  }) async
  {
    final navigator = Navigator.of(context);
    final scaffold = ScaffoldMessenger.of(context);

    /* Exibir mensagem para o usuário */
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.transparent,
        content: LoadingData(
            textLoading: 'Cadastrando agendamento...', permissCircula: true),
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
        pacienteId: dataPessoa.pessoaId!,
        statusConsultaId: 1);

    Map<String, dynamic> response = await ApiQueries.postQuery(query: dtoQuery);

    navigator.pop();

    scaffold.clearSnackBars();
    if (response['statusCode'] == 200) {

      notifyListeners();

      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: LoadingData(
              textLoading: 'Agendamento cadastrado com sucesso!',
              permissCircula: false),
        ),
      );

      await Future.delayed(const Duration(seconds: 3));

      navigator.pop();
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
