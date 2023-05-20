class PrescriptionMedicaments {
  int medicacaoId;
  int qtde;
  String intervalo;
  int duracao;
  bool statusMedicacaoFlag;
  bool horariosDefinidos;

  PrescriptionMedicaments({
    required this.medicacaoId,
    required this.qtde,
    required this.intervalo,
    required this.duracao,
    required this.statusMedicacaoFlag,
    required this.horariosDefinidos,
  });
}