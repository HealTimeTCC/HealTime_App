// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model_medicacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelMedicacao _$ModelMedicacaoFromJson(Map<String, dynamic> json) =>
    ModelMedicacao(
      compostoAtivoMedicacao: json['compostoAtivoMedicacao'] as String,
      generico: json['generico'] as String,
      laboratorioMedicacao: json['laboratorioMedicacao'] as String,
      medicacaoId: json['medicacaoId'] as int,
      nomeMedicacao: json['nomeMedicacao'] as String,
      statusMedicacaoId:
          $enumDecode(_$StatusMedicacaoEnumMap, json['statusMedicacaoId']),
      tipoMedicacaoId: json['tipoMedicacaoId'] as int,
    );

Map<String, dynamic> _$ModelMedicacaoToJson(ModelMedicacao instance) =>
    <String, dynamic>{
      'medicacaoId': instance.medicacaoId,
      'statusMedicacaoId':
          _$StatusMedicacaoEnumMap[instance.statusMedicacaoId]!,
      'tipoMedicacaoId': instance.tipoMedicacaoId,
      'nomeMedicacao': instance.nomeMedicacao,
      'compostoAtivoMedicacao': instance.compostoAtivoMedicacao,
      'laboratorioMedicacao': instance.laboratorioMedicacao,
      'generico': instance.generico,
    };

const _$StatusMedicacaoEnumMap = {
  StatusMedicacao.inativo: 'inativo',
  StatusMedicacao.ativo: 'ativo',
};
