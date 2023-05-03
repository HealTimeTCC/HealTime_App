import 'package:healtime/shared/models/model_pessoa.dart';

import '../../services/data_locale/data_preferences_pessoa.dart';

class ConstsRequired {
  static Future<Map<String, String>?> headRequisit() async {
    final Pessoa? pessoa = await DataPreferencesPessoa.getDataUser();

    final String token = pessoa!.tokenUser;

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  /* URL DO SOMEE */
  //static const String urlBaseApi = 'http://healtime.somee.com/healtime/';

  /* URL DO LOCALTUNEL OU NGROK */
  static const String urlBaseApi = 'https://4051-2804-431-cfc8-bdfa-f8a2-ead8-b9ca-7335.ngrok-free.app/';
}
