class GenerateSchedules {
  int prescricaoPacienteId;
  int prescricaoMedicamentoId;
  int medicamentoId;

  GenerateSchedules({
    required this.prescricaoPacienteId,
    required this.prescricaoMedicamentoId,
    required this.medicamentoId,
  });

  factory GenerateSchedules.fromJson(Map<String, dynamic> json) {
    return GenerateSchedules(
      prescricaoPacienteId: json['prescricaoPacienteId'],
      prescricaoMedicamentoId: json['prescricaoMedicamentoId'],
      medicamentoId: json['medicamentoId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['prescricaoPacienteId'] = this.prescricaoPacienteId;
    data['prescricaoMedicamentoId'] = this.prescricaoMedicamentoId;
    data['medicamentoId'] = this.medicamentoId;
    return data;
  }
}
