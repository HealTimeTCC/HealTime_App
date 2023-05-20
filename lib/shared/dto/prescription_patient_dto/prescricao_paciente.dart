class PrescricaoPaciente {
  int pacienteId;
  int medicoId;
  DateTime criadoEm;
  DateTime emissao;
  DateTime validade;
  String descFichaPessoa;
  String flagStatus; // A: ATIVO | I: INATIVO

  PrescricaoPaciente({
    required this.pacienteId,
    required this.medicoId,
    required this.criadoEm,
    required this.emissao,
    required this.validade,
    required this.descFichaPessoa,
    required this.flagStatus,
  });
}