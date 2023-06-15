import 'package:flutter/material.dart';

import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../shared/models/model_pessoa.dart';

class MedicalPrescriptionLogic {
  static Future<Pessoa?> getTypeUser(BuildContext context) async {
    try {
      Pessoa? person = await DataPreferencesPessoa.getDataUser();

      if (person == null) {
        throw Exception('Não foi possível obter os dados do usuário.');
      }

      return person;

    } catch (ex) {
      final Size size = MediaQuery.of(context).size;

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          closeIconColor: Colors.white,
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width * .02),
          ),
          content: Text(
            ex.toString(),
          ),
        ),
      );
      return null;
    }
  }

  static Future<void> addUser() async {

  }

}
