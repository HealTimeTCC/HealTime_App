import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healtime/src/screens/screens_login_register/widgets/text_form_model.dart';

import '../../../../shared/background/screen_background.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  IconData iconPassword = Icons.check_circle_rounded;
  Color colorIconPassword = Colors.green;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
                              validator: false,
                              textLabel: 'Nome usuário/e-mail',
                              typeKeyboard: TextInputType.emailAddress,
                              size: size,
                              obscure: false),
                          ModelTextForm.modelTextForm(
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

  void _validateForm() {
    final FormState? formState = keyForm.currentState;

    if (formState != null && formState.validate()) {
      setState(() {
        iconPassword = Icons.check_circle_rounded;
        colorIconPassword = Colors.green;
      });

      /* Aqui vai ficar a validação do Login que vai verificar se está correto ou não */

    } else {
      setState(() {
        iconPassword = Icons.cancel;
        colorIconPassword = Colors.redAccent;
      });

      /* Dar um feedback para o usuário */
      ScaffoldMessenger.of(context).clearSnackBars();
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
