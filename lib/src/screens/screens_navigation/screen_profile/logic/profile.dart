import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../shared/models/model_pessoa.dart';
import '../../home_page/logic/drawer.dart';

class LogicProfile {
  static Future<Map<String, dynamic>> getDataProfile(BuildContext context) async {
    Pessoa? person = await DataPreferencesPessoa.getDataUser();

    if (context.mounted) {
      Uint8List? img = await LogicDrawer.getImageProfile(context);

      return {
        'person': person,
        'img': img
      };
    }

    return {};
  }
}