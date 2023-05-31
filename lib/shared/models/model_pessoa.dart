import 'package:json_annotation/json_annotation.dart';

import 'model_contact_pessoa.dart';

part 'json_serializable/model_pessoa.g.dart';

@JsonSerializable()
class Pessoa {
  Pessoa({
    required this.cpfPessoa,
    required this.nomePessoa,
    required this.sobreNomePessoa,
    required this.dtNascPessoa,
    required this.tipoPessoa,
    required this.passwordString,
    this.contact,
    this.imagePerson,
  });

  int? pessoaId;
  int tipoPessoa;
  String cpfPessoa;
  String nomePessoa;
  String sobreNomePessoa;
  DateTime dtNascPessoa;
  String passwordString;
  String tokenUser = '';
  ContactPessoa? contact;
  String? imagePerson;

  factory Pessoa.fromJson(Map<String, dynamic> json) => _$PessoaFromJson(json);

  Map<String, dynamic> toJson() => _$PessoaToJson(this);
}
