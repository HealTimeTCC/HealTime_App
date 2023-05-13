class DtoAlterPassword {
  DtoAlterPassword(
      {required this.email,
      required this.passwordString,
      required this.newPasswordString});

  String email;
  String passwordString;
  String newPasswordString;

  factory DtoAlterPassword.fromJson(Map<String, dynamic> json) =>
      DtoAlterPassword(
        email: json[''],
        passwordString: json[''],
        newPasswordString: json[''],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'passwordString': passwordString,
        'newPasswordString': newPasswordString,
      };
}
