class DtoPessoa {
  DtoPessoa({required this.emailContato, required this.passwordString});

  String emailContato;
  String passwordString;

  Map<String, dynamic> toJson() => {
        'email': emailContato,
        'passwordString': passwordString,
      };
}
