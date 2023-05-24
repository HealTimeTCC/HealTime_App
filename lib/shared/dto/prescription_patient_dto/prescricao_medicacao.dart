class PrescricaoMedicacao {
  int medicacaoId;
  int qtde;
  String intervalo;
  int duracao;
  String statusMedicacaoFlag;

  PrescricaoMedicacao({
    required this.medicacaoId,
    required this.qtde,
    required this.intervalo,
    required this.duracao,
    required this.statusMedicacaoFlag,
  });
}