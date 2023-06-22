class EncerrarCuidadorPaciente {
  EncerrarCuidadorPaciente(
      {required this.cuidadorId, required this.pacienteId});

  int cuidadorId;
  int pacienteId;

  factory EncerrarCuidadorPaciente.fromJson(Map<String, dynamic> json) =>
      EncerrarCuidadorPaciente(
          cuidadorId: json['cuidadorId'], pacienteId: json['pacienteId']);

  Map<String, dynamic> toJson() => {
        'cuidadorId': cuidadorId,
        'pacienteId': pacienteId
      };
}
