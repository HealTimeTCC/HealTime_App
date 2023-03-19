import 'dart:convert';

import 'package:healtime/shared/models/model_doctor.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:json_annotation/json_annotation.dart';

import 'model_prescricao_medicacao.dart';

part 'model_medicine_prescription.g.dart';

@JsonSerializable()
class PrescricaoPaciente {
  PrescricaoPaciente(
      {required this.CriadoEm,
      required this.DescFichaPessoa,
      required this.Emissao,
      required this.MedicoId,
      required this.Paciente,
      required this.PrescricaoPacienteId,
      required this.Validade});

  int? PrescricaoPacienteId;
  Medico? MedicoId;
  int? Paciente;
  DateTime? CriadoEm;
  DateTime? Emissao;
  DateTime? Validade;
  String? DescFichaPessoa;
  List<PrescricaoMedicacao>? prescricaoMedicacao;

  factory PrescricaoPaciente.fromJson(Map<String, dynamic> json) => _$PrescricaoPacienteFromJson(json);
  Map<String, dynamic> toJson() => _$PrescricaoPacienteToJson(this);
}
