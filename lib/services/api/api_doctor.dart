import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:healtime/shared/models/model_doctor.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../shared/consts/consts_required.dart';
import '../provider/login/provider_login.dart';

class ApiMedico {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  //MÉTODO QUE SERÁ REFORMULADO NA API, NO MOMENTO(09042023) NÃO FOI ALTERADO
  static Future<List<Medico>> obterMedicosAsync(BuildContext context) async {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    final Uri uriApi = Uri.parse('${providerLogin.addressServer ?? uriApiBase}'
        'Medicacoes/ListarMedicos');

    Map<String, String>? header = await ConstsRequired.headRequisit();

    http.Response response = await http.get(
      uriApi,
      headers: header,
    );

    if (response.statusCode == 200) {
      List<dynamic> listDynamicDoctor =
          jsonDecode(response.body) as List<dynamic>;

      return listDynamicDoctor.map((e) => Medico.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  /*Incluir Medico*/

  static Future<int> incluirMedico(Medico medico, BuildContext context) async {
    final providerLogin = Provider.of<ProviderLogin>(context, listen: false);

    final Uri uriApi = Uri.parse('${providerLogin.addressServer ?? uriApiBase}'
        'ConsultaMedica/IncluiMedico');

    Map<String, String>? header = await ConstsRequired.headRequisit();

    http.Response response = await http.post(
      uriApi,
      body: json.encode(medico),
      headers: header,
    );

    return response.statusCode;
  }
}
