import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healtime/services/data_locale/data_preferences_pessoa.dart';
import 'package:healtime/services/provider/login/provider_login.dart';
import 'package:healtime/shared/dto/dto_encerrar_cuidador_paciente.dart';
import 'package:healtime/shared/dto/dto_patient.dart';
import 'package:healtime/shared/dto/dto_post_associate_carer.dart';
import 'package:healtime/shared/dto/dto_post_associate_responsible.dart';
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

  static Future<Map<String, dynamic>> PostPaciente(
      {required BuildContext context, required Patient paciente}) async {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    final Uri urlPaciente =
        Uri.parse('${providerLogin.addressServer ?? uriApiBase}'
            'Pessoa/Registro');

    http.Response response = await http.post(
      urlPaciente,
      headers: await ConstsRequired.headRequisit(),
      body: jsonEncode(paciente.toJson()),
    );

    Map<String, dynamic> mapResponse = jsonDecode(response.body);

    print("=" * 80);
    print(mapResponse);
    print("=" * 80);

    final Pessoa person = Pessoa.fromJson(mapResponse);

    if (response.statusCode == 200) {
      print('Paciente criado com sucesso');
    } else {
      print('Falha ao criar paciente. Status code: ${response.body}');
    }

    return {'statusCode': response.statusCode, 'body': person};
  }

  static Future<Map<String, dynamic>> PostAssociateResponsibleCarer(
      {required BuildContext context, required Pessoa pessoa}) async {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    final Pessoa? person = await DataPreferencesPessoa.getDataUser();

    print("=" * 30);
    print(person?.tipoPessoa);
    print("=" * 30);

    if ((person?.tipoPessoa ?? 0) == 4) {
      print("=" * 30);
      print('Entrou no 4 AEEEEEEEEEEEEEEE');
      print("=" * 30);
      DtoPostAssociateCarer postAssociateCarer = DtoPostAssociateCarer(
        patientId: (pessoa.pessoaId ?? 1),
        patientCPF: pessoa.cpfPessoa,
        createdIn: DateTime.now(),
        carerCPF: person!.cpfPessoa,
        carerId: (person.pessoaId ?? 1),
      );

      final Uri urlPaciente =
          Uri.parse('${providerLogin.addressServer ?? uriApiBase}'
              'Paciente/AssociarCuidador');

      http.Response response = await http.post(
        urlPaciente,
        headers: await ConstsRequired.headRequisit(),
        body: jsonEncode(postAssociateCarer.toJson()),
      );
    } else if ((person?.tipoPessoa ?? 0) == 3) {
      DtoPostAssociateResponsible postAssociateResponsible =
          DtoPostAssociateResponsible(
        createdIn: DateTime.now(),
        degreeOfKinshipId: 1,
        patientId: (pessoa.pessoaId ?? 1),
        patientCPF: pessoa.cpfPessoa,
        responsible: (person?.pessoaId ?? 1),
        responsibleCPF: person!.cpfPessoa,
      );

      final Uri urlPaciente =
          Uri.parse('${providerLogin.addressServer ?? uriApiBase}'
              'Paciente/AssociarResponsavel');

      http.Response response = await http.post(
        urlPaciente,
        headers: await ConstsRequired.headRequisit(),
        body: jsonEncode(postAssociateResponsible.toJson()),
      );
    }
    return {'statusCode': http.Response, 'body': http.Response};
  }

  static Future<Map<String, dynamic>> DeleteCuidadorPaciente(
      {required BuildContext context,
      required EncerrarCuidadorPaciente patientId}) async {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    final Pessoa? person = await DataPreferencesPessoa.getDataUser();

    if ((person?.tipoPessoa ?? 0) == 3) {
      print("=" * 30);
      print('Entrou no 3 AEEEEEEEEEEEEEEE');
      print("=" * 30);
      EncerrarCuidadorPaciente encerrarCuidadorPaciente = EncerrarCuidadorPaciente(
        cuidadorId: (person?.pessoaId ?? 1),
        pacienteId: patientId.pacienteId
      );

      final Uri urlPaciente =
          Uri.parse('${providerLogin.addressServer ?? uriApiBase}'
              'Paciente/EncerrarCuidadorPaciente');

      http.Response response = await http.post(
        urlPaciente,
        headers: await ConstsRequired.headRequisit(),
        body: jsonEncode(encerrarCuidadorPaciente.toJson()),
      );
    }
    return {'statusCode': http.Response, 'body': http.Response};
  }
}
