import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healtime/services/provider/login/provider_login.dart';
import 'package:healtime/shared/dto/dto_patient.dart';
import 'package:healtime/shared/dto/dto_post_associate_carer.dart';
import 'package:healtime/shared/models/enuns/enum_tipo_pessoa.dart';
import 'package:healtime/shared/dto/dto_patient.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:healtime/src/screens/screens_navigation/screens_queries/logics/logic_type_user.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../shared/consts/consts_required.dart';

class ApiPaciente {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static Future<List<Pessoa>?> getPatient(int idResponsibleCarer) async {
    try {
      final Uri uriApi = Uri.parse(
          '${uriApiBase}Paciente/PacienteByCodRespOrCuidador/$idResponsibleCarer');

      http.Response response = await http.get(uriApi);

      List<dynamic> listResponse = jsonDecode(response.body) as dynamic;

      return listResponse.map((element) => Pessoa.fromJson(element)).toList();
    } catch (ex) {
      return null;
    }
  }

  static Future<int> PostPaciente(
      {required BuildContext context, required Patient paciente}) async {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    final Uri urlPaciente =
        Uri.parse('${providerLogin.addressServer ?? uriApiBase}'
            'Pessoa/Registro');
    // Map<String, String>? header = await ConstsRequired.headRequisit();
    http.Response response = await http.post(
      urlPaciente,
      headers: await ConstsRequired.headRequisit(),
      body: jsonEncode(paciente.toJson()),
    );
    print(
      jsonEncode(paciente.toJson()),
    );
    if (response.statusCode == 200) {
      print('Paciente criado com sucesso');
    } else {
      print('Falha ao criar paciente. Status code: ${response.body}');
    }

    return response.statusCode;
  }

  //   static Future<String> PostPaciente(
  //     {required BuildContext context, required Patient paciente}) async {
  //   final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

  //   final Uri urlPaciente =
  //       Uri.parse('${providerLogin.addressServer ?? uriApiBase}'
  //           'Pessoa/Registro');
  //   // Map<String, String>? header = await ConstsRequired.headRequisit();
  //   http.Response response = await http.post(urlPaciente,
  //       headers: await ConstsRequired.headRequisit(),
  //       body: jsonEncode(paciente.toJson()));

  //   if (response.statusCode == 200) {
  //     print('Paciente criado com sucesso');
  //   } else {
  //     print('Falha ao criar paciente. Status code: ${response.statusCode}');
  //   }

  //   return PostPaciente(context: context, paciente: paciente);
  // }
}
