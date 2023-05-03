import 'model_doctor.dart';

class ConsultasAgendadas {
  int consultasAgendadasId;
  int statusConsultaId;
  int especialidadeId;
  int pacienteId;
  int medicoId;
  DateTime dataSolicitacaoConsulta;
  DateTime dataConsulta;
  String motivoConsulta;
  String encaminhamento;

  ConsultasAgendadas(
      { required this.consultasAgendadasId,
        required this.statusConsultaId,
        required this.especialidadeId,
        required this.pacienteId,
        required this.medicoId,
        required this.dataSolicitacaoConsulta,
        required this.dataConsulta,
        required this.motivoConsulta,
        required this.encaminhamento});

  factory ConsultasAgendadas.fromJson(Map<String, dynamic> json) {
    return ConsultasAgendadas(
      consultasAgendadasId: json['ConsultasAgendadasId'] as int,
      statusConsultaId: json['StatusConsultaId'] as int,
      especialidadeId: json['EspecialidadeId'] as int,
      pacienteId: json['PacienteId'] as int,
      medicoId: json['MedicoId'] as int,
      dataSolicitacaoConsulta:
      DateTime.parse(json['DataSolicitacaoConsulta']),
      dataConsulta: DateTime.parse(json['DataConsulta']),
      motivoConsulta: json['MotivoConsulta'] as String,
      encaminhamento: json['Encaminhamento'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'ConsultasAgendadasId': consultasAgendadasId,
    'StatusConsultaId': statusConsultaId,
    'EspecialidadeId': especialidadeId,
    'PacienteId': pacienteId,
    'MedicoId': medicoId,
    'DataSolicitacaoConsulta': dataSolicitacaoConsulta.toIso8601String(),
    'DataConsulta': dataConsulta.toIso8601String(),
    'MotivoConsulta': motivoConsulta,
    'Encaminhamento': encaminhamento,
  };
}
