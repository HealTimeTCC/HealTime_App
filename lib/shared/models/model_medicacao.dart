import 'package:healtime/shared/models/enuns/enum_status_medicacao.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_serializable/model_medicacao.g.dart';

@JsonSerializable()
class ModelMedicacao {
  ModelMedicacao(
      {required this.compostoAtivoMedicacao,
      required this.generico,
      required this.laboratorioMedicacao,
      this.medicacaoId,
      required this.nomeMedicacao,
      required this.statusMedicacaoId,
      required this.tipoMedicacaoId,
      this.codPessoaAlter});

  int? medicacaoId;
  StatusMedicacao statusMedicacaoId;
  int tipoMedicacaoId;
  String nomeMedicacao;
  String compostoAtivoMedicacao;
  String laboratorioMedicacao;
  String generico;
  int? codPessoaAlter;

  factory ModelMedicacao.fromJson(Map<String, dynamic> json) =>
      _$ModelMedicacaoFromJson(json);

  Map<String, dynamic> toJson() => _$ModelMedicacaoToJson(this);
}
