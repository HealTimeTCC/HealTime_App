import 'package:healtime/shared/dto/prescription_medical_dto/prescription_medicaments_dto.dart';

class PrescriptionMedicalDto {
  int medicoId;
  int pacienteId;
  DateTime? criadoEm;
  DateTime emissao;
  DateTime validade;
  String descFichaPessoa;
  List<PrescriptionMedicaments> prescricoesMedicacoesDto;

  PrescriptionMedicalDto({
    required this.medicoId,
    required this.pacienteId,
    this.criadoEm,
    required this.emissao,
    required this.validade,
    required this.descFichaPessoa,
    required this.prescricoesMedicacoesDto,
  });
  Map<String, dynamic> toJson() {
    return {
      'medicoId': medicoId,
      'pacienteId': pacienteId,
      'criadoEm': criadoEm?.toIso8601String(), // Convert DateTime to string
      'emissao': emissao.toIso8601String(),
      'validade': validade.toIso8601String(),
      'descFichaPessoa': descFichaPessoa,
      'prescricoesMedicacoesDto': prescricoesMedicacoesDto.map((item) => item.toJson()).toList(),
    };
  }
}