import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/screens_login_register/widgets/text_form_model.dart';
import 'package:healtime/src/screens/screens_navigation/home_page/home.dart';

import '../../../../services/api/api_pessoa.dart';
import '../../../../shared/background/screen_background.dart';
import '../../../../shared/dto/dto_pessoa_auth.dart';
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
    final Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPage(),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Entre com a sua conta',
                      style: GoogleFonts.getFont('Poppins',
                          decoration: TextDecoration.none,
                          color: const Color(0xff1c1c1c),
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: size.height * .02),
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
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Esqueceu a senha?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.underline,
                            color: Colors.black45,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: size.height * .06),
                    ElevatedButton(
                      onPressed: _validateForm,
                      style: ElevatedButton.styleFrom(
                          padding:
                          EdgeInsets.symmetric(vertical: size.height * .02),
                          backgroundColor: const Color(0xff1AE8E4),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45))),
                      child: Text(
                        'Entrar',
                        style: GoogleFonts.getFont('Poppins',
                            decoration: TextDecoration.none,
                            color: Colors.black45,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
          builder: (context) =>
          const AlertDialog(
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
          nomePessoa: _textEmail.text, passwordString: _textPassword.text);

      int statusCode = await ApiPessoa.authUser(pessoa: dtoPessoa);

      /*Verificando se a tela está montada */
      if (mounted) {
        Navigator.of(context).pop();

        if (statusCode == 200) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false);
        }
        else if (statusCode == 400) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Usuário/Senha inválidos'),
                  elevation: 0,
                  backgroundColor: Colors.redAccent));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Não foi possível realizar o login'),
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
