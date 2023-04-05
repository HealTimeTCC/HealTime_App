class ModelEspecialidades {

  ModelEspecialidades({required this.descEspecialidade, required this.especialidadeId});

  int especialidadeId;
  String descEspecialidade;

  ModelEspecialidades.fromJson(Map<String, dynamic> json) :
        especialidadeId   = json['especialidadeId'],
        descEspecialidade = json['descEspecialidade'];

  Map<String, dynamic> toJson() =>
      {
        'especialidadeId'   : especialidadeId,
        'descEspecialidade' : descEspecialidade
      };
}
