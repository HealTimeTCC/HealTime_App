class   DtoQuery {
  DtoQuery(
      {required this.dataConsulta,
      required this.dataSolicitacaoConsulta,
      required this.encaminhamento,
      required this.especialidadeId,
      required this.medicoId,
      required this.motivoConsulta,
      required this.pacienteId,
      required this.statusConsultaId});

  int? consultasAgendadasId;
  int statusConsultaId;
  int especialidadeId;
  int pacienteId;
  int medicoId;
  String dataSolicitacaoConsulta;
  String dataConsulta;
  String motivoConsulta;
  String encaminhamento;

  DtoQuery.fromJson(Map<String, dynamic> json)
      : statusConsultaId =          json['statusConsultaId'],
        especialidadeId =           json['especialidadeId'],
        pacienteId =                json['pacienteId'],
        medicoId =                  json['medicoId'],
        dataSolicitacaoConsulta =   json['dataSolicitacaoConsulta'] as String,
        dataConsulta =              json['dataConsulta'] as String,
        motivoConsulta =            json['motivoConsulta'] as String,
        consultasAgendadasId =      json['consultasAgendadasId'],
        encaminhamento =            json['encaminhamento'] as String;

  Map<String, dynamic> toJson() => {
        'statusConsultaId': statusConsultaId,
        'especialidadeId': especialidadeId,
        'pacienteId': pacienteId,
        'medicoId': medicoId,
        'dataSolicitacaoConsulta': dataSolicitacaoConsulta,
        'dataConsulta': dataConsulta,
        'motivoConsulta': motivoConsulta,
        'encaminhamento': encaminhamento,
      };
}
