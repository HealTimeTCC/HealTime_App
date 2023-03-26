import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../shared/models/model_pessoa.dart';
import 'package:flutter/material.dart';

import '../screens/screen_list_queries.dart';

class TypeUser {
  static typeUserNavigator(BuildContext context) async {
    Pessoa? pessoa = await DataPreferencesPessoa.getDataUser();

    if (pessoa != null) {
      print(pessoa.tipoPessoa);

      if (pessoa.tipoPessoa == 2) {
        if (context.mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ListQueries(pessoa: pessoa),
            ),
          );
        }

      } else {

        /* Tela para selecionar o paciente que está associado a ele */
        /* Enviar os dados do perfil da pessoa */
      }
    }
  }
}
