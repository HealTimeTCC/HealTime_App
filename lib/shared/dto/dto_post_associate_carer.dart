class DtoPostAssociateCarer {
  DtoPostAssociateCarer({
    required this.patientId,
    required this.patientCPF,
    required this.createdIn,
    required this.carerCPF,
    required this.carerId,
  });

  int patientId;
  int carerId;
  String carerCPF;
  String patientCPF;
  DateTime createdIn;

  Map<String, dynamic> toJson() => {
    'criadoEm':           createdIn.toIso8601String(),
    'pacienteCpf':        patientCPF,
    'pacienteId':         patientId,
    'cuidadorId':      carerId,
    'cuidadorCpf':     carerCPF,
  };

}
