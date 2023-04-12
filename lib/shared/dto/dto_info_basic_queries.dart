class DtoInfoBasicQueries {
  DtoInfoBasicQueries(
      {required this.consultasAgendadasId,
      required this.dataConsulta,
      required this.dataSolicitacaoConsulta,
      required this.encaminhamento,
      required this.especialidadeId,
      required this.medicoId,
      required this.motivoConsulta,
      required this.pacienteId,
      required this.statusConsultaId});

  int consultasAgendadasId;
  int statusConsultaId;
  int especialidadeId;
  int pacienteId;
  int medicoId;
  DateTime dataSolicitacaoConsulta;
  DateTime dataConsulta;
  String motivoConsulta;
  String encaminhamento;
  String? consultaCancelada;

  DtoInfoBasicQueries.fromJson(Map<String, dynamic> json)
      : consultasAgendadasId = json['consultasAgendadasId'],
        statusConsultaId = json['statusConsultaId'],
        especialidadeId = json['especialidadeId'],
        pacienteId = json['pacienteId'],
        medicoId = json['medicoId'],
        dataSolicitacaoConsulta =
            DateTime.parse(json['dataSolicitacaoConsulta']),
        dataConsulta = DateTime.parse(json['dataConsulta']),
        motivoConsulta = json['motivoConsulta'],
        encaminhamento = json['encaminhamento'],
        consultaCancelada = json['consultaCancelada'];

  Map<String, dynamic> toJson() => {
        "consultasAgendadasId": consultasAgendadasId,
        "statusConsultaId": statusConsultaId,
        "especialidadeId": especialidadeId,
        "pacienteId": pacienteId,
        "medicoId": medicoId,
        "dataSolicitacaoConsulta": dataSolicitacaoConsulta,
        "dataConsulta": dataConsulta,
        "motivoConsulta": motivoConsulta,
        "encaminhamento": encaminhamento,
        "consultaCancelada": consultaCancelada
      };
}
