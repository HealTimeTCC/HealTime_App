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
import '../../shared/dto/dto_alter_password.dart';
import '../../shared/dto/dto_pessoa_register.dart';
import '../../shared/dto/dto_post_associate_responsible.dart';
import '../provider/login/provider_login.dart';
import '../provider/provider_user.dart';

class ApiPessoa {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  //#region autenticar usuário
  static Future<Map<String, dynamic>> authUser({
    required DtoPessoa pessoa,
    required BuildContext context,
  }) async {
    final ProviderPerson providerPerson = Provider.of<ProviderPerson>(context, listen: false);
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);
    int statusCode = 400;

    final Uri uriApi = Uri.parse(
        '${providerLogin.addressServer ?? uriApiBase}Pessoa/Autenticar');

    final http.Response response = await http.post(
      uriApi,
      body: json.encode(pessoa),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      statusCode = response.statusCode;

      /* Pegar os dados que chegam e converte para o objeto Pessoa*/
      Pessoa pessoaData = Pessoa.fromJson(jsonDecode(response.body));

      /* Adicionar a senha do usuario para salvar todos os dados do usuario de uma vez */
      pessoaData.passwordString = pessoa.passwordString;
      String dataUser = jsonEncode(pessoaData);

      DataPreferences.savedDataString(dataUser, ConstsPreferences.keyUser);

      await providerPerson.initialUser();
    }

    Map<String, dynamic> responseApi = {
      'statusCode': statusCode,
      'response': response.body,
    };

    return responseApi;
  }

  //#endregion

  //#region Registrar usuário
  static Future<int> registerUser(
      {required DtoPessoaRegister pessoa,
      required BuildContext context}) async {
    try {
      final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

      Uri uriApi = Uri.parse(
          '${providerLogin.addressServer ?? uriApiBase}Pessoa/Registro');

      http.Response response = await http.post(
        uriApi,
        body: jsonEncode(pessoa),
        headers: {
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        DtoPessoa dtoPessoa = DtoPessoa(
            emailContato: pessoa.contatoEmail,
            passwordString: pessoa.passwordString);

        if (context.mounted) {
          await authUser(pessoa: dtoPessoa, context: context);
        }

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

  //#endregion

  //#region Alterar senha
  static Future<int> alterPassword(
      {required DtoAlterPassword newPassword,
      required String addressServer}) async {
    try {
      Uri uriApi = Uri.parse('${addressServer}Pessoa/AlteraSenha');

      final Map<String, String>? header = await ConstsRequired.headRequisit();

      http.Response response = await http
          .put(uriApi, body: jsonEncode(newPassword.toJson()), headers: header)
          .timeout(
            const Duration(seconds: 15),
          );

      return response.statusCode;
    } on TimeoutException catch (_) {
      return 1;
    } catch (ex) {
      return 0;
    }
  }

  //#endregion

  //#region Associar um responsavel a um paciente
  static Future<int> associateResponsible({
    required DtoPostAssociateResponsible associateResponsible,
    required String addressServer,
  }) async {
    try {
      Uri uriApi = Uri.parse('${addressServer}Paciente/AssociarResponsavel');

      final Map<String, String>? header = await ConstsRequired.headRequisit();

      http.Response response = await http
          .post(uriApi,
              body: jsonEncode(associateResponsible.toJson()), headers: header)
          .timeout(
            const Duration(seconds: 15),
          );

      return response.statusCode;
    } on TimeoutException catch (_) {
      return 1;
    } catch (ex) {
      return 0;
    }
  }

//#endregion

  /* Adicionar imagem */

  static Future<int> includeImage(
      {required Map<String, dynamic> dataMap,
      required String addressServer}) async {
    try {
      final Uri uriApi = Uri.parse('${addressServer}Pessoa/IncluirFoto');

      final Map<String, String>? header = await ConstsRequired.headRequisit();

      final http.Response response = await http
          .post(
            uriApi,
            body: jsonEncode(dataMap),
            headers: header,
          )
          .timeout(
            const Duration(seconds: 15),
          );

      return response.statusCode;
    } on TimeoutException catch (_) {
      return 1;
    } catch (ex) {
      return 0;
    }
  }
}
