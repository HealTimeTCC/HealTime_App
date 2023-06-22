import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/screens_login_register/widgets/text_form_model.dart';
import 'package:provider/provider.dart';

import '../../../../services/api/api_pessoa.dart';
import '../../../../services/provider/login/provider_login.dart';
import '../../../../shared/decorations/screen_background.dart';
import '../../../../shared/dto/dto_pessoa_auth.dart';
import '../../screens_navigation/home_page/widgets_home_page/start_view_widget.dart';
import '../widgets/loading_sending_data.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController _textEmail = TextEditingController();
  final TextEditingController _textPassword = TextEditingController();
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  IconData iconPassword = Icons.check_circle_rounded;
  Color colorIconPassword = Colors.green;

  @override
  Widget build(BuildContext context) {
    final providerLogin = Provider.of<ProviderLogin>(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPageV2(),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => providerLogin.incrementScreen(context),
                    child: Text(
                      'Entre com a sua conta',
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: Color(0xFFFFFFFF),
                          fontSize: 26,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ]),
          )),
          Container(
            margin: EdgeInsets.only(top: 120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              children: [
                SizedBox(height: size.height * .04),
                Text(
                  'Não se preocupe! Seus dados estão completamente seguros com a '
                  'equipe do HealTime.',
                  style: GoogleFonts.getFont('Poppins',
                      decoration: TextDecoration.none,
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: size.height * .06),
                Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      ModelTextForm.modelTextForm(
                          textController: _textEmail,
                          validator: false,
                          textLabel: 'Nome usuário/e-mail',
                          typeKeyboard: TextInputType.emailAddress,
                          size: size,
                          obscure: false),
                      ModelTextForm.modelTextForm(
                          textController: _textPassword,
                          validator: true,
                          textLabel: 'Senha',
                          typeKeyboard: TextInputType.text,
                          size: size,
                          icon: iconPassword,
                          iconColor: colorIconPassword,
                          obscure: true),
                    ],
                  ),
                ),
                SizedBox(height: size.height * .02),
                // GestureDetector(
                //   onTap: () {},
                //   child: Text(
                //     'Esqueceu a senha?',
                //     textAlign: TextAlign.center,
                //     style: GoogleFonts.getFont('Poppins',
                //         decoration: TextDecoration.underline,
                //         color: Colors.black45,
                //         fontSize: 15,
                //         fontWeight: FontWeight.w400),
                //   ),
                // ),
                SizedBox(height: size.height * .01),
                ElevatedButton(
                  onPressed: _validateForm,
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * .02),
                      backgroundColor: Color(0xFF333333),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Entrar',
                    style: GoogleFonts.getFont('Poppins',
                        decoration: TextDecoration.none,
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /* Logica de login e interação com o usuário*/
  void _validateForm() async {
    final FormState? formState = keyForm.currentState;
    ScaffoldMessenger.of(context).clearSnackBars();

    if (formState != null && formState.validate()) {
      /* Exibir um alert informando que estamos processando os dados */
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                content: LoadingSendingData(),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ));

      setState(() {
        iconPassword = Icons.check_circle_rounded;
        colorIconPassword = Colors.green;
      });

      /* Montando o objeto para o envio */
      DtoPessoa dtoPessoa = DtoPessoa(
          emailContato: _textEmail.text, passwordString: _textPassword.text);

      Map<String, dynamic> mapResponseApi =
          await ApiPessoa.authUser(pessoa: dtoPessoa, context: context);

      /*Verificando se a tela está montada */
      if (mounted) {
        Navigator.of(context).pop();

        if (mapResponseApi['statusCode'] == 200) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const StartWidgetView()),
              (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(mapResponseApi['response'].toString()),
              elevation: 0,
              backgroundColor: Colors.redAccent));
        }
      }
    } else {
      setState(() {
        iconPassword = Icons.cancel;
        colorIconPassword = Colors.redAccent;
      });

      /* Dar um feedback para o usuário */
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.redAccent,
          content: Text('Não foi possível realizar o login.'),
        ),
      );
    }
  }
}
