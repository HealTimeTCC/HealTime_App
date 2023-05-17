class DtoPostAssociateResponsible {
  DtoPostAssociateResponsible({
    required this.createdIn,
    required this.degreeOfKinshipId,
    required this.patientCPF,
    required this.patientId,
    required this.responsible,
    required this.responsibleCPF,
  });

  int patientId;
  int responsible;
  String responsibleCPF;
  String patientCPF;
  int degreeOfKinshipId;
  DateTime createdIn;

  factory DtoPostAssociateResponsible.fromJson(Map<String, dynamic> json) =>
      DtoPostAssociateResponsible(
        createdIn:            json['criadoEm'],
        degreeOfKinshipId:    json['grauParentescoId'],
        patientCPF:           json['pacienteCpf'],
        patientId:            json['pacienteId'],
        responsible:          json['responsavelId'],
        responsibleCPF:       json['responsavelCpf'],
      );

  Map<String, dynamic> toJson() => {
    'criadoEm':           createdIn.toIso8601String(),
    'grauParentescoId':   degreeOfKinshipId,
    'pacienteCpf':        patientCPF,
    'pacienteId':         patientId,
    'responsavelId':      responsible,
    'responsavelCpf':     responsibleCPF,
  };

}
