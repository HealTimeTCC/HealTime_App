import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:healtime/services/data_locale/data_preferences.dart';
import 'package:healtime/shared/consts/consts_key_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:healtime/shared/dto/dto_pessoa_auth.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:provider/provider.dart';

import '../../shared/consts/consts_required.dart';
import '../../shared/dto/dto_pessoa_register.dart';
import '../provider/login/provider_login.dart';

class ApiPessoa {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  /* Autenticar usuário */
  static Future<Map<String, dynamic>> authUser(
      {required DtoPessoa pessoa, required BuildContext context}) async {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);
    int statusCode = 400;

    Uri uriApi = Uri.parse('${providerLogin.addressServer ?? uriApiBase}Pessoa/Autenticar');

    http.Response response = await http.post(uriApi,
        body: json.encode(pessoa),
        headers: {'Content-Type': 'application/json'});

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      statusCode = response.statusCode;

      /* Pegar os dados que chegam e converte para o objeto Pessoa*/
      Pessoa pessoaData = Pessoa.fromJson(jsonDecode(response.body));

      /* Adicionar a senha do usuario para salvar todos os dados do usuario de uma vez */
      pessoaData.passwordString = pessoa.passwordString;
      String dataUser = jsonEncode(pessoaData);

      DataPreferences.savedDataString(dataUser, ConstsPreferences.keyUser);
    }

    Map<String, dynamic> responseApi = {
      'statusCode': statusCode,
      'response': response.body,
    };

    return responseApi;
  }

  /* Registrar usuário */
  static Future<int> registerUser({required DtoPessoaRegister pessoa, required BuildContext context}) async {
    try {
      final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

      Uri uriApi = Uri.parse('${providerLogin.addressServer ?? uriApiBase}Pessoa/Registro');

      http.Response response = await http.post(uriApi,
          body: jsonEncode(pessoa),
          headers: {
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 15));
          print(response.body);
          print(response.statusCode);

      if (response.statusCode == 200) {
        DtoPessoa dtoPessoa = DtoPessoa(
            emailContato: pessoa.contatoEmail,
            passwordString: pessoa.passwordString);

        if (context.mounted) await authUser(pessoa: dtoPessoa, context: context);

        return 200;
      } else {
        return response.statusCode;
      }
    } on TimeoutException catch (_) {
      return 501;
    } catch (e) {
      return 400;
    }
  }
}
