class DtoQuery {
  DtoQuery(
      {required this.dataConsulta,
      required this.dataSolicitacaoConsulta,
      required this.encaminhamento,
      required this.especialidadeId,
      required this.medicoId,
      required this.motivoConsulta,
      required this.pacienteId,
      required this.statusConsultaId});

  int statusConsultaId;
  int especialidadeId;
  int pacienteId;
  int medicoId;
  String dataSolicitacaoConsulta;
  String dataConsulta;
  String motivoConsulta;
  String encaminhamento;

  DtoQuery.fromJson(Map<String, dynamic> json)
      : statusConsultaId =          int.parse(json['statusConsultaId']),
        especialidadeId =           int.parse(json['especialidadeId']),
        pacienteId =                int.parse(json['pacienteId']),
        medicoId =                  int.parse(json['medicoId']),
        dataSolicitacaoConsulta =   json['dataSolicitacaoConsulta'],
        dataConsulta =              json['dataConsulta'],
        motivoConsulta =            json['motivoConsulta'],
        encaminhamento =            json['encaminhamento'];

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
