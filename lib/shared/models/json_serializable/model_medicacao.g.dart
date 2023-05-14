// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model_medicacao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelMedicacao _$ModelMedicacaoFromJson(Map<String, dynamic> json) =>
    ModelMedicacao(
        compostoAtivoMedicacao: json['compostoAtivoMedicacao'] as String,
        generico: json['generico'] as String,
        laboratorioMedicacao: json['laboratorioMedicaocao'] as String,
        medicacaoId: json['medicacaoId'] as int,
        nomeMedicacao: json['nomeMedicacao'] as String,
        statusMedicacaoId: $enumDecode(
          _$StatusMedicacaoEnumMap,
          (json['statusMedicacao'] == 1 ? 'ativo' : 'inativo'),
        ),
        tipoMedicacaoId: json['tipoMedicacaoId'] as int,
        codPessoaAlter: json['codPessoaAlter']);

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
      'codPessoaAlter': instance.codPessoaAlter
    };

const _$StatusMedicacaoEnumMap = {
  StatusMedicacao.inativo: 'inativo',
  StatusMedicacao.ativo: 'ativo',
};
