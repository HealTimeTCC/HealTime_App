// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model_pessoa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pessoa _$PessoaFromJson(Map<String, dynamic> json) => Pessoa(
      cpfPessoa: json['cpfPessoa'] as String,
      nomePessoa: json['nomePessoa'] as String,
      sobreNomePessoa: json['sobreNomePessoa'] as String,
      dtNascPessoa: DateTime.parse(json['dtNascPessoa'] as String),
      tipoPessoa: json['tipoPessoa'] as int,
      passwordString: json['passwordString'] == null ? '' : json['passwordString'] as String,
    )
      ..pessoaId = json['pessoaId'] as int
      ..tokenUser = json['tokenUser'] == null ? '' : json['tokenUser'] as String;

Map<String, dynamic> _$PessoaToJson(Pessoa instance) => <String, dynamic>{
      'pessoaId': instance.pessoaId,
      'tipoPessoa': instance.tipoPessoa,
      'cpfPessoa': instance.cpfPessoa,
      'nomePessoa': instance.nomePessoa,
      'sobreNomePessoa': instance.sobreNomePessoa,
      'dtNascPessoa': instance.dtNascPessoa.toIso8601String(),
      'passwordString': instance.passwordString,
      'tokenUser': instance.tokenUser,
    };
