import 'package:flutter/material.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../data_locale/data_preferences_pessoa.dart';

class ProviderHomePage extends ChangeNotifier {
  Pessoa? _dataPerson;

  Pessoa? get getDataPerson => _dataPerson;

  bool _chargerNotifier = false;

  bool get getChargerNotifier => _chargerNotifier;

  void chargeDataPerson() async {
    _chargerNotifier = true;
    _dataPerson = await DataPreferencesPessoa.getDataUser();
    _chargerNotifier = false;
    notifyListeners();
  }
}
