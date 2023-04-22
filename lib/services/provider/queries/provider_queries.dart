import 'package:flutter/material.dart';

import '../../../shared/dto/dto_info_basic_queries.dart';
import '../../../shared/dto/dto_post_query.dart';
import '../../../shared/dto/dto_query.dart';
import '../../../shared/loading/alert_loading.dart';
import '../../../shared/models/model_especialidades.dart';
import '../../../src/screens/screens_navigation/screens_queries/logics/logic_format_date.dart';
import '../../api/api_queries.dart';

class ProviderQueries extends ChangeNotifier {
  int _statusCode = 0;
  int get statusCode => _statusCode;

  int _statusQuery = 1;
  int get statusQuery => _statusQuery;

  List<DtoInfoBasicQueries> _listQueries = [];
  List<DtoInfoBasicQueries> get listQueries => _listQueries;

  List<ModelEspecialidades> _listSpecialties = [];
  List<ModelEspecialidades> get listSpecialties => _listSpecialties;

  //ALTERAR O STATUS DA CONSULTA E OBTER NOVOS VALORES DE ACORDO COM STATUS ESCOLHIDO
  void alterListQueries(
      {required int status, required BuildContext context, required int id}) {
    _statusQuery = status;
    initialValues(id: id, context: context, status: _statusQuery);
    notifyListeners();
  }

  Future<void> initialValues(
      {required int id,
      required BuildContext context,
      required int status}) async {
    //LIMPANDO LISTAS PARA RECEBER OS VALORES ATUALIZADOS DA API
    _listQueries.clear();
    _listSpecialties.clear();
    _flagEncaminhado = null;

    /* OBTER OS DADOS BÁSICOS DA CONSULTA MÉDICA */
    Map<String, dynamic> mapData = await ApiQueries.getInfoQueries(
        status: status, id: id, context: context);

    if (mapData['statusCode'] != 0) {
      List<dynamic> listd = mapData['body'];

      _listQueries = listd.map((e) => DtoInfoBasicQueries.fromJson(e)).toList();
      _statusCode = mapData['statusCode'];
    } else {
      _statusCode = 0;
    }
    /*=========================================================================*/

    if (context.mounted) await getSpecialties(context);
  }

  Future<void> getSpecialties(BuildContext context) async {
    Map<String, dynamic> response = await ApiQueries.getEspecialidades(context);
    _listSpecialties.clear();
    _listSpecialties.addAll(response['body']);
  }

  Future<void> postQuery(
      {required PostQuery postQuery, required BuildContext context}) async {
    final scaffold = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    /* Exibir mensagem para o usuário */
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: LoadingData(
            textLoading: 'Cadastrando agendamento...', permissCircula: true),
      ),
    );

    String dateTimeAgendamento = FormatDate.formaDate(
        date: _dtAgendamento!, time: _timeAgendamento!);
    String dateTimeConsulta = FormatDate.formaDate(
        date: _dtConsulta!, time: _timeConsulta!);

    /* Montando o objeto */
    DtoQuery dtoQuery = DtoQuery(
        motivoConsulta: postQuery.reasonConsultation,
        dataConsulta: dateTimeConsulta,
        dataSolicitacaoConsulta: dateTimeAgendamento,
        encaminhamento: _flagEncaminhado == 0 ? "S" : "N",
        especialidadeId: postQuery.specialtyId,
        medicoId: postQuery.doctorId,
        pacienteId: postQuery.dataPerson.pessoaId!,
        statusConsultaId: 1);

    Map<String, dynamic> response =
        await ApiQueries.postQuery(query: dtoQuery, context: context);

    navigator.pop();

    scaffold.clearSnackBars();
    if (response['statusCode'] == 200) {
      notifyListeners();

      if (context.mounted) {
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
      }

      await Future.delayed(const Duration(seconds: 3));

      navigator.pop();
      navigator.pop();
    } else {
      scaffold.showSnackBar(
        SnackBar(
          showCloseIcon: true,
          closeIconColor: Colors.white,
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          content: Text(
            response['body'],
          ),
        ),
      );
    }
  }

  //#region Data e hora da consulta e agendamento
  DateTime? _dtAgendamento = DateTime.now();
  DateTime? get dtAgendamento => _dtAgendamento;

  void addDtAgendamento(DateTime date) {
    _dtAgendamento = date;
    notifyListeners();
  }

  TimeOfDay? _timeAgendamento = TimeOfDay.now();
  TimeOfDay? get timeAgendamento => _timeAgendamento;

  void addTimeAgendamento(TimeOfDay time) {
    _timeAgendamento = time;
    notifyListeners();
  }

  /* Variaveis para a data consulta*/
  DateTime? _dtConsulta = DateTime.now();
  DateTime? get dtConsulta => _dtConsulta;

  void addDateConsulta(DateTime date) {
    _dtConsulta = date;
    notifyListeners();
  }

  TimeOfDay? _timeConsulta = TimeOfDay.now();
  TimeOfDay? get timeConsulta => _timeConsulta;

  void addTimeConsulta(TimeOfDay time) {
    _timeConsulta = time;
    notifyListeners();
  }

//#endregion

  //#region Selecionar especialidade
  String? _valueSelect = 'Cardiologia';
  String? get valueSelect => _valueSelect;

  void select(String? value) {
    _valueSelect = value;
    notifyListeners();
  }
  //#endregion

  //#region Opção de encaminhamento
  int? _flagEncaminhado;
  int? get flagEncaminhado => _flagEncaminhado;

  void addEncaminhamento(int? value) {
    _flagEncaminhado = value;
    print('Olha o valor: $value');
    notifyListeners();
  }
  //endregion

}
