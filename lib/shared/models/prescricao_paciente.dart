class PrescricaoPaciente {
  PrescricaoPaciente(
      {required this.CriadoEm,
      required this.DescFichaPessoa,
      required this.Emissao,
      required this.MedicoId,
      required this.PacienteId,
      required this.PrescricaoPacienteId,
      required this.Validade}){}

  int PrescricaoPacienteId = 0;
  int MedicoId = 0;
  int PacienteId = 0;
  DateTime CriadoEm = DateTime.now();
  DateTime Emissao = DateTime.now();
  DateTime Validade = DateTime.now();
  String DescFichaPessoa = '';

  PrescricaoPaciente.fromJson(Map<String, dynamic> json) {
    PrescricaoPacienteId  =   json['PrescricaoPacienteId'];
    MedicoId  =               json['MedicoId'];
    PacienteId  =             json['PacienteId'];
    CriadoEm  =               json['CriadoEm'];
    Emissao  =                json['Emissao'];
    Validade  =               json['Validade'];
    DescFichaPessoa  =        json['DescFichaPessoa'];
  }

  Map<String, dynamic> toJson() {
    return {
      'PrescricaoPacienteId': PrescricaoPacienteId,
      'MedicoId':             MedicoId,
      'PacienteId':           PacienteId,
      'CriadoEm':             CriadoEm,
      'Emissao':              Emissao,
      'Validade':             Validade,
      'DescFichaPessoa':      DescFichaPessoa,
    };
  }
}
