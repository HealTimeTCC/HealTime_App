import 'package:flutter/material.dart';
import 'package:healtime/services/api/api_pessoa.dart';
import 'package:healtime/services/data_locale/data_preferences_pessoa.dart';
import 'package:healtime/shared/dto/dto_pessoa_auth.dart';
import 'package:healtime/shared/models/model_pessoa.dart';

import '../presentation_screens/screen_choose_profile.dart';
import '../screens_navigation/home_page/widgets_home_page/start_view_widget.dart';

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
    try {
      Pessoa? dataUser = await DataPreferencesPessoa.getDataUser();

      if (mounted) {
        /* Verificando se o usuário está logado */
        if (dataUser != null) {
          DtoPessoa dtoPessoa = DtoPessoa(
              emailContato: dataUser.contact!.email,
              passwordString: dataUser.passwordString);

          /* Autenticar o usuário novamente */
          Map<String, dynamic> responseApi =
              await ApiPessoa.authUser(pessoa: dtoPessoa, context: context);

          if (mounted) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => responseApi['statusCode'] == 200
                      ? const StartWidgetView()
                      : const Apresentacao(),
                ),
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
    } catch (ex) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Apresentacao(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: const Color(0xff18CDCA),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.2,
              child: SizedBox(
                width: size.width * .8,
                child: const Image(
                  image: AssetImage('assets/img/logo.png'),
                ),
              ),
            ),
            SizedBox(height: size.height * .05),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.width * .12,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width)),
              child: const Opacity(
                opacity: 0.5,
                child: LinearProgressIndicator(
                  color: Color(0xff1AE8E4),
                  backgroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
