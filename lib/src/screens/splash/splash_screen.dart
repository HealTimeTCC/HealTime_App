import 'package:flutter/material.dart';
import 'package:healtime/services/api/api_pessoa.dart';
import 'package:healtime/shared/dto/dto_pessoa_auth.dart';
import 'package:healtime/src/screens/screens_navigation/home_page/home.dart';

import '../presentation_screens/screen_choose_profile.dart';
import 'package:healtime/services/data_locale/data_preferences_pessoa.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigatorSettings();
  }

  void navigatorSettings() async {
    Pessoa? dataUser = await DataPreferencesPessoa.getDataUser();

    if (mounted) {
      /* Verificando se o usuário está logado */
      if (dataUser != null) {
        DtoPessoa dtoPessoa = DtoPessoa(
            nomePessoa: dataUser.nomePessoa,
            passwordString: dataUser.passwordString);

        /* Autenticar o usuário novamente */
        Map<String, dynamic> responseApi = await ApiPessoa.authUser(pessoa: dtoPessoa);

        if (mounted) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                  responseApi['statusCode'] == 200 ? HomePage() : const Apresentacao()),
              (route) => false);
        }
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Apresentacao(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff18CDCA),
      child: const Center(
        child: Image(
          image: AssetImage('assets/img/logoHealTime.png'),
        ),
      ),
    );
  }
}
