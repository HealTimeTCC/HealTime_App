import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/dto/dto_info_basic_queries.dart';
import '../../../shared/dto/dto_post_query.dart';
import '../../../shared/dto/dto_query.dart';
import '../../../shared/loading/alert_loading.dart';
import '../../../shared/models/model_doctor.dart';
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

  Medico? _doctor;

  Medico? get doctor => _doctor;

  DtoQuery? _dtoQuery;

  DtoQuery? get dtoQuery => _dtoQuery;

  void disposeDoctor() {
    _doctor = null;
    notifyListeners();
  }

  void addDtoQuery(DtoQuery? newDtoQuery) {
    _dtoQuery = newDtoQuery;
    notifyListeners();
  }

  Future<void> addQueryDispose() async {
    _dtoQuery = null;
    notifyListeners();
  }

  void addDoctor(Medico newDoctor) {
    _doctor = newDoctor;
    notifyListeners();
  }

  Future<void> alterStatusQuery(
      int queryId, int statusId, int personId, String address) async {

    if (_listQueries.isNotEmpty) {
      _listQueries
          .where((element) => element.consultasAgendadasId == queryId)
          .first
          .statusConsultaId = statusId;
      _statusQuery = statusId;
    }
    await initialValues(id: personId, address: address);
  }

  //ALTERAR O STATUS DA CONSULTA E OBTER NOVOS VALORES DE ACORDO COM STATUS ESCOLHIDO
  void alterListQueries(
      {required int status, required String address, required int id}) {
    _statusQuery = status;
    initialValues(id: id, address: address);
    notifyListeners();
  }

  DtoQuery? _detailsQuery;

  DtoQuery? get detailsQueryGet => _detailsQuery;

  String _nameEspecialidadeGet = '';

  String get nameEspecialidadeGet => _nameEspecialidadeGet;

  String? _namePersonGet;

  String? get namePersonGet => _namePersonGet;

  String? _nameDoctorGet;

  String? get nameDoctorGet => _nameDoctorGet;

  Future<void> addDetailsQuery(DtoQuery newDetailsQuery) async =>
      _detailsQuery = newDetailsQuery;

  Future<void> addSpecialty(String specialty) async =>
      _nameEspecialidadeGet = specialty;

  Future<void> addPerson(String namePerson) async =>
      _namePersonGet = namePerson;

  Future<void> addNameDoctor(String nameDoctor) async =>
      _nameDoctorGet = nameDoctor;

  void disposeDetailsQuery() {
    _detailsQuery = null;
    notifyListeners();
  }

  Future<void> initialValues({required int id, required String address}) async {
    _listQueries.clear();
    Map<String, dynamic> mapData = await ApiQueries.getInfoQueries(
        status: _statusQuery, id: id, addressServer: address);

    if (mapData['statusCode'] == 200) {
      List<dynamic> listData = mapData['body'];

      _listQueries =
          listData.map((e) => DtoInfoBasicQueries.fromJson(e)).toList();
      _statusCode = mapData['statusCode'];
    } else {
      _statusCode = 0;
    }
    notifyListeners();
  }

  Future<void> getSpecialties(BuildContext context) async {
    _listSpecialties.clear();
    Map<String, dynamic> response = await ApiQueries.getEspecialidades(context);
    _listSpecialties.addAll(response['body']);
  }

  Future<void> postQuery({
    required PostQuery postQuery,
    required BuildContext context,
  }) async {
    final scaffold = ScaffoldMessenger.of(context);
    final Size size = MediaQuery.of(context).size;

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

    String dateTimeAgendamento =
        FormatDate.formaDate(date: _dtAgendamento!, time: _timeAgendamento!);
    String dateTimeConsulta =
        FormatDate.formaDate(date: _dtConsulta!, time: _timeConsulta!);

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

    scaffold.clearSnackBars();
    if (response['statusCode'] == 200) {
      if (context.mounted) {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            content: const LoadingData(
              textLoading: 'Agendamento cadastrado com sucesso!',
              permissCircula: false,
            ),
            actions: [
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * .01,
                        horizontal: size.width * .2),
                    backgroundColor: const Color(0xff1AE8E4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(size.width),
                    ),
                  ),
                  child: Text(
                    'Ok!',
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: const Color(0xff172331),
                        fontSize: size.width * .05,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          ),
        );
      }
    } else {
      throw Exception(response['body']);
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
    notifyListeners();
  }

  void disposeEncaminhamento() {
    _flagEncaminhado = null;
    notifyListeners();
  }
//endregion
}
