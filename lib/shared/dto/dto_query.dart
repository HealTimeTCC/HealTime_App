class DtoQuery {
  DtoQuery({required this.dataConsulta,
    required this.dataSolicitacaoConsulta,
    required this.encaminhamento,
    required this.especialidadeId,
    required this.medicoId,
    this.motivoConsulta,
    required this.pacienteId,
    required this.statusConsultaId});

  int statusConsultaId = 0;
  int especialidadeId = 0;
  int pacienteId = 0;
  int medicoId = 0;
  DateTime dataSolicitacaoConsulta = DateTime.now();
  DateTime dataConsulta = DateTime.now();
  String? motivoConsulta;
  String encaminhamento = "N";

  DtoQuery.fromJson(Map<String, dynamic> json)
      : statusConsultaId =          int.parse(json['statusConsultaId']),
        especialidadeId =           int.parse(json['especialidadeId']),
        pacienteId =                int.parse(json['pacienteId']),
        medicoId =                  int.parse(json['medicoId']),
        dataSolicitacaoConsulta =   DateTime.parse(json['dataSolicitacaoConsulta']),
        dataConsulta =              DateTime.parse(json['dataConsulta']),
        motivoConsulta =            json['motivoConsulta'],
        encaminhamento =            json['encaminhamento'];

  Map<String, dynamic> toJson() {
    return {
      'statusConsultaId':         statusConsultaId,
      'especialidadeId':          especialidadeId,
      'pacienteId':               pacienteId,
      'medicoId':                 medicoId,
      'dataSolicitacaoConsulta':  dataSolicitacaoConsulta,
      'dataConsulta':             dataConsulta,
      'motivoConsulta':           motivoConsulta,
      'encaminhamento':           encaminhamento,
    };
  }

}
