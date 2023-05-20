import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import 'package:http/http.dart' as http;

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
}
