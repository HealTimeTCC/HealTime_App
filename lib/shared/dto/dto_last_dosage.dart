class LastDosageDto {
  LastDosageDto({
    required this.codAplicador,
    this.dateTimelastDosage,
    this.nomePaciente,
    this.pacienteId,
  });

  int codAplicador;
  String? nomePaciente;
  int? pacienteId;
  DateTime? dateTimelastDosage;

  factory LastDosageDto.fromJson(Map<String, dynamic> json) {
    return LastDosageDto(
      codAplicador: json['codAplicador'] as int,
      dateTimelastDosage: json['ultimaDosage'] == null
          ? null
          : DateTime.parse(json['ultimaDosage']),
      nomePaciente: json['nomePaciente'] ?? '',
      pacienteId: json['pacienteId'],
    );
  }
}
