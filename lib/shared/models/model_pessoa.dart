import 'package:json_annotation/json_annotation.dart';

import 'model_contact_pessoa.dart';

part 'json_serializable/model_pessoa.g.dart';

@JsonSerializable()
class Pessoa {
  Pessoa(
      {required this.cpfPessoa,
      required this.nomePessoa,
      required this.sobreNomePessoa,
      required this.dtNascPessoa,
      required this.tipoPessoa,
      required this.passwordString, this.contact});

  int pessoaId = 0;
  int tipoPessoa = 1;
  String cpfPessoa = '';
  String nomePessoa = '';
  String sobreNomePessoa = '';
  DateTime dtNascPessoa = DateTime.now();
  String passwordString = '';
  String tokenUser = '';
  ContactPessoa? contact;

  factory Pessoa.fromJson(Map<String, dynamic> json) => _$PessoaFromJson(json);
  Map<String, dynamic> toJson() => _$PessoaToJson(this);
}
