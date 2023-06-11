class MedicationType {
  num tipoMedicacaoId;
  String descMedicacao;
  String tituloTipoMedicacao;
  String classeAplicacao;

  MedicationType({
    required this.tipoMedicacaoId,
    required this.descMedicacao,
    required this.tituloTipoMedicacao,
    required this.classeAplicacao,
  });

  static String _typeApplicationMedicine(num classApplication) => classApplication == 1 ? "Enteral" : "Parenteral";

  factory MedicationType.fromJson(Map<String, dynamic> json) {
    return MedicationType(
      tipoMedicacaoId: json['tipoMedicacaoId'] as num,
      descMedicacao: json['descMedicacao'] as String,
      tituloTipoMedicacao: json['tituloTipoMedicacao'] as String,
      classeAplicacao: _typeApplicationMedicine(json['classeAplicacao'] as num),
      //classeAplicacao: json['classeAplicacao'] as num == 1 ? "Enteral" : "Parenteral",
    );
  }
}
// Enteral =1,
// Parenteral = 2,