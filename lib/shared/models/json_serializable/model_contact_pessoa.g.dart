// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model_contact_pessoa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactPessoa _$ContactPessoaFromJson(Map<String, dynamic> json) =>
    ContactPessoa(
      atualizadoEm: json['atualizadoEm'] == null
          ? null
          : DateTime.parse(json['atualizadoEm'] as String),
      celular: json['celular'] ?? '',
      celularSecundario: json['celularSecundario'] ?? '',
      criadoEm: DateTime.parse(json['criadoEm'] as String),
      email: json['email'] ?? '',
      telefone: json['telefone'] ?? '',
      telefoneSecundario: json['telefoneSecundario'] ?? '',
    );

Map<String, dynamic> _$ContactPessoaToJson(ContactPessoa instance) =>
    <String, dynamic>{
      'email': instance.email,
      'criadoEm': instance.criadoEm.toIso8601String(),
      'atualizadoEm': instance.atualizadoEm?.toIso8601String(),
      'telefone': instance.telefone,
      'telefoneSecundario': instance.telefoneSecundario,
      'celular': instance.celular,
      'celularSecundario': instance.celularSecundario,
    };
