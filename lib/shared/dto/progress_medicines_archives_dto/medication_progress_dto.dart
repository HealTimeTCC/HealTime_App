class MedicationProgressDto {
  num andamentoMedicacaoId;
  DateTime mtAndamentoMedicacao;
  num prescricaoPacienteId;
  num medicacaoId;
  num qtdeMedicao;
  DateTime criadoEm;
  bool baixaAndamentoMedicacao;
  DateTime? mtBaixaMedicacao;
  num? codAplicadorMedicacao;

  MedicationProgressDto({
    required this.andamentoMedicacaoId,
    required this.mtAndamentoMedicacao,
    required this.prescricaoPacienteId,
    required this.medicacaoId,
    required this.qtdeMedicao,
    required this.criadoEm,
    required this.baixaAndamentoMedicacao,
    this.mtBaixaMedicacao,
    this.codAplicadorMedicacao,
  });

  factory MedicationProgressDto.fromJson(Map<String, dynamic> json) {
    return MedicationProgressDto(
      andamentoMedicacaoId: json['andamentoMedicacaoId'],
      mtAndamentoMedicacao: DateTime.parse(json['mtAndamentoMedicacao']),
      prescricaoPacienteId: json['prescricaoPacienteId'],
      medicacaoId: json['medicacaoId'],
      qtdeMedicao: json['qtdeMedicao'],
      criadoEm: DateTime.parse(json['criadoEm']),
      baixaAndamentoMedicacao: json['baixaAndamentoMedicacao'],
      mtBaixaMedicacao: json['mtBaixaMedicacao'] != null ? DateTime.parse(json['mtBaixaMedicacao']) : null,
      codAplicadorMedicacao: json['codAplicadorMedicacao'] != null ? num.parse(json['codAplicadorMedicacao']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['andamentoMedicacaoId'] = this.andamentoMedicacaoId;
    data['mtAndamentoMedicacao'] = this.mtAndamentoMedicacao.toIso8601String();
    data['prescricaoPacienteId'] = this.prescricaoPacienteId;
    data['medicacaoId'] = this.medicacaoId;
    data['qtdeMedicao'] = this.qtdeMedicao;
    data['criadoEm'] = this.criadoEm.toIso8601String();
    data['baixaAndamentoMedicacao'] = this.baixaAndamentoMedicacao;
    data['mtBaixaMedicacao'] = this.mtBaixaMedicacao;
    data['codAplicadorMedicacao'] = this.codAplicadorMedicacao;
    return data;
  }
}
