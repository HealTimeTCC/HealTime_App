import 'dart:convert';

import 'package:healtime/shared/consts/consts_key_preferences.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataPreferencesPessoa {
  static late SharedPreferences _sharedPreferences;

  static Future<void> _initPreferences() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<Pessoa?> getDataUser() async{
    await _initPreferences();

    try {
      String? data = _sharedPreferences.getString(ConstsPreferences.keyUser);

      if (data != null) {
        Map<String, dynamic> mapDataUser = jsonDecode(data);

        Pessoa.fromJson(mapDataUser);

        return Pessoa.fromJson(mapDataUser);
      }else {
        return null;
      }
    }catch (e)  {
      return null;
    }
  }
}