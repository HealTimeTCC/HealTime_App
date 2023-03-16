// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model_medicine_prescription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescricaoPaciente _$PrescricaoPacienteFromJson(Map<String, dynamic> json) =>
    PrescricaoPaciente(
      CriadoEm: json['CriadoEm'] == null
          ? null
          : DateTime.parse(json['CriadoEm'] as String),
      DescFichaPessoa: json['DescFichaPessoa'] as String?,
      Emissao: json['Emissao'] == null
          ? null
          : DateTime.parse(json['Emissao'] as String),

      /* Pegar os dados do médico e serializar */
      MedicoId: json['MedicoId'] == null
          ? null
          : Medico.fromJson(json['MedicoId'] as Map<String, dynamic>),

      /* Pegar os dados do paciente e serializar */
      Paciente: json['Paciente'] == null
          ? null
          : Pessoa.fromJson(json['Paciente'] as Map<String, dynamic>),

      PrescricaoPacienteId: json['PrescricaoPacienteId'] as int?,
      Validade: json['Validade'] == null
          ? null
          : DateTime.parse(json['Validade'] as String),
    );

Map<String, dynamic> _$PrescricaoPacienteToJson(PrescricaoPaciente instance) =>
    <String, dynamic>{
      'PrescricaoPacienteId': instance.PrescricaoPacienteId,
      'MedicoId': instance.MedicoId,
      'Paciente': instance.Paciente,
      'CriadoEm': instance.CriadoEm?.toIso8601String(),
      'Emissao': instance.Emissao?.toIso8601String(),
      'Validade': instance.Validade?.toIso8601String(),
      'DescFichaPessoa': instance.DescFichaPessoa,
    };
