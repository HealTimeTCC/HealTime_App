import 'medicines_dto.dart';

class PrescriptionMedicine {
  int prescricaoMedicacaoId;
  int prescricaoPacienteId;
  int medicacaoId;
  Medicine medicacao;
  int qtde;
  String intervalo;
  int duracao;
  bool statusMedicacaoFlag;
  bool horariosDefinidos;

  PrescriptionMedicine({
    required this.prescricaoMedicacaoId,
    required this.prescricaoPacienteId,
    required this.medicacaoId,
    required this.medicacao,
    required this.qtde,
    required this.intervalo,
    required this.duracao,
    required this.statusMedicacaoFlag,
    required this.horariosDefinidos,
  });

  factory PrescriptionMedicine.fromJson(Map<String, dynamic> json) {
    return PrescriptionMedicine(
      prescricaoMedicacaoId: json['prescricaoMedicacaoId'],
      prescricaoPacienteId: json['prescricaoPacienteId'],
      medicacaoId: json['medicacaoId'],
      medicacao: Medicine.fromJson(json['medicacao']),
      qtde: json['qtde'],
      intervalo: json['intervalo'],
      duracao: json['duracao'],
      statusMedicacaoFlag: json['statusMedicacaoFlag'],
      horariosDefinidos: json['horariosDefinidos'],
    );
  }
}