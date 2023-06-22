import 'package:flutter/material.dart';
import 'package:healtime/services/data_locale/data_preferences.dart';
import 'package:healtime/services/data_locale/data_preferences_pessoa.dart';
import 'package:healtime/shared/consts/consts_required.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

class LogicPatient {
  static String get uriApiBase => ConstsRequired.urlBaseApi;
  static Future<int?> getImageProfile(BuildContext context) async {
    try {
      Pessoa? person = await DataPreferencesPessoa.getDataUser();

      if (person == null) {
        throw Exception('Requisição negada');
      }
      if (person != 3) {
        throw Exception('Requisição negada');
      }

      return null;
    } catch (ex) {
      print(ex);
    }
  }
}
