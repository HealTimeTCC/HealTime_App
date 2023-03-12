import 'dart:convert';

import 'package:healtime/services/data_locale/data_preferences.dart';
import 'package:healtime/shared/consts/consts_key_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:healtime/shared/dto/dto_pessoa.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

class ApiPessoa {
  static Future<int> authUser({required DtoPessoa pessoa}) async {
    int statusCode = 400;

    Uri uriApi =
        Uri.parse('http://healtime.somee.com/healtime/Pessoa/Autenticar');

    http.Response response = await http.post(uriApi,
        body: json.encode(pessoa),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      statusCode = response.statusCode;

      /* Salvando a senha para depois enviar na autenticação*/
      Pessoa pessoaData = Pessoa.fromJson(jsonDecode(response.body));
      pessoaData.passwordString = pessoa.passwordString;

      print(pessoa.passwordString);

      String dataUser = jsonEncode(pessoaData);

      DataPreferences.savedDataString(dataUser, ConstsPreferences.keyUser);
    }
    return statusCode;
  }
}
