import 'package:flutter/cupertino.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../data_locale/data_preferences_pessoa.dart';

class ProviderPerson extends ChangeNotifier {
  Pessoa? _person;

  Pessoa? get person => _person;

  Future<void> initialUser() async {
    _person = await DataPreferencesPessoa.getDataUser();
  }

}
