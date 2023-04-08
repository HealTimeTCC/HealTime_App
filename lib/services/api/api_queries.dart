import 'dart:convert';

import '../../shared/consts/consts_required.dart';
import '../../shared/dto/dto_query.dart';
import 'package:http/http.dart' as http;

import '../../shared/models/model_especialidades.dart';

class ApiQueries {
  static Future<Map<String, dynamic>> postQuery(
      {required DtoQuery query}) async {
    Uri uriApi =
        Uri.parse('${ConstsRequired.urlBaseApi}ConsultaMedica/AgendarConsulta');

    print(query.pacienteId.toString());

    http.Response response = await http.post(uriApi,
        body: jsonEncode(query), headers: {'Content-Type': 'application/json'});

    return {'statusCode': response.statusCode, 'body': response.body};
  }

  /* BUSCAR AS INFORMAÇÕES PRIMARIAS DA CONSULTA */
  static Future<Map<String, dynamic>> getInfoQueries(
      {required int status, required int id}) async {
    try {
      Uri uriApi = Uri.parse(
          '${ConstsRequired.urlBaseApi}ConsultaMedica/ConsultaPorPaciente');

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

  static Future<Map<String, dynamic>> getEspecialidades() async{
    Uri uriApi = Uri.parse('${ConstsRequired.urlBaseApi}ConsultaMedica/Especialidades');
    http.Response response = await http.get(uriApi);

    List listResponse = jsonDecode(response. body) as List<dynamic>;

    return {
      'statusCode': response.statusCode,
      'body':  listResponse.map((value) => ModelEspecialidades.fromJson(value)).toList()
    };
  }
}
