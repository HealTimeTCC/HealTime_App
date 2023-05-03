class EncerrarQuery {
  EncerrarQuery(
      {required this.consultaId,
      required this.motivoAlteracao,
      required this.pacienteId,
      required this.statusConsultaId});

  int consultaId;
  int pacienteId;
  String motivoAlteracao;
  int statusConsultaId;

  factory EncerrarQuery.fromJson(Map<String, dynamic> json) => EncerrarQuery(
        consultaId: json['consultaId'],
        motivoAlteracao: json['motivoAlteracao'],
        pacienteId: json['pacienteId'],
        statusConsultaId: json['StatusConsultaId'],
      );

  Map<String, dynamic> toJson() => {
        'consultaId': consultaId,
        'motivoAlteracao': motivoAlteracao,
        'pacienteId': pacienteId,
        'statusConsultaId': statusConsultaId
      };
}
