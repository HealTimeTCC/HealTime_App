class DtoPessoaRegister {
  DtoPessoaRegister(
      {required this.cpfPessoa,
        required this.nomePessoa,
        required this.sobrenomePessoa,
        required this.dtNascPessoa,
        required this.tipoPessoaId,
        required this.passwordString});

  int tipoPessoaId = 1;
  String cpfPessoa = '';
  String nomePessoa = '';
  String sobrenomePessoa = '';
  DateTime dtNascPessoa = DateTime.now();
  String passwordString = '';

  /* Des. dados */
  DtoPessoaRegister.fromJson(Map<String, dynamic> json)
      : tipoPessoaId = json['tipoPessoa'] ?? 1,
        cpfPessoa = json['cpfPessoa'],
        nomePessoa = json['nomePessoa'],
        sobrenomePessoa = json['sobrenomePessoa'] ?? '',
        dtNascPessoa = DateTime.parse(json['dtNascPessoa']),
        passwordString = json['passwordString'] ?? '';

  /* Serializar dados */
  Map<String, dynamic> toJson() {
    return {
      'tipoPessoa': tipoPessoaId,
      'cpfPessoa': cpfPessoa,
      'nomePessoa': nomePessoa,
      'sobrenomePessoa': sobrenomePessoa,
      'dtNascPessoa': dtNascPessoa.toIso8601String(),
      'passwordString': passwordString,
    };
  }
}
