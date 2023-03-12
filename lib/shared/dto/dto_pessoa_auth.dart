class DtoPessoa {
  DtoPessoa({required this.nomePessoa, required this.passwordString});

  String nomePessoa = '';
  String passwordString = '';

  Map<String, dynamic> toJson(){
    return {
      'nomePessoa': nomePessoa,
      'passwordString': passwordString,
    };
  }
}
