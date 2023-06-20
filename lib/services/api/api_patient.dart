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

  static Future<List<Pessoa>> listarPaciente() async {
    final Uri urlPaciente = Uri.parse('');

    Map<String, String>? header = await ConstsRequired.headRequisit();

    http.Response response = await http.get(
      urlPaciente,
      headers: header,
    );

    if (response.statusCode == 200) {
      List<dynamic> listaPaciente = jsonDecode(response.body) as List<dynamic>;

      return listaPaciente.map((p) => Pessoa.fromJson(p)).toList();
    } else {
      throw Exception(
        const AlertDialog(
          title: Text('Aviso!'),
          content: Text('Erro: Pacientes não encontrados'),
        ),
      );
    }
  }

  static Future<String> PostPaciente(
      {required BuildContext context, required Pessoa paciente}) async {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    final Uri urlPaciente =
        Uri.parse('${providerLogin.addressServer ?? uriApiBase}'
            'Pessoa/Registro');
    // Map<String, String>? header = await ConstsRequired.headRequisit();
    http.Response response = await http.post(urlPaciente,
        headers: await ConstsRequired.headRequisit(),
        body: jsonEncode(paciente.toJson()));

    if (response.statusCode == 200) {
      print('Paciente criado com sucesso');
    } else {
      print('Falha ao criar paciente. Status code: ${response.statusCode}');
    }

    return PostPaciente(context: context, paciente: paciente);
  }

  // static Future<bool> AssociarPacienteCuidador({required BuildContext, required DtoPostAssociateCarer associateCare}){

  // }

  // static String PostPaciente({required Patient paciente }){

  // }
}
