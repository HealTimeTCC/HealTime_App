class LowMedicationProgress {
  num codAplicador;
  num codAndamentoMedicacao;

  LowMedicationProgress({
    required this.codAplicador,
    required this.codAndamentoMedicacao,
  });

  factory LowMedicationProgress.fromJson(Map<String, dynamic> json) {
    return LowMedicationProgress(
      codAplicador: json['codAplicador'],
      codAndamentoMedicacao: json['codAndamentoMedicacao'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codAplicador'] = this.codAplicador;
    data['codAndamentoMedicacao'] = this.codAndamentoMedicacao;
    return data;
  }
}
