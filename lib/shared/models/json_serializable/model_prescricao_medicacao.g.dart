// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model_prescricao_medicacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescricaoMedicacao _$PrescricaoMedicacaoFromJson(Map<String, dynamic> json) =>
    PrescricaoMedicacao(
      duracao: json['duracao'] as int,
      intervalo: json['intervalo'] as int,
      medicacao: (json['medicacao'] as List<dynamic>?)
          ?.map((e) => ModelMedicacao.fromJson(e as Map<String, dynamic>))
          .toList(),
      prescricaoPaciente: json['prescricaoPaciente'] == null
          ? null
          : PrescricaoPaciente.fromJson(
              json['prescricaoPaciente'] as Map<String, dynamic>),
      qtde: json['qtde'] as int,
    );

Map<String, dynamic> _$PrescricaoMedicacaoToJson(
        PrescricaoMedicacao instance) =>
    <String, dynamic>{
      'prescricaoPaciente': instance.prescricaoPaciente,
      'medicacao': instance.medicacao,
      'qtde': instance.qtde,
      'intervalo': instance.intervalo,
      'duracao': instance.duracao,
    };
