import 'package:flutter/material.dart';
import 'package:healtime/shared/models/model_type_medicine.dart';
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

  static Future<void> includeMedicine(
      {required BuildContext context, required ModelMedicacao medicine}) async {
    try {
      final providerLogin = Provider.of<ProviderLogin>(context, listen: false);
      Pessoa? person = await DataPreferencesPessoa.getDataUser();

      if (person == null) {
        throw Exception('Não foi possível obter os dados do usuário.');
      }

      medicine.codPessoaAlter = person.pessoaId;

      List<ModelMedicacao> listModelMedicine = [];
      listModelMedicine.add(medicine);

      int responseServer = await ApiMedicine.postMedicineUser(
          listModelMedicine: listModelMedicine,
          address: providerLogin.addressServer);

      if (responseServer != 200) {
        throw Exception(
            'Desculpe, mas não foi possível adicionar um medicamento.');
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            closeIconColor: Colors.white,
            showCloseIcon: true,
            content: const Text('Medicamento adicionado com sucesso!'),
          ),
        );

        Navigator.of(context).pop();
      }
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
    }
  }

  static Future<List<TypeMedicine>> getListMedicine(
      {required BuildContext context}) async {
    try {
      final providerLogin = Provider.of<ProviderLogin>(context, listen: false);
      Pessoa? person = await DataPreferencesPessoa.getDataUser();

      if (person == null) {
        throw Exception('Não foi possível obter os dados do usuário.');
      }

      return await ApiMedicine.getListTypeMedicine(
          address: providerLogin.addressServer);
    } catch (ex) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          closeIconColor: Colors.white,
          showCloseIcon: true,
          content: Text(
            ex.toString(),
          ),
        ),
      );
      return [];
    }
  }
}
