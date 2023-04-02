import 'dart:convert';

import 'package:healtime/shared/models/model_doctor.dart';
import 'package:http/http.dart' as http;

import '../../core/consts_required.dart';

class ApiMedico {
  static Future<List<Medico>> obterMedicosAsync() async {
    final Uri uriApi =
        Uri.parse('${ConstsRequired.urlBaseApi}Medico/GetAll');

    http.Response response = await http.get(uriApi);

    if (response.statusCode == 200) {
      List<dynamic> listDynamicDoctor =
          jsonDecode(response.body) as List<dynamic>;

      return listDynamicDoctor.map((e) => Medico.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  /*Incluir Medico*/

  static Future<int> incluirMedico(Medico medico) async {
    final Uri uriApi = Uri.parse(
        '${ConstsRequired.urlBaseApi}ConsultaMedica/IncluiMedico');

    http.Response response = await http.post(uriApi,
        body: json.encode(medico),
        headers: {'Content-Type': 'application/json'});

    return response.statusCode;
  }
}
