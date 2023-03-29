import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../shared/models/model_pessoa.dart';
import 'package:flutter/material.dart';

import '../screens/list_queries/screen_list_queries.dart';

class TypeUser {
  static typeUserNavigator(BuildContext context) async {
    final navigador = Navigator.of(context);
    Pessoa? pessoa = await DataPreferencesPessoa.getDataUser();

    if (pessoa != null) {

      if (pessoa.tipoPessoa == 1) {
        navigador.push(
          MaterialPageRoute(
            builder: (context) => ListQueries(pessoa: pessoa),
          ),
        );
      } else {

        /* Tela para selecionar o paciente que está associado a ele */
        /* Enviar os dados do perfil da pessoa */
      }
    }
  }
}
