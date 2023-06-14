class Patient {
  Patient(
      {required this.pessoaId,
      required this.nomePessoa,
      required this.sobreNomePessoa,
      required this.cpfPessoa,
      required this.tipoPessoa});

  int pessoaId;
  int tipoPessoa;
  String cpfPessoa;
  String nomePessoa;
  String sobreNomePessoa;

  Patient.fromJson(Map<String, dynamic> json)
      : pessoaId = json['pessoaId'] as int,
        tipoPessoa = json['tipoPessoa'] ?? 2,
        cpfPessoa = json['cpfPessoa'] as String,
        nomePessoa = json['nomePessoa'] as String,
        sobreNomePessoa = json['sobreNomePessoa'] as String;
}
