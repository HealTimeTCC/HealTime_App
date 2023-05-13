import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healtime/shared/consts/consts_key_preferences.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:healtime/src/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataPreferencesPessoa {
  static late SharedPreferences _sharedPreferences;

  static Future<void> _initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<Pessoa?> getDataUser() async {
    await _initPreferences();

    try {
      String? data = _sharedPreferences.getString(ConstsPreferences.keyUser);

      if (data != null) {
        Map<String, dynamic> mapDataUser = jsonDecode(data);

        return Pessoa.fromJson(mapDataUser);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<void> removeDataUser() async {
    await _initPreferences();

    await _sharedPreferences.remove(ConstsPreferences.keyUser);
  }

  static Future<void> removeUser(BuildContext context) async {
    await _initPreferences();

    await _sharedPreferences.remove(ConstsPreferences.keyUser);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
            (route) => false);
  }
}
