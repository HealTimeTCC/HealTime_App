import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../shared/consts/consts_required.dart';
import '../../shared/models/model_medicacao.dart';

class ApiMedicine {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static Future<List<ModelMedicacao>> getMedineUser(
      {required int personId, String? address}) async {
    final Uri uriApi = Uri.parse('${address ?? uriApiBase}'
        'Medicacoes/ListaMedicamentos/$personId');

    http.Response response =
        await http.get(uriApi, headers: {'Content-Type': 'application/json'});

    List<dynamic> responseListDynamic =
        (jsonDecode(response.body) ?? []) as List<dynamic>;

    return responseListDynamic.map((e) => ModelMedicacao.fromJson(e)).toList();
  }

  static Future<int> postMedicineUser(
      {required List<ModelMedicacao> listModelMedicine,
      String? address}) async {
    final Uri uriApi = Uri.parse('${address ?? uriApiBase}'
        'Medicacoes/IncluirMedicacoes');

    http.Response response = await http.post(
      uriApi,
      body: jsonEncode(listModelMedicine),
      headers: {'Content-Type': 'application/json'},
    );

    return response.statusCode;
  }
}
