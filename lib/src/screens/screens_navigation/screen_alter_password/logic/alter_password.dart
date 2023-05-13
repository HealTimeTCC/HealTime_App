import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healtime/shared/models/model_pessoa.dart';
import 'package:provider/provider.dart';

import '../../../../../services/api/api_pessoa.dart';
import '../../../../../services/data_locale/data_preferences.dart';
import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../services/provider/login/provider_login.dart';
import '../../../../../shared/consts/consts_key_preferences.dart';
import '../../../../../shared/consts/consts_required.dart';
import '../../../../../shared/dto/dto_alter_password.dart';
import '../widget/snack_bar_error.dart';

class LogicAlterPassword {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static Future<bool> alterPassword(
      {required BuildContext context,
      required String oldPassword,
      required String newPassword}) async {
    try {
      final ProviderLogin providerLogin =
          Provider.of<ProviderLogin>(context, listen: false);
      Pessoa? person = await DataPreferencesPessoa.getDataUser();

      if (person == null) {
        throw Exception('Não foi possível recuperar os dados do usuário.');
      }

      if (person.passwordString != oldPassword) {
        throw Exception('Senha atual inválida, por favor verifique.');
      }

      final String address = providerLogin.addressServer ?? uriApiBase;

      DtoAlterPassword alterPassword = DtoAlterPassword(
          email: person.contact!.email,
          passwordString: oldPassword,
          newPasswordString: newPassword);

      int statusResponse = await ApiPessoa.alterPassword(
          newPassword: alterPassword, addressServer: address);

      if (statusResponse != 200) {
        throw Exception(
            'Não foi possível alterar a senha no momento, por favor tente novamente mais tarde.');
      }

      person.passwordString = newPassword;
      await DataPreferencesPessoa.removeDataUser();

      String newDataUser = jsonEncode(person.toJson());

      await DataPreferences.savedDataString(
          newDataUser, ConstsPreferences.keyUser);

      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
            closeIconColor: Colors.white,
            showCloseIcon: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: const Text('Senha alterada com sucesso!'),
          ),
        );
      }
      return true;
    } catch (ex) {
      SnackBarError.snackBarError(
          context: context, msg: 'Ocorreu um erro.\nEx: $ex');
      return false;
    }
  }
}
