import 'package:shared_preferences/shared_preferences.dart';

class DataPreferences {
  static late SharedPreferences _sharedPreferences;

  static Future<void> _initPreferences() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  /* Salvar um dado do tipo string */
  static Future<void> savedDataString(String data, String key) async {
    await _initPreferences();
    _sharedPreferences.setString(key, data);
  }

  /* Obter um dado do tipo string */
  static Future<String> getString({required String key}) async {
    await _initPreferences();
    String? tokeUser = _sharedPreferences.getString(key);

    if (tokeUser != null) {
      return tokeUser;
    } else {
      return '';
    }
  }

  /* Remover qualquer tipo de dado */
  static void removeData({required String key}) async {
    await _initPreferences();
    await _sharedPreferences.remove(key);
  }
}
