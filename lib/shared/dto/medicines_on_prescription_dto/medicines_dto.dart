import 'package:healtime/shared/dto/medicines_on_prescription_dto/type_medicines.dart';

class Medicine {
  int medicacaoId;
  int statusMedicacao;
  int tipoMedicacaoId;
  String nomeMedicacao;
  String compostoAtivoMedicacao;
  String laboratorioMedicacao;
  String generico;
  int codPessoaAlter;
  MedicationType medicationType;

  Medicine({
    required this.medicacaoId,
    required this.statusMedicacao,
    required this.tipoMedicacaoId,
    required this.nomeMedicacao,
    required this.compostoAtivoMedicacao,
    required this.laboratorioMedicacao,
    required this.generico,
    required this.codPessoaAlter,
    required this.medicationType
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      medicacaoId: json['medicacaoId'],
      statusMedicacao: json['statusMedicacao'],
      tipoMedicacaoId: json['tipoMedicacaoId'],
      nomeMedicacao: json['nomeMedicacao'],
      compostoAtivoMedicacao: json['compostoAtivoMedicacao'],
      laboratorioMedicacao: json['laboratorioMedicacao'],
      generico: json['generico'],
      codPessoaAlter: json['codPessoaAlter'], 
      medicationType: MedicationType.fromJson(json['tipoMedicacao']),
      
    );
  }
}