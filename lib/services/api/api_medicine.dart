import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../shared/consts/consts_required.dart';
import '../../shared/models/model_medicacao.dart';
import '../../shared/models/model_type_medicine.dart';

class ApiMedicine {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static Future<List<ModelMedicacao>> getMedineUser(
      {required int personId, String? address}) async {
    final Uri uriApi = Uri.parse('${address ?? uriApiBase}'
        'Medicacoes/ListaMedicamentos/$personId');

    final Map<String, String>? header = await ConstsRequired.headRequisit();

    http.Response response = await http.get(
      uriApi,
      headers: header,
    );

    if (response.statusCode == 404) return [];

    List<dynamic> responseListDynamic =
        (jsonDecode(response.body) ?? []) as List<dynamic>;

    return responseListDynamic.map((e) => ModelMedicacao.fromJson(e)).toList();
  }

  static Future<int> postMedicineUser(
      {required List<ModelMedicacao> listModelMedicine,
      String? address}) async {
    final Uri uriApi = Uri.parse('${address ?? uriApiBase}'
        'Medicacoes/IncluirMedicacoes');

    final Map<String, String>? header = await ConstsRequired.headRequisit();

    http.Response response = await http.post(
      uriApi,
      body: jsonEncode(listModelMedicine),
      headers: header,
    );

    return response.statusCode;
  }

  static Future<List<TypeMedicine>> getListTypeMedicine(
      {required String? address}) async {
    final Uri uriApi = Uri.parse('${address ?? uriApiBase}'
        'Medicacoes/ListarTipoDeMedicacao');

    final Map<String, String>? header = await ConstsRequired.headRequisit();

    http.Response response = await http.get(
      uriApi,
      headers: header,
    );

    List<dynamic> listMapTypesMedicine =
        jsonDecode(response.body) as List<dynamic>;

    return listMapTypesMedicine.map((e) => TypeMedicine.fromJson(e)).toList();
  }
}
