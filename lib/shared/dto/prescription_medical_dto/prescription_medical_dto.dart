import 'package:healtime/shared/dto/prescription_medical_dto/prescription_medicaments_dto.dart';

class PrescriptionMedicalDto {
  int medicoId;
  int pacienteId;
  String criadoEm;
  String emissao;
  String validade;
  String descFichaPessoa;
  List<PrescriptionMedicaments> prescricoesMedicacoesDto;

  PrescriptionMedicalDto({
    required this.medicoId,
    required this.pacienteId,
    required this.criadoEm,
    required this.emissao,
    required this.validade,
    required this.descFichaPessoa,
    required this.prescricoesMedicacoesDto,
  });
}