import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../services/api/api_medicine.dart';
import '../../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../../services/provider/login/provider_login.dart';
import '../../../../../../shared/models/model_medicacao.dart';
import '../../../../../../shared/models/model_pessoa.dart';

class LogicMedicine {
  static Future<List<ModelMedicacao>> listMedicine(
      {required BuildContext context}) async {
    try {
      final providerLogin = Provider.of<ProviderLogin>(context, listen: false);
      Pessoa? person = await DataPreferencesPessoa.getDataUser();

      if (person == null) {
        throw Exception('Não foi possível obter os dados do usuário.');
      }

      return await ApiMedicine.getMedineUser(
          personId: person.pessoaId ?? 0, address: providerLogin.addressServer);
    } catch (ex) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          closeIconColor: Colors.white,
          showCloseIcon: true,
          content: Text(ex.toString()),
        ),
      );
      return [];
    }
  }
}
