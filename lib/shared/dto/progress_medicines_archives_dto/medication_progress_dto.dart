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
      andamentoMedicacaoId: json['andamentoMedicacaoId'] as num,
      mtAndamentoMedicacao: DateTime.parse(json['mtAndamentoMedicacao']),
      prescricaoPacienteId: json['prescricaoPacienteId'] as num,
      medicacaoId: json['medicacaoId'] as num,
      qtdeMedicao: json['qtdeMedicao'] as num,
      criadoEm: DateTime.parse(json['criadoEm']),
      baixaAndamentoMedicacao: json['baixaAndamentoMedicacao'] as bool,
      mtBaixaMedicacao: json['mtBaixaMedicacao'] == null ? null : DateTime.parse(json['mtBaixaMedicacao']) ,
      codAplicadorMedicacao: json['codAplicadorMedicacao'] as num?,

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
