import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:healtime/shared/decorations/fonts_google.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../services/api/api_pessoa.dart';
import '../../../../../services/api/api_queries.dart';
import '../../../../../services/data_locale/data_preferences_pessoa.dart';
import '../../../../../services/provider/login/provider_login.dart';
import '../../../../../shared/consts/consts_required.dart';
import '../../../../../shared/models/enuns/enum_type_screen_profile.dart';
import '../../../../../shared/models/model_pessoa.dart';

class LogicDrawer {
  static String get uriApiBase => ConstsRequired.urlBaseApi;

  static Future<void> addImageProfile({
    required BuildContext context,
    required TypeProfile typeOperation,
  }) async {
    try {
      final ProviderLogin providerLogin =
          Provider.of<ProviderLogin>(context, listen: false);

      final ImagePicker picker = ImagePicker();

      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        Pessoa? person = await DataPreferencesPessoa.getDataUser();

        if (person == null) {
          throw Exception('Não foi possível obter os dados da pessoa logada.');
        }

        File image = File(pickedFile.path);

        List<int> imageBytes = image.readAsBytesSync();

        String base64Image = base64Encode(imageBytes);

        final String address = providerLogin.addressServer ?? uriApiBase;

        Map<String, dynamic> dataPost = {
          'pessoaId': person.pessoaId,
          'fotoPessoa': base64Image
        };

        /* Enviar os dados */
        int responseServer = await ApiPessoa.includeImage(
            dataMap: dataPost, addressServer: address);

        if (responseServer == 200) {
          if (context.mounted) {
            if (typeOperation == TypeProfile.typeDrawer) {
              Navigator.of(context).pop();
            }
            final Size size = MediaQuery.of(context).size;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    size.width * .02,
                  ),
                ),
                backgroundColor: const Color(0xFF14D8D5),
                content: Text(
                  'Foto cadastrada com sucesso!',
                  style: FontGoogle.textNormaleGoogle(
                    size: size * .8,
                    colorText: Colors.white,
                  ),
                ),
              ),
            );
          }
        }
      } else {
        print('Nenhuma imagem selecionada');
      }
    } catch (ex) {
      print(ex);
    }
  }

  static Future<Uint8List?> getImageProfile(BuildContext context) async {
    try {
      Pessoa? person = await DataPreferencesPessoa.getDataUser();

      if (person == null) {
        throw Exception('Não foi possível obter os dados do usuário.');
      }

      Pessoa? personGet =
          await ApiQueries.getDetailsPerson(person.pessoaId ?? 0);

      if (personGet == null) {
        throw Exception(
            'Não foi possível obter os dados do usuário no servidor.');
      }

      return base64Decode(personGet.imagePerson ?? '');
    } catch (ex) {
      print(ex);
    }
  }
}
