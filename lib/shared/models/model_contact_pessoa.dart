
import 'package:json_annotation/json_annotation.dart';

part 'json_serializable/model_contact_pessoa.g.dart';

@JsonSerializable()
class ContactPessoa {
  ContactPessoa(
      {required this.atualizadoEm,
      required this.celular,
      required this.celularSecundario,
      required this.criadoEm,
      required this.email,
      required this.telefone,
      required this.telefoneSecundario});
  String email;
  DateTime criadoEm;
  DateTime? atualizadoEm;
  String telefone;
  String telefoneSecundario;
  String celular;
  String celularSecundario;

  factory ContactPessoa.fromJson(Map<String, dynamic> json) => _$ContactPessoaFromJson(json);

  Map<String, dynamic> toJson() => _$ContactPessoaToJson(this);
}
