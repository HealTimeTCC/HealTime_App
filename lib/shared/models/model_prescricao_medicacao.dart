import 'package:healtime/shared/models/model_medicacao.dart';
import 'package:healtime/shared/models/model_medicine_prescription.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_serializable/model_prescricao_medicacao.g.dart';

@JsonSerializable()
class PrescricaoMedicacao {
  PrescricaoMedicacao({
    required this.duracao,
    required this.intervalo,
    required this.medicacao,
    required this.prescricaoPaciente,
    required this.qtde});

  PrescricaoPaciente? prescricaoPaciente;
  ModelMedicacao medicacao;
  int qtde;
  int intervalo;
  int duracao;

  factory PrescricaoMedicacao.fromJson(Map<String, dynamic> json) => _$PrescricaoMedicacaoFromJson(json);
  Map<String, dynamic> toJson() => _$PrescricaoMedicacaoToJson(this);
}