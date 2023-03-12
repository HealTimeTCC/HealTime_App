import 'package:healtime/shared/consts/consts_key_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataPreferences {
  static late SharedPreferences _sharedPreferences;

  static Future<void> _initPreferences() async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void savedDataString(String data, String key) async{
    await _initPreferences();
    _sharedPreferences.setString(key, data);
  }

  static Future<String> getString({required String key}) async{
    await _initPreferences();
    String? tokeUser = _sharedPreferences.getString(key);

    if (tokeUser != null) {
      return tokeUser;
    }
    else {
      return '';
    }
  }
}