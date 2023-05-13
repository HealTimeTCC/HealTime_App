// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model_doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medico _$MedicoFromJson(Map<String, dynamic> json) => Medico(
      CrmMedico: json['CrmMedico'],
      MedicoId: json['medicoId'] as int,
      NmMedico: json['nmMedico'] as String,
      UfCrmMedico: json['ufCrmMedico'] as String,
    );

Map<String, dynamic> _$MedicoToJson(Medico instance) => <String, dynamic>{
      'medicoId': instance.MedicoId,
      'nmMedico': instance.NmMedico,
      'CrmMedico': instance.CrmMedico,
      'CodigoIgbeUfCrmMedico': instance.UfCrmMedico,
    };
