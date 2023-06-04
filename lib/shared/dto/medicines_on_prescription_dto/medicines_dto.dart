class Medicine {
  int medicacaoId;
  int statusMedicacao;
  int tipoMedicacaoId;
  String nomeMedicacao;
  String compostoAtivoMedicacao;
  String laboratorioMedicaocao;
  String generico;
  int codPessoaAlter;

  Medicine({
    required this.medicacaoId,
    required this.statusMedicacao,
    required this.tipoMedicacaoId,
    required this.nomeMedicacao,
    required this.compostoAtivoMedicacao,
    required this.laboratorioMedicaocao,
    required this.generico,
    required this.codPessoaAlter,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      medicacaoId: json['medicacaoId'],
      statusMedicacao: json['statusMedicacao'],
      tipoMedicacaoId: json['tipoMedicacaoId'],
      nomeMedicacao: json['nomeMedicacao'],
      compostoAtivoMedicacao: json['compostoAtivoMedicacao'],
      laboratorioMedicaocao: json['laboratorioMedicaocao'],
      generico: json['generico'],
      codPessoaAlter: json['codPessoaAlter'],
    );
  }
}