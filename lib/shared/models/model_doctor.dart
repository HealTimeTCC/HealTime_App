import 'package:json_annotation/json_annotation.dart';

part 'json_serializable/model_doctor.g.dart';

@JsonSerializable()
class Medico {
  Medico(
      {required this.CrmMedico,
      this.MedicoId,
      required this.NmMedico,
      required this.UfCrmMedico});

  int? MedicoId;
  String NmMedico;
  String CrmMedico;
  String UfCrmMedico;

  factory Medico.fromJson(Map<String, dynamic> json) => _$MedicoFromJson(json);
  Map<String, dynamic> toJson() => _$MedicoToJson(this);
}
