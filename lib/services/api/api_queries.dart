import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../shared/consts/consts_required.dart';
import '../../shared/dto/dto_encerrar_query.dart';
import '../../shared/dto/dto_query.dart';
import '../../shared/models/model_doctor.dart';
import '../../shared/models/model_especialidades.dart';
import '../../shared/models/model_pessoa.dart';
import '../provider/login/provider_login.dart';

class ApiQueries {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static Future<Map<String, dynamic>> postQuery(
      {required DtoQuery query, required BuildContext context}) async {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    Uri uriApi = Uri.parse(
        '${providerLogin.addressServer ?? uriApiBase}ConsultaMedica/AgendarConsulta');

    http.Response response = await http.post(uriApi,
        body: jsonEncode(query), headers: {'Content-Type': 'application/json'});

    return {'statusCode': response.statusCode, 'body': response.body};
  }

  /* BUSCAR AS INFORMAÇÕES PRIMARIAS DA CONSULTA */
  static Future<Map<String, dynamic>> getInfoQueries(
      {required int status,
      required int id,
      required BuildContext context}) async {
    try {
      final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

      Uri uriApi = Uri.parse(
          '${providerLogin.addressServer ?? uriApiBase}ConsultaMedica/ListaAgendamentosPacientes');

      Map<String, dynamic> data = {
        "pacienteId": id,
        "StatusConsultaId": status
      };

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

  static Future<Map<String, dynamic>> getEspecialidades(
      BuildContext context) async {
    try {
      final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

      Uri uriApi = Uri.parse(
          '${providerLogin.addressServer ?? uriApiBase}ConsultaMedica/GetEspecialidades');
      http.Response response = await http.get(uriApi);

      List<dynamic> listResponse = jsonDecode(response.body) as List<dynamic>;

      return {
        'statusCode': response.statusCode,
        'body': listResponse
            .map((value) => ModelEspecialidades.fromJson(value))
            .toList()
      };
    } catch (ex) {
      return {};
    }
  }

  static Future<List<Pessoa>?> getPatient(int idResponsibleCarer) async {
    try {
      final Uri uriApi = Uri.parse(
          '${uriApiBase}Paciente/PacienteByCodRespOrCuidador/$idResponsibleCarer');

      print(uriApi);
      http.Response response = await http.get(uriApi);

      List<dynamic> listResponse = jsonDecode(response.body) as dynamic;

      return listResponse.map((element) => Pessoa.fromJson(element)).toList();
    } catch (ex) {
      return null;
    }
  }

  static Future<int> encerrarQuery(EncerrarQuery query) async {
    try {
      final Uri uriAPi =
          Uri.parse('${uriApiBase}ConsultaMedica/AtualizarConsulta');

      final Map<String, String>? header = await ConstsRequired.headRequisit();

      http.Response response = await http.put(
        uriAPi,
        body: jsonEncode(query),
        headers: header,
      );

      return response.statusCode;
    } catch (ex) {
      return 501;
    }
  }

  static Future<DtoQuery?> detailsQuery(
      {required int personId, required int queryId}) async {
    try {
      Uri uriApi = Uri.parse(
          '${uriApiBase}ConsultaMedica/ConsultaAgendadaConsultaCodPessoaCod/$personId/$queryId');

      final http.Response response = await http.get(uriApi);

      if (response.statusCode == 200) {
        Map<String, dynamic> mapResponse = jsonDecode(response.body);

        final DtoQuery detailsQuery = DtoQuery.fromJson(mapResponse);
        return detailsQuery;
      }

      return null;
    } catch (ex) {
      return null;
    }
  }

  static Future<Medico?> getDetailsDoctor(int doctorId) async {
    try {
      Uri uriApi = Uri.parse(
          '${uriApiBase}ConsultaMedica/ConsultarMedicoById/$doctorId');

      Map<String, String>? header = await ConstsRequired.headRequisit();

      final http.Response response = await http.get(uriApi, headers: header);

      if (response.statusCode == 200) {
        Map<String, dynamic> mapResponse = jsonDecode(response.body);

        final Medico detailsQuery = Medico.fromJson(mapResponse);
        return detailsQuery;
      }

      return null;
    } catch (ex) {
      return null;
    }
  }

  static Future<ModelEspecialidades> getDetailsSpecialty(
      int specialtyId) async {
    try {
      Uri uriApi = Uri.parse(
          '${uriApiBase}ConsultaMedica/EspecialidadeByCod/$specialtyId');

      Map<String, String>? header = await ConstsRequired.headRequisit();

      final http.Response response = await http.get(uriApi, headers: header);

      if (response.statusCode == 200) {
        Map<String, dynamic> mapResponse = jsonDecode(response.body);

        final ModelEspecialidades detailsQuery =
            ModelEspecialidades.fromJson(mapResponse);
        return detailsQuery;
      }
      return ModelEspecialidades(
          descEspecialidade: 'Não informado', especialidadeId: 0);
    } catch (ex) {
      return ModelEspecialidades(
          descEspecialidade: 'Não informado', especialidadeId: 0);
    }
  }

  static Future<Pessoa?> getDetailsPerson(int personId) async {
    final Pessoa person;

    try {
      Uri uriApi = Uri.parse('${uriApiBase}Pessoa/PessoaById/$personId');

      Map<String, String>? header = await ConstsRequired.headRequisit();

      final http.Response response = await http.get(
        uriApi,
        headers: header,
      );

      Map<String, dynamic> mapResponse = jsonDecode(response.body);

      person = Pessoa.fromJson(mapResponse);
      return person;
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
