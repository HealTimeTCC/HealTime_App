// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medico _$MedicoFromJson(Map<String, dynamic> json) => Medico(
      CrmMedico: json['CrmMedico'] as int,
      MedicoId: json['MedicoId'] as int,
      NmMedico: json['NmMedico'] as String,
      UfCrmMedico: json['UfCrmMedico'] as String,
    );

Map<String, dynamic> _$MedicoToJson(Medico instance) => <String, dynamic>{
      'MedicoId': instance.MedicoId,
      'NmMedico': instance.NmMedico,
      'CrmMedico': instance.CrmMedico,
      'UfCrmMedico': instance.UfCrmMedico,
    };
