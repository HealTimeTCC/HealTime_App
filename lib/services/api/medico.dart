import 'dart:convert';

import 'package:healtime/shared/models/medico.dart';
import 'package:http/http.dart' as http;

class ApiMedico {
  static Future<List<Medico>> obterMedicosAsync() async{
    final Uri uriApi = Uri.parse('http://healtime.somee.com/healtime/Medico/GetAll');

    http.Response response = await http.get(uriApi);

    if (response.statusCode == 200) {
      List<dynamic> listDynamicDoctor = jsonDecode(response.body) as List<dynamic>;

      return listDynamicDoctor.map((e) => Medico.fromJson(e)).toList();
    }else {
      return [];
    }
  }
}