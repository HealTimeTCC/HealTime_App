import 'package:healtime/shared/models/enuns/enum_type_operation.dart';

import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../shared/models/model_pessoa.dart';
import 'package:flutter/material.dart';

import '../screens/list_queries/screen_list_queries.dart';
import '../../screens_medical/screen_patient/select_pacient/screen_select_patient.dart';

class TypeUser {
  static typeUserNavigator(BuildContext context) async {
    Pessoa? pessoa = await DataPreferencesPessoa.getDataUser();

    if (pessoa != null) {
      if (pessoa.tipoPessoa == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ListQueries(pessoa: pessoa),
          ),
        );
      } else {
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SelectPatient(
                incluiPrescricaoMedica: false,
                  personId: pessoa.pessoaId!,
                  typeOperation: TypeOperation.select),
            ),
          );
        }
      }
    }
  }
}
