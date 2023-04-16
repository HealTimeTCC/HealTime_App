import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healtime/shared/consts/consts_required.dart';
import 'package:healtime/shared/dto/dto_pessoa_auth.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:http/http.dart' as http;
import 'package:healtime/services/api/api_doctor.dart';
import 'package:healtime/shared/models/model_doctor.dart';

void main() async {
  test('Deve retornar as especialidades cadastradas', () async {
    Uri uriApi =
        Uri.parse('${ConstsRequired.urlBaseApi}ConsultaMedica/Especialidades');

    await http.get(uriApi).then((value) {
      expect(value, isNot(Exception));
      expect(value.body, isNotNull);
      expect(value.statusCode, 200);
    });
  });

  test('Deve retornar dados do usuário', () async {
    DtoPessoa dtoPessoa =
        DtoPessoa(emailContato: 'user@user.com', passwordString: '1q2w3e4r');

    Uri uriApi = Uri.parse('${ConstsRequired.urlBaseApi}Pessoa/Autenticar');

    http.Response response = await http.post(uriApi,
        body: json.encode(dtoPessoa),
        headers: {'Content-Type': 'application/json'});

    Pessoa pessoaData = Pessoa.fromJson(jsonDecode(response.body));

    expect(response.statusCode, 200);
    expect(response.body, isNotEmpty);
    expect(response.body, isNotNull);
    expect(pessoaData.contact!.email, isNotNull);
    expect(pessoaData.contact!.email, isNotEmpty);
    expect(pessoaData.pessoaId, isNotNull);
    expect(pessoaData.pessoaId, isNot(0));
    expect(pessoaData.tokenUser, isNotNull);
    expect(pessoaData.tokenUser, isNotEmpty);
  });

  test('Deve obter informações referentes a consultas', () async {
    Uri uriApi = Uri.parse(
        '${ConstsRequired.urlBaseApi}ConsultaMedica/ConsultaPorPaciente');

    // Id = 1 => user@user.com
    Map<String, dynamic> data = {"pacienteId": 1, "statusConsulta": 1};

    http.Response response =
        await http.post(uriApi, body: jsonEncode(data), headers: {
      "Content-Type": "application/json",
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxIiwidW5pcXVlX25hbWUiOiJEYW4iLCJmYW1pbHlfbmFtZSI6Ik1hcnpvIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy91c2VyZGF0YSI6IlJlc3BvbnNhdmVsIiwibmJmIjoxNjgwOTc3MDc4LCJleHAiOjE2ODEwNjM0NzgsImlhdCI6MTY4MDk3NzA3OH0.u7vBiQ7ME_ZNzKWkF3bvm60ffUoflqzVtmY82QK024w"
    });

    expect(response.statusCode, isNot(502));
    expect(response.body, isNotNull);
    expect(response.body.length, isNonNegative);
  });

  test('METODO LA', () {
    // mock da classe

    // Arrange -> atribuição de valores de variavel

    //Act -> teste de condições e montagem de artefato

    //Assert -> testar
  });
}
