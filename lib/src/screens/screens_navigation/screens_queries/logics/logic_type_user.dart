import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../shared/models/model_pessoa.dart';
import 'package:flutter/material.dart';

import '../screens/list_queries/screen_list_queries.dart';
import '../screens/select_pacient/screen_select_patient.dart';

class TypeUser {
  static typeUserNavigator(BuildContext context) async {
    Pessoa? pessoa = await DataPreferencesPessoa.getDataUser();

    if (pessoa != null) {
      if (pessoa.tipoPessoa == 1) {
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ListQueries(pessoa: pessoa),
            ),
          );
        }
      } else {
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SelectPatient(personId: pessoa.pessoaId!),
            ),
          );
        }
      }
    }
  }
}
