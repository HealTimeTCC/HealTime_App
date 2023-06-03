class PrescriptionPatient {
  int prescricaoPacienteId;
  int medicoId;
  int pacienteId;
  DateTime criadoEm;
  DateTime emissao;
  DateTime validade;
  String descFichaPessoa;
  bool flagStatusAtivo;

  PrescriptionPatient({
    required this.prescricaoPacienteId,
    required this.medicoId,
    required this.pacienteId,
    required this.criadoEm,
    required this.emissao,
    required this.validade,
    required this.descFichaPessoa,
    required this.flagStatusAtivo,

  });

  factory PrescriptionPatient.fromJson(Map<String, dynamic> json) {
    return PrescriptionPatient(
      prescricaoPacienteId: json['prescricaoPacienteId'] as int,
      medicoId: json['medicoId'] as int,
      pacienteId: json['pacienteId'] as int,
      criadoEm: DateTime.parse(json['criadoEm']),
      emissao: DateTime.parse(json['emissao']),
      validade: DateTime.parse(json['validade']),
      descFichaPessoa: json['descFichaPessoa'] as String,
      flagStatusAtivo: json['flagStatusAtivo'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prescricaoPacienteId'] = this.prescricaoPacienteId;
    data['medicoId'] = this.medicoId;
    data['pacienteId'] = this.pacienteId;
    data['criadoEm'] = this.criadoEm.toIso8601String();
    data['emissao'] = this.emissao.toIso8601String();
    data['validade'] = this.validade.toIso8601String();
    data['descFichaPessoa'] = this.descFichaPessoa;
    data['flagStatusAtivo'] = this.flagStatusAtivo;
    return data;
  }
}
