import 'package:flutter/material.dart';
import 'package:healtime/services/api/api_home_page.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../../shared/dto/dto_last_dosage.dart';
import '../../shared/models/enuns/enum_status_code.dart';
import '../data_locale/data_preferences_pessoa.dart';

class ProviderHomePage extends ChangeNotifier {
  Pessoa? _dataPerson;

  Pessoa? get getDataPerson => _dataPerson;

  TypeChargeView _statusCodeChargeHome = TypeChargeView.awaitCharge;

  TypeChargeView get getStatusCodeChargeHome => _statusCodeChargeHome;
  LastDosageDto? _dtoDataLastDosage;

  LastDosageDto? get getDataLastDosage => _dtoDataLastDosage;

  void chargeDataPerson(BuildContext context) async {
    _statusCodeChargeHome = TypeChargeView.awaitCharge;
    notifyListeners();
    await obterCodApplicator();
    if (_dataPerson == null) {
      _statusCodeChargeHome = TypeChargeView.notFound;
    } else {
      _dtoDataLastDosage = await ApiHomePage.UltimaDosage(context, _dataPerson!.pessoaId!);
      _statusCodeChargeHome = TypeChargeView.success;
    }
    notifyListeners();
  }

  Future<void> obterCodApplicator() async {
    _dataPerson = await DataPreferencesPessoa.getDataUser();
  }
}
