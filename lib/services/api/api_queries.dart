import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../shared/consts/consts_required.dart';
import '../../shared/dto/dto_query.dart';
import 'package:http/http.dart' as http;

import '../../shared/models/model_especialidades.dart';
import '../provider/login/provider_login.dart';

class ApiQueries {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static Future<Map<String, dynamic>> postQuery(
      {required DtoQuery query, required BuildContext context}) async {

    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    Uri uriApi =
        Uri.parse('${providerLogin.addressServer ?? uriApiBase}ConsultaMedica/AgendarConsulta');

    http.Response response = await http.post(uriApi,
        body: jsonEncode(query), headers: {'Content-Type': 'application/json'});

    return {'statusCode': response.statusCode, 'body': response.body};
  }

  /* BUSCAR AS INFORMAÇÕES PRIMARIAS DA CONSULTA */
  static Future<Map<String, dynamic>> getInfoQueries(
      {required int status, required int id, required BuildContext context}) async {
    try {

      final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

      Uri uriApi = Uri.parse(
          '${providerLogin.addressServer ?? uriApiBase}ConsultaMedica/ListaAgendamentosPacientes');

      Map<String, dynamic> data = {"pacienteId": id, "statusConsulta": status};

      final Map<String, String>? head = await ConstsRequired.headRequisit();

      http.Response response =
          await http.post(uriApi, body: jsonEncode(data), headers: head);

      return {
        'statusCode': response.statusCode,
        'body': jsonDecode(response.body)
      };
    } catch (ex) {
      return {'statusCode': 0, 'body': ex};
    }
  }

  static Future<Map<String, dynamic>> getEspecialidades(BuildContext context) async{
    try {
      final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

      Uri uriApi = Uri.parse('${providerLogin.addressServer ?? uriApiBase}ConsultaMedica/GetEspecialidades');
      http.Response response = await http.get(uriApi);

      List listResponse = jsonDecode(response. body) as List<dynamic>;

      return {
        'statusCode': response.statusCode,
        'body':  listResponse.map((value) => ModelEspecialidades.fromJson(value)).toList()
      };
    }catch (ex) {
      return {};
    }
  }
}
