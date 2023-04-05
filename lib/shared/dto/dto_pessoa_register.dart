class DtoPessoaRegister {
  DtoPessoaRegister(
      {required this.cpfPessoa,
      required this.nomePessoa,
      required this.sobrenomePessoa,
      required this.dtNascPessoa,
      required this.tipoPessoaId,
      required this.passwordString,
      required this.contatoCelular,
      required this.contatoEmail});

  int tipoPessoaId;
  String cpfPessoa;
  String nomePessoa;
  String sobrenomePessoa;
  DateTime dtNascPessoa;
  String passwordString;
  String contatoCelular;
  String contatoEmail;
  DateTime contatoCriadoEm = DateTime.now();

  /* Des. dados */
  DtoPessoaRegister.fromJson(Map<String, dynamic> json)
      : tipoPessoaId = json['tipoPessoa'] ?? 1,
        cpfPessoa = json['cpfPessoa'],
        nomePessoa = json['nomePessoa'],
        sobrenomePessoa = json['sobrenomePessoa'] ?? '',
        dtNascPessoa = DateTime.parse(json['dtNascPessoa']),
        passwordString = json['passwordString'] ?? '',
        contatoEmail = json['contatoEmail'], 
        contatoCelular = json['contatoCelular'];

  /* Serializar dados */
  Map<String, dynamic> toJson() =>
      {
        'tipoPessoa':       tipoPessoaId,
        'cpfPessoa':        cpfPessoa,
        'nomePessoa':       nomePessoa,
        'sobreNomePessoa':  sobrenomePessoa,
        'passwordString':   passwordString,
        'dtNascPessoa':     dtNascPessoa.toIso8601String(),
        'contatoCelular':   contatoCelular,
        'contatoEmail':     contatoEmail,
        'contatoCriadoEm':  contatoCriadoEm.toIso8601String()
      };
}
