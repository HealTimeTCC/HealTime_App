import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import 'package:http/http.dart' as http;

class ApiPaciente {
  static Future<List<Pessoa>> listarPaciente() async {
    final Uri urlPaciente = Uri.parse('');
    http.Response response = await http.get(urlPaciente);

    if (response.statusCode == 200) {
      List<dynamic> listaPaciente = jsonDecode(response.body) as List<dynamic>;

      return listaPaciente.map((p) => Pessoa.fromJson(p)).toList();
    } 
    else {
      throw Exception(" ");
    }
  }
}
